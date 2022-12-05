import 'package:flutter/material.dart';

class ErrorNetworkImageWidgets extends StatelessWidget {
  double? width;
  double? height;
  double? iconSize;
  Color? iconColor;
  bool isImage;
  Widget? child;
  ErrorNetworkImageWidgets({
    Key? key,
    this.child,
    this.height,
    this.width,
    this.iconColor,
    this.iconSize,
    this.isImage = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: isImage == true
            ? Image.asset(
                'assets/images/logo-arkademi.png',
                fit: BoxFit.fill,
                color: Colors.blue,
              )
            : child,
      ),
    );
  }
}
