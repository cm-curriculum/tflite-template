import 'package:flutter/material.dart';
import 'dictionary.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'food_info.dart';

//The following code is based heavily off of code provided by:
//  -Teresa Wu https://spltech.co.uk/flutter-image-classification-using-tensorflow-in-4-steps/
//  -Nancy Patel https://medium.com/geekculture/image-classification-with-flutter-182368fea3b

class Classification extends StatefulWidget {
  const Classification({Key? key}) : super(key: key);

  @override
  _ClassificationState createState() => _ClassificationState();
}

class _ClassificationState extends State<Classification> {

  List? _listResult;
  PickedFile? _imageFile;
  bool _loading = false;

  File? _image;
  Image? _imageWidget;
  final picker = ImagePicker();

  FoodInfo? foodInfo;
  
  FoodInfo getCorrespondingFood(List<dynamic> l){
    String classification = l[0]["label"];
    switch (classification) {
      case "0 Steak":
        return FoodDictionary.allFoods["Steak"]!;
      case "1 Chocolate":
        return FoodDictionary.allFoods["Chocolate"]!;
      case "2 Fish":
        return FoodDictionary.allFoods["Fish"]!;
      case "3 Lettuce":
        return FoodDictionary.allFoods["Lettuce"]!;
      case "4 Banana":
        return FoodDictionary.allFoods["Banana"]!;
      case "5 Taco":
        return FoodDictionary.allFoods["Taco"]!;
      case "6 Cookie":
        return FoodDictionary.allFoods["Cookie"]!;
      case "7 Cake":
        return FoodDictionary.allFoods["Cake"]!;
      case "8 Corn":
        return FoodDictionary.allFoods["Corn"]!;
      case "9 Tomato":
        return FoodDictionary.allFoods["Tomato"]!;
      case "10 Potato":
        return FoodDictionary.allFoods["Potato"]!;
      case "11 Celery":
        return FoodDictionary.allFoods["Celery"]!;
      case "12 Apple":
        return FoodDictionary.allFoods["Apple"]!;
      case "13 Sandwich":
        return FoodDictionary.allFoods["Sandwich"]!;
      case "14 Egg":
        return FoodDictionary.allFoods["Egg"]!;
      case "15 Pasta":
        return FoodDictionary.allFoods["Pasta"]!;
      case "16 Rice":
        return FoodDictionary.allFoods["Rice"]!;
      case "17 Ice Cream":
        return FoodDictionary.allFoods["Ice Cream"]!;
      case "18 Pizza":
        return FoodDictionary.allFoods["Pizza"]!;
      case "19 Cheese":
        return FoodDictionary.allFoods["Cheese"]!;
      case "20 Almond":
        return FoodDictionary.allFoods["Almond"]!;
      case "21 Bacon":
        return FoodDictionary.allFoods["Bacon"]!;
      case "22 Bread":
        return FoodDictionary.allFoods["Bread"]!;
      case "23 Broccoli":
        return FoodDictionary.allFoods["Broccoli"]!;
      case "24 French Fries":
        return FoodDictionary.allFoods["French Fries"]!;
      case "25 Popcorn":
        return FoodDictionary.allFoods["Popcorn"]!;
      case "26 Salmon":
        return FoodDictionary.allFoods["Salmon"]!;
      case "27 Shrimp":
        return FoodDictionary.allFoods["Shrimp"]!;
      case "28 Watermelon":
        return FoodDictionary.allFoods["Watermelon"]!;
      case "29 Yogurt":
        return FoodDictionary.allFoods["Yogurt"]!;
      default:
        return FoodInfo("Null", 0, 0, 0, 0, 0, 0, 0, 0);
    }
  }
  
  @override
  void initState() {
    super.initState();
    _loading = true;
    _loadModel();
  }

  void _loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    ).then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  void processImage(PickedFile i) {
    _imageFile = i;
    _image = File(i!.path);
    _imageWidget = Image.file(_image!);
  }

  void _imageSelection() async {
    var imageFile = await ImagePicker().getImage(source: ImageSource.gallery).
    then((value) {
      if (value != null)
      {
        _imageClasification(value!);
      }
    });
  }

  void _cameraSelection() async {
    var imageFile = await ImagePicker().getImage(source: ImageSource.camera).
    then((value) {
      if (value != null)
        {
          _imageClasification(value!);
        }
    });
  }

  void _imageClasification(PickedFile image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.1,
      imageMean: 0,
      imageStd: 255,
    ).
    then((value) {
      setState(() {
        if (value == null) print("did not successfully load");
        print(value);
        _listResult = value;
        processImage(image);
        foodInfo = getCorrespondingFood(value!);
      });
    }
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Take a Picture!"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: _image == null
                  ? Text("No images selected",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.w400),
              )
                  :Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 2),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Container(
                    child: _imageWidget
                ),
              ),
            ),
            _listResult != null
                ? Column(
              children: [
                Text(foodInfo!.name,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text("Calories kcal" + foodInfo!.calories.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text("Cholesterol mg: " + foodInfo!.cholesterol.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text("Fat gram: " + foodInfo!.fat.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text("Carbs gram: " + foodInfo!.carbohydrates.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text("Sodium mg: " + foodInfo!.sodium.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text("Potassium gram: " + foodInfo!.potassium.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text("Protein gram: " + foodInfo!.protein.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text("Vitamin C mg: " + foodInfo!.vc.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
                : Container(),
          ],
        ),
      ),
        floatingActionButton: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                bottom: 10,
                right: 10,
                child: Row(
                  children: [
                    FloatingActionButton(
                        heroTag: null,
                        onPressed: _imageSelection,
                        child: Icon(Icons.add)
                    ),
                    FloatingActionButton(
                        heroTag: null,
                        onPressed: _cameraSelection,
                        child: Icon(Icons.add_a_photo_rounded)
                    ),
                  ],
                ),
              ),
            ]
        ),
    );
  }
}
