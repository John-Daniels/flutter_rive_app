import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rive_app/screens/onboding/components/custom_signin_dialog.dart';
import 'package:flutter_rive_app/widgets/buttons/animation_btn.dart';
import 'package:rive/rive.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btnAnimController;
  bool isSignInDialogShown = false;

  @override
  void initState() {
    _btnAnimController = OneShotAnimation(
      'active',
      autoplay: false,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 200,
            left: 100,
            width: MediaQuery.of(context).size.width * 1.7,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          Container(
            child: const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: Container(),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            top: isSignInDialogShown ? -60 : 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: const [
                          Text(
                            'Learn design & code',
                            style: TextStyle(
                              fontSize: 60,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Don\'t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.',
                          )
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    AnimatedBtn(
                      btnAnimController: _btnAnimController,
                      onTap: () {
                        _btnAnimController.isActive = true;

                        Future.delayed(const Duration(milliseconds: 800), () {
                          setState(() {
                            isSignInDialogShown = true;
                          });
                          customSiginDialog(context, onClosed: (_) {
                            setState(() {
                              isSignInDialogShown = false;
                            });
                          });
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      child: Text(
                        'Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
