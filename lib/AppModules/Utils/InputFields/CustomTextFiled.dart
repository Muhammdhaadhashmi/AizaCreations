import 'package:flutter/material.dart';

class CustomTextFiled extends StatefulWidget {
  final bool isPass;
  final bool isEmail;
  final bool isphone;
  final String hintText;
  final String errorText;
  final double width;
  final TextEditingController controller;
  final Function function;
  final TextInputType keyboard;
  CustomTextFiled(
      {Key? key,
      required this.isPass,
      this.keyboard = TextInputType.text,
      this.isEmail = false,
      this.isphone = false,
      required this.hintText,
      this.errorText = "",
      required this.width,
      required this.controller,
      required this.function})
      : super(key: key);

  @override
  _CustomTextFiledState createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    if (widget.isPass) {
      _showPassword = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();

    return Container(
      width: widget.width,
      child: TextFormField(
        keyboardType: widget.keyboard,
        obscureText: _showPassword,
        focusNode: focusNode,
        cursorColor: Colors.grey[500],
        validator: (value) {
          if (widget.isEmail) {
            if (value == null ||
                value.isEmpty ||
                !value.contains("@gmail.com")) {
              return widget.errorText;
            }
          } else if (widget.isphone) {
            if (value == null || value.isEmpty || value[0] != "+") {
              return widget.errorText;
            }
          } else if (value == null || value.isEmpty) {
            return widget.errorText;
          }

          return null;
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(34.0),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(34.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(34.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(34.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(34.0),
              borderSide: BorderSide(color: Colors.red),
            ),
            suffixIcon: widget.isPass
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        focusNode.unfocus();
                        focusNode.canRequestFocus = false;
                        _showPassword = !_showPassword;
                      });
                    },
                    child: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  )
                : SizedBox(),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey),
            hintText: widget.hintText,
            fillColor: Colors.grey[200],
            contentPadding: EdgeInsets.only(left: 20, top: 15, bottom: 15)),
        controller: widget.controller,
        onChanged: (value) {
          widget.function(value);
        },
      ),
    );
  }
}
