import 'package:ark_module_homepage_prakerja/utils/app_color.dart';
import 'package:flutter/material.dart';

class CheckboxWithText extends StatelessWidget {
  final String text;

  const CheckboxWithText(this.text, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(Icons.check_circle, size: 17, color: kPrimaryOrange1),
          ),
          const SizedBox(width: 12),
          Expanded(
              child: Text(
            text,
            style: const TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 14.5,
                color: kNewBlack2b),
          ))
        ],
      ),
    );
  }
}
