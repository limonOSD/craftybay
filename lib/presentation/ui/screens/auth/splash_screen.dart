import 'package:craftybay/presentation/state_holders/auth_controller.dart';
import 'package:craftybay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:craftybay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    moveToNextScreen();
    super.initState();
  }

  void moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    final bool isLogedIn = await Get.find<AuthController>().isLoggedIn();
    if (isLogedIn) {
      Get.offAll(const MainBottomNavScreen());
    } else {
      Get.offAll(() => const VerifyEmailScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(
              height: 16,
            ),
            Text('Version 1.0'),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
