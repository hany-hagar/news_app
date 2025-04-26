
// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

// ignore: unused_import
import 'package:flutter/material.dart';
Widget defaultTextField({
  double width = double.infinity,
  double height = 40,
  bool isReadOnly = false,
  required TextEditingController controller,
  bool isHiddenInputBorder = false,
  bool isOutlineInputBorder = true,
  double borderRadius = 10,
  double borderWidth = 2,
  Color borderColor = Colors.black,
  BorderStyle borderStyle = BorderStyle.solid,
  bool isEnablePrefixIcon = true,
  IconData? prefixIcon,
  double iconSize = 20,
  Color iconColor = Colors.black,
  bool isEnableSuffixIcon = false,
  IconData? suffixIcon,
  bool isLabelText = true,
  required String title ,
  double titleSize = 15,
  FontWeight titleWeight = FontWeight.w800,
  Color titleColor = Colors.black,
  double inputSize = 15,
  FontWeight inputWeight = FontWeight.w800,
  Color inputColor = Colors.black,
  bool isObscureText = false,
  required TextInputType keyboardType,
  Brightness keyboardMode = Brightness.light,
  bool isEnableSuggestions = true,
  Function()? onTap ,
  Function(String)? onFieldSubmitted ,
  Function(String?)? onChanged ,
  Function(String?)? onSaved ,
  required String? Function(String?) validator,
})=> Container(
  width: width,
  height: height,
  child: TextFormField(
    controller: controller,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.only(bottom: 10),
      border: isHiddenInputBorder ?  InputBorder.none :isOutlineInputBorder ?OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide:  BorderSide(
            color:borderColor,
            width: borderWidth,
            style: borderStyle,
          )
      ) : UnderlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide:  BorderSide(
            color:borderColor,
            width: borderWidth,
            style: borderStyle,
          )) ,
      prefixIcon: isEnablePrefixIcon ?Icon(
        prefixIcon,
        color: iconColor,
        size: iconSize,
      ) : null,
      labelText: isLabelText ?title:null,
      hintText: isLabelText ?null:title,
      labelStyle: TextStyle(
        color:titleColor,
        fontSize: titleSize,
        fontWeight: titleWeight,
      ),
      hintStyle: TextStyle(
        color:titleColor,
        fontSize: titleSize,
        fontWeight: titleWeight,
      ),
      suffixIcon: isEnableSuffixIcon ? Icon(
        suffixIcon,
        color: iconColor,
        size: iconSize,
      ) : null,
    ),
    style: TextStyle(
      fontSize: inputSize,
      fontWeight: inputWeight,
      color: titleColor,
    ),
    obscureText: isObscureText,
    keyboardType:keyboardType,
    keyboardAppearance: keyboardMode,
    enableSuggestions: isEnableSuggestions,
    onTap: onTap,
    onFieldSubmitted: onFieldSubmitted,
    onChanged: onChanged,
    onSaved: onSaved,
    validator:validator,
    readOnly: isReadOnly,
  ),
);