import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySvg extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final Widget? placeholder;

  const MySvg({
    Key? key,
    required this.assetName,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      color: color,
      fit: fit,
      placeholderBuilder: (BuildContext context) => placeholder ??
          Center(child: CircularProgressIndicator()),
    );
  }
}
