import 'package:deteksi_hama/configs/app_colors.dart';
import 'package:deteksi_hama/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(PageAnimationTransition(
          page: const DashboardScreen(),
          pageAnimationType: LeftToRightFadedTransition()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 200.w,
              child: Image.asset('assets/images/rat-splash.png'),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          children: [
            const Center(
              child: Text(
                "From",
                style: TextStyle(fontSize: 16, color: AppColors.textgrey),
              ),
            ),
            const Center(
              child: Text(
                "Kelompok B1",
                style: TextStyle(fontSize: 18, color: AppColors.black),
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
