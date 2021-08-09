part of 'this.dart';

class UPButton extends TextButton {
  UPButton({
    Key? key,
    required VoidCallback? onPressed,
    required Widget child,
    ButtonStyle style = const ButtonStyle(),
  }) :
      super(
        key: key,
        onPressed: onPressed,
        child: child,
        style: style.merge(defaultStyle),
      );

  static final ButtonStyle defaultStyle = styleFrom(
    primary: UPColors.white,
    backgroundColor: UPColors.blue,
    textStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    side: BorderSide.none,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    alignment: Alignment.center,
    fixedSize: Size.square(32.0),
    minimumSize: Size.square(32.0),
    padding: const EdgeInsets.all(8.0),
  );

  static ButtonStyle styleFrom({
    Color? primary,
    Color? backgroundColor,
    TextStyle? textStyle,
    BorderSide? side,
    OutlinedBorder? shape,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Size? fixedSize,
    Size? minimumSize,
  }) {
    return TextButton.styleFrom(
      primary: primary,
      backgroundColor: backgroundColor,
      textStyle: textStyle,
      side: side,
      shape: shape,
      alignment: alignment,
      fixedSize: fixedSize,
      padding: padding,
      minimumSize: minimumSize,
    );
  }
}