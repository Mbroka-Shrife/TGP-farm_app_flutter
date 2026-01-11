import 'package:farm_app/helpers/constants.dart';
import 'package:farm_app/helpers/consts.dart';
import 'package:flutter/material.dart';

class CustomGeneralButtom extends StatelessWidget {
  const CustomGeneralButtom({super.key, required this.text, this.onTap});
   
   final String? text;
   final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap, 
      child: Container(
        height: 40,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(8),
        ),
        
      child: Center(
        child: Text(
          text!,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: Colors.white, 
             fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      ),
    );
    
  }
}