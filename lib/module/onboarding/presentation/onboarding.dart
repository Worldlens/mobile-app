import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/media_res.dart';
import 'package:flutter_application_1/module/connect_wallet/presentation/connect_wallet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding/onboarding.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  static const routeName = "/onboard";

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  int index = 0;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  void initState() {
    _animationController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onboardingPagesList = [
      PageModel(
        widget: const Image(
          image: AssetImage(
            MediaRes.onBoarding1,
          ),
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
      PageModel(
        widget: const Image(
          image: AssetImage(
            MediaRes.onBoarding2,
          ),
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
      PageModel(
        widget: const Image(
          image: AssetImage(
            MediaRes.onBoarding3,
          ),
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
    ];

    return Scaffold(
      body: AnimatedContainer(
          decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    MediaRes.onBoardBg,
                  ))),
          duration: const Duration(seconds: 1),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 555.h,
                    color: Colors.black,
                    child: Onboarding(
                      pages: onboardingPagesList,
                      onPageChange: (int pageIndex) {
                        setState(() {
                          index = pageIndex;
                        });
                      },
                      startPageIndex: 0,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: index,
                    count: 3,
                    effect: ExpandingDotsEffect(
                        dotHeight: 6,
                        dotWidth: 6,
                        dotColor: Colors.white.withOpacity(0.33),
                        activeDotColor: const Color(0xFF19FB9B)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            index == 0
                                ? "Scan & Identify Products"
                                : index == 1
                                    ? "Register New Items"
                                    : "Earn Rewards",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            index == 0
                                ? "Quickly scan barcodes to retrieve product information and add to your collection."
                                : index == 1
                                    ? "Register products not in our database by scanning or manual entry to earn points"
                                    : "Accumulate points with every new product submission to redeem for NFTs and more.",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: SlideAction(
                                sliderRotate: false,
                                alignment: Alignment.center,
                                sliderButtonYOffset: -25,
                                sliderButtonIcon: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0xFF19FB9B),
                                          // shadow color
                                          spreadRadius: 12,
                                          // how wide the shadow should spread
                                          blurRadius: 99,
                                          // how blurry the shadow should be
                                          offset: Offset(0,
                                              0), // the position of the shadow
                                        ),
                                      ],
                                      color: const Color(0xFF19FB9B),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                      border: Border.all(
                                          color: Colors.white, width: 4)),
                                  height: 66.h,
                                  width: 98.w,
                                  child: Center(
                                      child: Text(
                                    "GO",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700),
                                  )),
                                ),
                                borderRadius: 12.r,
                                height: 56.h,
                                onSubmit: () {
                                  Future.delayed(
                                    const Duration(seconds: 1),
                                  );
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    ConnectWalletScreen.routeName,
                                    (route) => false,
                                  );
                                  return null;
                                },
                                animationDuration:
                                    const Duration(milliseconds: 500),
                                innerColor: Colors.transparent,
                                outerColor: const Color(0xFF371141),
                                submittedIcon:
                                    SvgPicture.asset(MediaRes.worldLens),
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            width: 1),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12))),
                                    child: AnimatedBuilder(
                                        animation: _animationController,
                                        builder: (_, child) {
                                          return const ContinuousMosquitoAnimation();
                                        })),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF9052EF).withOpacity(0.3),
                          // shadow color
                          spreadRadius: 99,
                          // how wide the shadow should spread
                          blurRadius: 999,
                          // how blurry the shadow should be
                          offset:
                              const Offset(0, 20), // the position of the shadow
                        ),
                      ],
                    ),
                    height: 40.h,
                    width: 50.w,
                  )),
            ],
          )),
    );
  }
}

class ContinuousMosquitoAnimation extends StatefulWidget {
  const ContinuousMosquitoAnimation({super.key});

  @override
  _ContinuousMosquitoAnimationState createState() =>
      _ContinuousMosquitoAnimationState();
}

class _ContinuousMosquitoAnimationState
    extends State<ContinuousMosquitoAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Thời gian animation
    )..repeat();

    _controller.addListener(() {
      //print(_controller.value);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
          height: 50.h,
          child: Stack(
            children: [
              Positioned(
                left: 400 *
                    _controller.value, // Vị trí dựa trên giá trị animation
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _buildArrows(14),
                ),
              ),
              Positioned(
                left: 400 * (_controller.value - 1), // Vị trí phía sau
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _buildArrows(12),
                ),
              ),
              Positioned(
                left: 400 * (_controller.value - 2), // Vị trí phía sau
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _buildArrows(14),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildArrows(int arrow) {
    return List.generate(
      arrow,
      (_) => SvgPicture.asset(
        MediaRes.forwardArrow,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
