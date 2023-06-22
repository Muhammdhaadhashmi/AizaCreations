import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final double width;

  final bool isprefix;

  final String errorText;
  final String prefixIcon;
  final String labelText;

  final Color backcolor;
  final Color bordercolor;
  final TextInputType textInputType;

  final Function onchange;
  final VoidCallback onclick;

  CustomInputField({
    required this.labelText,
    this.prefixIcon = "",
    this.bordercolor = Colors.grey,
    required this.backcolor,
    required this.width,
    this.errorText = "",
    this.textInputType = TextInputType.text,
    required Key key,
    required this.controller,
    required this.hint,
    this.isprefix = false,
    required this.onchange,
    required this.onclick,
  }) : super(key: key);

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool showprefix = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        width: widget.width,
        child: widget.isprefix
            ? TextFormField(
                autofocus: false,
                onTap: widget.onclick,

                readOnly: true,
                inputFormatters: [
                  widget.isprefix
                      ? LengthLimitingTextInputFormatter(4)
                      : LengthLimitingTextInputFormatter(10),
                ],
                keyboardType: widget.textInputType,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // The validator receives the text that the user has entered.

                validator: (value) {
                  // if (value == null || value.isEmpty &&widget.errorText!="" ) {
                  //   return widget.errorText;
                  // }
                  return null;
                },
                style: TextStyle(
                  fontSize: 15,
                ),
                onChanged: widget.onchange(),
                cursorColor: Colors.grey,
                controller: widget.controller,
                obscureText: showprefix,
                decoration: InputDecoration(
                  labelText: widget.labelText,

                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.grey[600],
                    ),
                  ),

                  prefixIcon: Container(
                    width: 30,
                    height: 30,
                    child: Image(
                      image: NetworkImage("${widget.prefixIcon}"),
                      height: 20,
                      color: Colors.grey,
                    ),
                  ),

                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIconConstraints: BoxConstraints(
                      maxWidth: 50, maxHeight: 30, minHeight: 30, minWidth: 30),

                  // errorBorder: OutlineInputBorder(
                  //
                  //   borderRadius: BorderRadius.circular(5),
                  //   borderSide: BorderSide(color: Colors.red),
                  //
                  // ),

                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: widget.bordercolor),
                  ),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  fillColor: Colors.grey,
                  hintText: widget.hint,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: widget.bordercolor),
                  ),

                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: widget.bordercolor),
                  ),
                ),
              )
            : TextFormField(
                autofocus: false,
                onTap: widget.onclick,

                readOnly: true,
                inputFormatters: [
                  widget.isprefix
                      ? LengthLimitingTextInputFormatter(4)
                      : LengthLimitingTextInputFormatter(10),
                ],
                keyboardType: widget.textInputType,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // The validator receives the text that the user has entered.

                validator: (value) {
                  // if (value == null || value.isEmpty) {
                  //   return widget.errorText;
                  // }
                  return null;
                },
                style: TextStyle(
                  fontSize: 15,
                ),

                controller: widget.controller,

                decoration: InputDecoration(
                  labelText: widget.labelText,

                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.grey[600],
                    ),
                  ),

                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIconConstraints: BoxConstraints(
                      maxWidth: 50, maxHeight: 30, minHeight: 30, minWidth: 30),

                  // errorBorder: OutlineInputBorder(
                  //
                  //   borderRadius: BorderRadius.circular(5),
                  //   borderSide: BorderSide(color: Colors.red),
                  //
                  // ),

                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: widget.bordercolor),
                  ),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  fillColor: Colors.grey,
                  hintText: widget.hint,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: widget.bordercolor),
                  ),

                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: widget.bordercolor),
                  ),
                ),
              ),
      ),
    );
  }
}
