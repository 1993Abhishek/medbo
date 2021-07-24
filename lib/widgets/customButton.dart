import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medbo/utils/app_dimen.dart';

class CustomButton extends StatefulWidget {
  final double width;
  final double height;
  final Color buttonColor;
  final Function onClick;
  final double elevation;
  final String buttonText;

  const CustomButton({
    Key key,
    this.buttonText,
    this.elevation,
    this.height,
    this.width,
    this.buttonColor,
    this.onClick,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Card(
        elevation: widget.elevation,
        color: widget.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            hDimen(10),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(
            left: hDimen(20),
            right: hDimen(20),
          ),
          height: widget.height != null ? widget.height : hDimen(60),
          width: widget.width,
          child: Center(
            child: Text(
              widget.buttonText,
              style: TextStyle(
                color: Colors.white,
                fontSize: hDimen(15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
