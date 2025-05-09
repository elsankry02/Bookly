import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant/styles_manger.dart';

class CustomBookRating extends StatelessWidget {
  const CustomBookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.count,
  });

  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          rating.toString(),
          style: StylesManger.textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            '($count)',
            style: StylesManger.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
