import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final double width;
  final int maxLines;
  final double height;
  final bool isPass;
  final bool isProduct;
  final String errorText;

  final Color backcolor;
  final Color bordercolor;
  final TextInputType textInputType;

  final Function onchange;
  InputField({
    this.isProduct = false,
    this.bordercolor = Colors.grey,
    required this.backcolor,
    this.maxLines = 1,
    required this.width,
    required this.height,
    this.errorText = "",
    this.textInputType = TextInputType.text,
    required this.controller,
    required this.hint,
    this.isPass = false,
    required this.onchange,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool showpass = false;

  @override
  void initState() {
    super.initState();
    if (widget.isPass) {
      showpass = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        width: widget.width,
        child: TextFormField(
          autofocus: false,
          maxLines: widget.maxLines,
          inputFormatters: [
            widget.isPass
                ? LengthLimitingTextInputFormatter(4)
                : LengthLimitingTextInputFormatter(500),
          ],
          keyboardType: widget.textInputType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          // The validator receives the text that the user has entered.

          validator: widget.isProduct
              ? (value) {
                  // if (value == null || value.isEmpty) {
                  //   return widget.errorText;
                  // }
                  return null;
                }
              : (value) {
                  if (value == null || value.isEmpty) {
                    return widget.errorText;
                  }
                  return null;
                },
          style: TextStyle(
            fontSize: widget.isProduct ? 13 : 15,
          ),
          onChanged: widget.onchange(),
          cursorColor: Colors.grey,
          controller: widget.controller,
          obscureText: showpass,
          decoration: InputDecoration(
            suffixIcon: widget.isPass
                ? Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showpass = !showpass;
                        });
                      },
                      child: showpass
                          ? Container(
                              width: 30,
                              height: 30,
                              child: Image(
                                image: AssetImage("assets/auth/closeeye.png"),
                                height: 20,
                                color: Colors.grey,
                              ),
                            )
                          : Container(
                              width: 30,
                              height: 30,
                              child: Image(
                                image: AssetImage("assets/auth/openeye.png"),
                                color: Colors.grey,
                                height: 10,
                              ),
                            ),
                    ),
                  )
                : const SizedBox(),

            suffixIconConstraints: BoxConstraints(
                maxWidth: 50, maxHeight: 30, minHeight: 30, minWidth: 30),
            // disabledBorder: InputBorder.none,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.red),
              // borderRadius: BorderRadius.only(
              //   topRight: Radius.elliptical(120, 120),
              // ),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: widget.bordercolor),
              // borderRadius: BorderRadius.only(
              //   topRight: Radius.elliptical(120, 120),
              // ),
            ),
            contentPadding:
                new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            fillColor: Colors.grey,
            hintText: widget.hint,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: widget.bordercolor),
              // borderRadius: BorderRadius.only(
              //   topRight: Radius.elliptical(120, 120),
              // ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: widget.bordercolor),
              // borderRadius: BorderRadius.only(
              //   topRight: Radius.elliptical(120, 120),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
