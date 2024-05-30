import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/media_res.dart';
import '../../home/presentation/home.dart';

class ConnectWalletScreen extends StatefulWidget {
  const ConnectWalletScreen({super.key});

  static const routeName = "/connect_wallet";

  @override
  State<ConnectWalletScreen> createState() => _ConnectWalletScreenState();
}

class _ConnectWalletScreenState extends State<ConnectWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Stack(children: [
            Positioned(
                bottom: 0, left: 0, child: Image.asset(MediaRes.ellipse2)),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Image.asset(
                      MediaRes.connectWallet,
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      height: 492.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "Content",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "Accumulate points with every new product submission to redeem for NFTs and more.",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 34.h,
                        ),
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: const Color(0xFF19FB9B),
                            borderRadius: BorderRadius.circular(999.r),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(999.r),
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                child: Text(
                                  "CONNECT WALLET",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(999.r),
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(999.r),
                              onTap: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  BottomBarSolana.routeName,
                                  (route) => false,
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                child: Text(
                                  "Skip",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(top: 0, right: 0, child: Image.asset(MediaRes.ellipse1)),
          ]),
        ));
  }
}
