import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/screens/onboding/components/animated_btn.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btnAnimationColtroller;

  @override
  void initState() {
    _btnAnimationColtroller = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //배경 작업
        Positioned(
          width: MediaQuery.of(context).size.width * 1.7,
          bottom: 150,
          left: 100,
          child: Image.asset("assets/Backgrounds/Spline.png"),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: const SizedBox(), //이거 없으면 적용 안됨
          ),
        ),
        const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
            child: const SizedBox(),
          ),
        ),
        //글자
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const SizedBox(
                  width: 260,
                  child: Column(
                    children: [
                      Text(
                        "Learn design & code",
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: "Poppins",
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                          "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools."),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
                AnimatedBtn(
                  btnAnimationcontroller: _btnAnimationColtroller,
                  press: () {
                    _btnAnimationColtroller.isActive = true;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.",
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
