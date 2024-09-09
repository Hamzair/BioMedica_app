import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final TextAlign? textAlign;
  final String text;
  final Color textColor;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? fontsize;
  final FontWeight fontWeight;
  final double? height;
  const CustomText(
      {super.key,
        required this.text,
        required this.textColor,
        this.fontsize,
        required this.fontWeight,
        this.height,
        this.maxLines,
        this.overflow, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      text,
      style: GoogleFonts.jost(
        textStyle: TextStyle(
            color: textColor,
            fontSize: fontsize,
            fontWeight: fontWeight,
            height: height),
      ),
    );
  }
}