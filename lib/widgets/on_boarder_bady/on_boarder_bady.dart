import 'package:dots_indicator/dots_indicator.dart';
import 'package:farm_app/helpers/constants.dart';
import 'package:farm_app/helpers/consts.dart';
import 'package:farm_app/helpers/widgets/custom_general_buttom.dart';
import 'package:farm_app/screens/auth/login.dart';

import 'package:farm_app/widgets/intro_pages/cutom_page_view.dart';
import 'package:flutter/material.dart';

class OnBoarderBady extends StatefulWidget {
  const OnBoarderBady({super.key});

  @override
  State<OnBoarderBady> createState() => _OnBoarderBadyState();
}

class _OnBoarderBadyState extends State<OnBoarderBady> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {}); 
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CutomPageView(pageController: pageController),
        Positioned(
          left: 0,
          right: 0,
          bottom: SizeConfig.defaultSize! * 25,
          child: DotsIndicator(
            dotsCount: 3,
            position:(pageController?.hasClients ?? false) 
                    ? pageController!.page! 
                   : 0.0,
            decorator: DotsDecorator(
              activeColor: kMainColor,
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        ),
      

        Visibility(
          visible: (pageController?.hasClients ?? false) 
                  ? (pageController!.page! < 1.5) 
                  : true,
          child: Positioned(
            top: SizeConfig.defaultSize! * 18,
            right: 32,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: kMainColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: kMainColor,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
        Positioned(
          left: SizeConfig.defaultSize! * 10,
          right: SizeConfig.defaultSize! * 10,
          bottom: SizeConfig.defaultSize! * 10,
          child: CustomGeneralButtom(
            onTap: () {
              if (pageController!.page! < 2) { 
                pageController!.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              } else {
 
                Navigator.of(context).pushReplacement(
                 MaterialPageRoute(
                 builder: (context) => const LoginPage(),
        ),
      );
              }
            },
            text: (pageController?.hasClients ?? false)
                 ? (pageController!.page! > 1.5 ? 'Get Started' : 'Next')
                : 'Next',
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }
}