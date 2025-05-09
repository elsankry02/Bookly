import 'package:flutter/material.dart';

import '../constant/styles_manger.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: StylesManger.textStyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
