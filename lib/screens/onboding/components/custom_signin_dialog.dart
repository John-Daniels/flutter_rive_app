import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rive_app/screens/onboding/components/signin_form.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future customSiginDialog(context, {required ValueChanged onClosed}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Sign In',
    transitionBuilder: (_, animation, __, child) {
      Tween<Offset> tween = Tween(
        begin: const Offset(0, -1),
        end: Offset.zero,
      );

      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      );
    },
    transitionDuration: const Duration(seconds: 1),
    pageBuilder: (context, _, __) => Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          // clipBehavior: Clip.hardEdge,

          height: MediaQuery.of(context).size.height * 0.76,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.94),
            borderRadius: const BorderRadius.all(Radius.circular(40)),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 34,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Acess to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift. ',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SigninForm(),
                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: Text(
                            'OR',
                            style: TextStyle(
                              color: Colors.black26,
                            ),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        'Sign up with Email, Apple or Google',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        LoginFlavour(
                          icon: 'assets/icons/email_box.svg',
                        ),
                        LoginFlavour(
                          icon: 'assets/icons/apple_box.svg',
                        ),
                        LoginFlavour(
                          icon: 'assets/icons/google_box.svg',
                        )
                      ],
                    )
                  ],
                ),
                const Positioned(
                  left: 0,
                  right: 0,
                  bottom: -48,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.close, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ).then(onClosed);
}

class LoginFlavour extends StatelessWidget {
  const LoginFlavour({
    super.key,
    this.onTap,
    required this.icon,
  });

  final VoidCallback? onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      icon: SvgPicture.asset(
        icon,
        height: 64,
        width: 64,
      ),
    );
  }
}
