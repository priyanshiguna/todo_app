import 'package:flutter/material.dart';

import '../../res/constant/app_strings.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              Image.asset(AppImages.splashLogo),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              const Text(
                AppStrings.title,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: AppStrings.fontOne,
                    fontSize: 26,
                    color: Color(0xFF363636)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const Text(
                AppStrings.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: AppStrings.fontTwo,
                    fontSize: 14,
                    color: Color(0xFF8D93AB)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
