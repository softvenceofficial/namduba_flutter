import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanduba/constants/colors.dart';

class MyText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final double? height;

  const MyText({
    Key? key,
    required this.text,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.decoration, this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.getFont(
        fontFamily ?? 'Poppins',
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
        decoration: decoration ?? TextDecoration.none ,
        decorationColor: color,
      height: height,

      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,

    );
  }
}
