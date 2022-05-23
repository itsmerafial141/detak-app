import '../values/consts.dart';

double percentageOfSize(double size, double percentage) {
  return size * percentage / 100;
}

double percentageOfScreenHeight(double percentage) {
  return percentageOfSize(screenHeight, percentage);
}

double percentageOfScreenWidth(double percentage) {
  return percentageOfSize(screenWidth, percentage);
}
