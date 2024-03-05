import 'package:flutter/material.dart';
import 'package:geceden_app/views/geceden_styles.dart';

class GecedenButtonStyle extends StatefulWidget {

  final Function() onTap;
  final double paddingAll;
  final double marginHorizontal;
  final String buttonText;
  final Color borderColor;

  const GecedenButtonStyle({
    super.key,
    required this.onTap,
    required this.borderColor,
    required this.paddingAll,
    required this.marginHorizontal,
    required this.buttonText,
  });

  @override
  State <GecedenButtonStyle> createState() => _GecedenButtonStyleState();
}

class _GecedenButtonStyleState extends State<GecedenButtonStyle> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(widget.paddingAll),
        margin: EdgeInsets.symmetric(horizontal: widget.marginHorizontal),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(48, 39, 53, 0.7),
         border: Border.all(
           color: widget.borderColor,
           width: 0.7,
         ),
         borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: GecedenTextStyles.buttonText,
          )
        ),
      ),
    );
  }
}

class StringButtonStyle extends StatefulWidget {
  
  final String text;
  final Function() onTap;
  
  const StringButtonStyle({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  State <StringButtonStyle> createState() => _StringButtonStyleState();
}

class _StringButtonStyleState extends State <StringButtonStyle> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Text(
        widget.text,
        style: GecedenTextStyles.registerText,
      ),
    );
  }
}

class ImageButtonStyle extends StatefulWidget {

  final Function() onTap;
  final String path;

  const ImageButtonStyle({
    super.key,
    required this.path,
    required this.onTap,
  });

  @override
  State <ImageButtonStyle> createState() => _ImageButtonStyleState();
}

class _ImageButtonStyleState extends State <ImageButtonStyle> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: GecedenColors.formFieldBackGroundColor,
          border: Border.all(
            color: GecedenColors.iconColor,
            width: 1.0
            ),
          borderRadius: BorderRadius.circular(15),
        ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Image.asset(
          widget.path,
          width: 50,
          height: 50,
          color: GecedenColors.buttonGreyBorderColor,
          ),
        )
      ),
    );
  }
}
