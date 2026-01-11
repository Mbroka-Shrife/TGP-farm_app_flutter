import 'package:farm_app/helpers/consts.dart';
import 'package:farm_app/helpers/space_widget.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, this.title, this.supTitle, this.image});
  final String? title;
  final String? supTitle;
  final String? image ;


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const VerticalSpace(18),
        SizedBox(
          height: SizeConfig.defaultSize! * 20,
         child:  Image.asset(image!),
        ),
        const VerticalSpace(3),
        Text(
          title!,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        const VerticalSpace(1.5),
        Text(
          supTitle!,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 15,
            color: Color(0xff78787c),
          ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}