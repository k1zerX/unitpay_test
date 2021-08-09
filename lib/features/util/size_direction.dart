part of 'this.dart';

extension SizeDirection on Size {
  double main(Axis direction) {
    switch (direction) {
      case Axis.vertical: return height;
      case Axis.horizontal: return width;
    }
  }

  double cross(Axis direction) {
    switch (direction) {
      case Axis.vertical: return width;
      case Axis.horizontal: return height;
    }
  }

  double mainRatio(Axis direction) => main(direction) / cross(direction);
  double crossRatio(Axis direction) => cross(direction) / main(direction);
}