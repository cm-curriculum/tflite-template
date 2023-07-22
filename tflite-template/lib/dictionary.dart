import 'detected_class.dart';

class LookUp{
  static Map<String, DetectedClass> allInfo =
  {
    "0 Steak": DetectedClass("Steak", 270, 78, 19, 0, 58, 279, 25, 0),
    "1 Chocolate": DetectedClass("Chocolate", 545.6, 8, 31, 61, 24, 559, 4.9, 0),
    "2 Fish": DetectedClass("Fish", 205.8, 63, 12, 0, 61, 384, 22, 3.7),
    "3 Lettuce": DetectedClass("Lettuce", 14.8, 0, 0.2, 2.9, 28, 194, 1.4, 9.2),
    "4 Banana": DetectedClass("Banana", 88, 0, 0.3, 23, 1, 358, 1.1, 8.7),
    "5 Taco": DetectedClass("Taco", 226, 28, 13, 20, 397, 209, 9, 0.4),
    "6 Cookie": DetectedClass("Cookie", 501.9, 28, 24, 65, 524, 100, 6, 0),
    "7 Cake": DetectedClass("Cake", 346.1, 3, 14, 49, 506, 106, 6, 0.2),
    "8 Corn": DetectedClass("Corn", 106, 4, 2.4, 22, 20, 246, 3.1, 3.7),
    "9 Tomato": DetectedClass("Tomato", 17, 0, 0.2, 3.9, 5, 237, 0.9, 13.7),
    "10 Potato": DetectedClass("Potato", 76, 0, 0.1, 17, 6, 421, 2, 19.7),
    "11 Celery": DetectedClass("Celery", 6.4, 0, 0.068, 1.2, 32, 104, 0.3, 1.24),
    "12 Apple": DetectedClass("Apple", 52.1, 0, 0.16, 15.4, 1, 104, 0.15, 4.6),
    "13 Sandwich": DetectedClass("Sandwich", 283, 33, 16, 21, 526, 194, 13, 4.9),
    "14 Egg": DetectedClass("Egg", 150, 372, 10, 1, 129, 132, 12.5, 0),
    "15 Pasta": DetectedClass("Pasta", 131, 33, 1.1, 25, 16, 24, 5, 0),
    "16 Rice": DetectedClass("Rice", 130, 0, 0.3, 28, 1, 35, 2.7, 0),
    "17 Ice Cream": DetectedClass("Ice Cream", 207, 44, 11, 24, 80, 199, 3.5, 0.6),
    "18 Pizza": DetectedClass("Pizza", 266, 17, 10, 33, 598, 172, 11, 1.4),
    "19 Cheese": DetectedClass("Cheese", 371, 100, 32, 3.7, 1671, 173, 17.5, 0),
    "20 Almond": DetectedClass("Almond", 579, 0, 49.93, 21.55, 1, 733, 21.15, 0),
    "21 Bacon": DetectedClass("Bacon", 540, 110, 42, 1.4, 1717, 565, 37, 0),
    "22 Bread": DetectedClass("Bread", 264, 0, 3.2, 49, 491, 115, 9, 0),
    "23 Broccoli": DetectedClass("Broccoli", 35, 0, 0.3, 7.2, 41, 293, 2.4, 65),
    "24 French Fries": DetectedClass("French Fries", 311, 0, 15, 41, 210, 579, 3.4, 4.7),
    "25 Popcorn": DetectedClass("Popcorn", 374, 66, 4.3, 74, 7, 274, 11, 0),
    "26 Shrimp": DetectedClass("Shrimp", 99, 189, 0.3, 0.2, 111, 259, 24, 0),
    "27 Watermelon": DetectedClass("Watermelon", 30, 0, 0.2, 8, 1, 112, 0.6, 8.1),
    "28 Yogurt": DetectedClass("Yogurt", 58, 5, 0.4, 3.6, 36, 141, 10, 0),
    "29 Salmon": DetectedClass("Salmon", 208, 55, 13, 0, 59, 363, 20, 3.9),

    'default': DetectedClass("Default", 0, 0, 0, 0, 0, 0, 0, 0)
  };
}