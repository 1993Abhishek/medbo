import 'package:medbo/utils/app_colors.dart';
import 'package:medbo/utils/app_dimen.dart';
import 'package:medbo/utils/appview_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef OnTextChangeValidator<String> = bool Function(String value);

class CustomTextFieldWidget extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool readOnly;
  final int maxLines;
  final int minLines;
  final int maxLength;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final Widget suffixIcon;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onTap;
  final Color selectedColor;
  final Color unSelectedColor;
  final Function onSubmitted;
  final String readOnlyValue;
  final bool obscureText;
  final List<TextInputFormatter> inputFormatter;
  final TextStyle textStyle;
  final TextStyle labelTextStyle;
  final double gapBetween;
  final EdgeInsetsGeometry contentPadding;
  final OnTextChangeValidator<String> textChangeValidator;
  final Function onChange;
  final double elevation;
  final bool expands;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;

  CustomTextFieldWidget({
    this.textAlignVertical,
    this.textAlign,
    this.expands = false,
    this.labelText,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.inputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.none,
    this.hintText = "",
    this.suffixIcon,
    this.controller,
    this.focusNode,
    this.onTap,
    this.selectedColor,
    this.unSelectedColor,
    this.onSubmitted,
    this.readOnlyValue = "",
    this.obscureText = false,
    this.inputFormatter,
    this.textStyle,
    this.labelTextStyle,
    this.gapBetween,
    this.minLines,
    this.contentPadding,
    this.textChangeValidator,
    this.onChange,
    this.elevation = 1,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFieldWidget> {
  Color selectedColor, colorUnSelected, cardColor;
  Widget checkWidget = Icon(
    Icons.check,
    color: Colors.white70,
    size: hDimen(18),
  );
  bool textChangeValidationSuccess = false;

  final TextStyle textStyle = TextStyle(
    color: Colors.black54,
    fontSize: hDimen(16),
  );
  final TextStyle hintTextStyle = TextStyle(
    color: Colors.black45,
    fontSize: hDimen(18),
  );

  final OutlineInputBorder normalBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(hDimen(8)),
      borderSide: BorderSide(color: Colors.white60, width: 0.8));

  final OutlineInputBorder transparentBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(hDimen(8)),
      borderSide: BorderSide(color: Colors.transparent, width: 0));

  final OutlineInputBorder selectedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(hDimen(8)),
      borderSide: BorderSide(color: Colors.white70, width: 1.2));

  @override
  void initState() {
    selectedColor = widget.selectedColor != null
        ? widget.selectedColor
        : AppColor.colorPrimary;
    colorUnSelected = widget.unSelectedColor != null
        ? widget.unSelectedColor
        : AppColor.colorPrimary;
    cardColor = widget.unSelectedColor != null
        ? widget.unSelectedColor
        : AppColor.colorPrimary;
    if (widget.focusNode != null) {
      widget.focusNode.addListener(() {
        setState(() {
          cardColor =
          widget.focusNode.hasFocus ? selectedColor : colorUnSelected;
        });
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: widget.elevation,
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          hDimen(8),
        ),
      ),
      child: widget.readOnly
          ? GestureDetector(
        onTap: () {
          if (widget.onTap != null) widget.onTap();
        },
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
              left: hDimen(20),
              right: hDimen(widget.suffixIcon != null ? 15 : 20)),
          height: hDimen(60),
          width: double.infinity,
          decoration: BoxDecoration(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  widget.readOnlyValue.isEmpty
                      ? widget.hintText
                      : widget.readOnlyValue,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: widget.readOnlyValue.isEmpty
                      ? hintTextStyle
                      : (widget.textStyle != null
                      ? widget.textStyle
                      : textStyle),
                ),
              ),
              widget.suffixIcon != null
                  ? widget.suffixIcon
                  : Container()
            ],
          ),
        ),
      )
          : TextFormField(
        textAlignVertical: widget.textAlignVertical,
        expands: widget.expands,
        scrollPhysics: BouncingScrollPhysics(),
        scrollPadding: EdgeInsets.all(0),
        //initialValue: widget.readOnlyValue,
        readOnly: widget.readOnly,
        maxLines: widget.maxLines,
        enableSuggestions: false,
        focusNode: widget.focusNode,
        controller: widget.controller,
        inputFormatters: widget.inputFormatter,
        onTap: () {
          if (widget.onTap != null) widget.onTap();
        },
        onFieldSubmitted: (value) {
          if (widget.onSubmitted != null) {
            widget.onSubmitted(value);
          }
        },
        obscureText: widget.obscureText,
        maxLength: widget.maxLength,
        cursorColor: Colors.white,
        minLines: widget.minLines,
        keyboardType: widget.inputType,
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        textAlign: widget.textAlign == null
            ? TextAlign.start
            : widget.textAlign,
        onChanged: (value) {
          if (widget.onChange != null) widget.onChange(value);

          if (widget.textChangeValidator != null) {
            //mPrintln("validation successful");
            setState(() {
              textChangeValidationSuccess =
                  widget.textChangeValidator(value);
            });
          }
        },
        decoration: InputDecoration(
          contentPadding: widget.contentPadding != null
              ? widget.contentPadding
              : EdgeInsets.only(
              left: hDimen(20),
              right: hDimen(widget.suffixIcon != null ? 0 : 20)),
          counterText: '',
          hintText: widget.hintText,
          hintStyle: hintTextStyle,
          enabledBorder: transparentBorder,
          focusedBorder: selectedBorder,
          border: transparentBorder,
          suffixIcon: (widget.textChangeValidator != null &&
              textChangeValidationSuccess)
              ? checkWidget
              : widget.suffixIcon,
        ),
        style:
        widget.textStyle != null ? widget.textStyle : textStyle,
      ),
    );
  }
}
