import 'package:farm_app/helpers/consts.dart';
import 'package:farm_app/providers/splash_provider.dart';
import 'package:farm_app/screens/on_boarde_screens/on_boarder_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    fadingAnimation = Tween<double>(begin: .2, end: 1).animate(animationController!);
    animationController!.repeat(reverse: true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashProvider>(context, listen: false)
          .startSplashScreen(context, const OnBoarderView());
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xff69A03A),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Spacer(flex: 2), 
            FadeTransition(
              opacity: fadingAnimation!,
              child: const Text(
                'Fruit Market',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, 
                ),
              ),
            ),
            Image.asset('assets/images/splash_view_image.png',
            fit: BoxFit.contain, // لضمان احتواء الصورة بشكل صحيح
              width: SizeConfig.screenWidth,),
            
          ],
        ),
      ),
    );
  }
}