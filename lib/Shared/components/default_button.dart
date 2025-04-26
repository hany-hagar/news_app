
import 'package:flutter/material.dart';

Widget defaultButton(
    {
      double width = double.infinity,
      double height = 50,
      double borderRadius = 25,
      required String title,
      required Function()? onPressed,
      Color textColor =  Colors.white,
      FontWeight weight = FontWeight.w600,
      double fontSize = 15,
      Color containerColor =  const Color.fromRGBO(7, 48, 142, 1.0),
    }
    )=>Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(borderRadius),
    ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          title,
          style:TextStyle(
        color: textColor,
        fontWeight: weight,
        fontSize: fontSize,
      ),
      ),
   ),
 );