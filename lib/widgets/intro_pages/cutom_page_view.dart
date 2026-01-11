import 'package:farm_app/widgets/intro_pages/page_view_item.dart';
import 'package:flutter/material.dart';

class CutomPageView extends StatelessWidget {
  const CutomPageView({super.key, required this.pageController});

  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        PageViewItem(
          image: 'assets/images/onboarding1.png',
          title: 'E Shopping',
          supTitle: 'Explore top organic fruits & grab them',
        ),
        PageViewItem(
          image: 'assets/images/onboarding2.png',
          title: 'Delivery on the way',
          supTitle: 'Get your order by speed delivery',
        ),
        PageViewItem(
          image: 'assets/images/onboarding3.png',
          title: 'Delivery Arrived',
          supTitle: 'Order is arrived at your place',
        )
      ],
    );
  }
}