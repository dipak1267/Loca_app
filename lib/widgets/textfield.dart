import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

 class App_TextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType type;
  final bool isPassword;
  final bool isHidden;
  final bool isEdited;
  final Color cursorColour;
  final int maxLines;
  final FormFieldValidator<String> validator;

  const App_TextField(
      {Key key,
      this.controller,
      this.label,
      this.type,
      this.isPassword = false,
      this.isHidden = false,
      this.isEdited = false,
      this.maxLines =1 ,
        this.cursorColour,
      this.validator})
      : super(key: key);

  @override
  _App_TextFieldState createState() => _App_TextFieldState();
}

class _App_TextFieldState extends State<App_TextField> {
  @override
  bool _showPassword = false;
  Widget build(BuildContext context) {

    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          color: widget.cursorColour,
        ),
        border: App_TextFieldBorder(widget.isEdited),
        focusedBorder: App_TextFieldBorder(widget.isEdited),
        enabledBorder: App_TextFieldBorder(widget.isEdited),
        suffixIcon: widget.isPassword && !widget.isHidden
            ? Material(
               color: Colors.transparent,
                child: IconButton(
                 icon: Icon(
               _showPassword
                  ? Icons.remove_red_eye_rounded
                  : Icons.lock_open_outlined,
              color: widget.isEdited ? Colors.black12 : Colors.white,
             size: 20,
            ),
            onPressed: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
          ),
        )
            : null,
      ),
      style: App_TextFieldTextStyle(widget.isEdited),
      cursorColor: widget.cursorColour,
      keyboardType: widget.type,
      textCapitalization: widget.type == TextInputType.emailAddress
          ? TextCapitalization.none
          : TextCapitalization.sentences,
      obscureText: !_showPassword && widget.isPassword,
      maxLines: widget.maxLines,
      validator: widget.validator,
    );
  }
}
UnderlineInputBorder App_TextFieldBorder(bool isEdited) {
  return UnderlineInputBorder(
      borderSide:
      BorderSide(color: isEdited ? Color(0XFFE5E5E5) : Colors.white));
}
TextStyle App_TextFieldTextStyle(bool isEdited) {
  return GoogleFonts.sourceSansPro(
      color: isEdited ? Colors.black : Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600);
}