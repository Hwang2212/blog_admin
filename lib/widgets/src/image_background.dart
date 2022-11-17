import 'package:flutter/material.dart';

class ImageBackground extends StatelessWidget {
  final String backgroundPath;
  const ImageBackground({Key? key, required this.backgroundPath})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      backgroundPath,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
