import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/text_gradient.dart';
import 'package:flutter_application_1/module/history/presentation/history.dart';
import 'package:flutter_application_1/module/home/controller/home_controller.dart';
import 'package:flutter_application_1/module/home/presentation/widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scanning_effect/scanning_effect.dart';

import '../../../core/utils/media_res.dart';
import '../../scan_product/presentation/scan_product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  GlobalKey height = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeAppBar(context),
            SizedBox(
              height: 32.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 32.h,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          moveToCamera();
                        },
                        child: Container(
                            height: 244.h,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ScanningEffect(
                              scanningColor: const Color(0xFF19FB9B),
                              scanningLinePadding:
                                  EdgeInsets.symmetric(horizontal: 20.w),
                              borderLineColor: Colors.transparent,
                              delay: const Duration(seconds: 1),
                              duration: const Duration(seconds: 2),
                              child: Image.asset(MediaRes.scanBackGround2),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 44.h,
                    ),
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white.withOpacity(0.15), width: 2.sp),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Stack(children: [
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.r - 2.sp),
                              child: Image.asset(
                                MediaRes.claimPointsBg,
                                fit: BoxFit.fill,
                              ),
                            )),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.r - 2.sp),
                              child: Image.asset(MediaRes.ellipse4),
                            )),
                        Center(
                          key: height,
                          child: Padding(
                            padding: EdgeInsets.only(top: 32.h, bottom: 24.h),
                            child: Column(
                              children: [
                                GradientText(
                                  "109",
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF00FFA3),
                                      Color(0xFF9CDBFF),
                                      Color(0xFF3CB7FC),
                                      Color(0xFF3261DA),
                                    ],
                                  ),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 64.sp),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "TOTAL POINTS",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF9F9EA4)),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 4.h),
                                    child: Text(
                                      "\$10.90",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 32.h,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFF19FB9B),
                                        width: 1.sp),
                                    borderRadius: BorderRadius.circular(999.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 10.h),
                                    child: Text(
                                      "CLAIM POINTS",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.sp,
                                          color: const Color(0xFF19FB9B)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        // Container(
                        //   child: Expanded(
                        //     child: InkWell(
                        //       onTap: () {
                        //         // moveToProductSubmitted();
                        //       },
                        //       child: Stack(children: [
                        //         Positioned(
                        //             left: 0,
                        //             top: 0,
                        //             bottom: 0,
                        //             right: 0,
                        //             child: ClipRRect(
                        //               borderRadius: BorderRadius.circular(
                        //                   16.r - 2.sp),
                        //               child: Image.asset(
                        //                 MediaRes.claimPointsBg,
                        //                 fit: BoxFit.fill,
                        //               ),
                        //             )),
                        //         Positioned(
                        //             bottom: 0,
                        //             right: 0,
                        //             child: ClipRRect(
                        //               borderRadius: BorderRadius.circular(
                        //                   16.r - 2.sp),
                        //               child: Image.asset(MediaRes.ellipse1),
                        //             )),
                        //         Container(
                        //           decoration: BoxDecoration(
                        //             border: Border.all(
                        //                 color:
                        //                     Colors.white.withOpacity(0.15),
                        //                 width: 2.sp),
                        //             borderRadius:
                        //                 BorderRadius.circular(16.r),
                        //           ),
                        //           child: const Stack(children: [
                        //             Padding(
                        //               padding: EdgeInsets.symmetric(
                        //                   horizontal: 10.0, vertical: 10),
                        //               child: Stack(children: [
                        //                 Column(
                        //                   crossAxisAlignment:
                        //                       CrossAxisAlignment.start,
                        //                   children: [
                        //                     Text(
                        //                       "32",
                        //                       style: TextStyle(
                        //                           fontSize: 50,
                        //                           color: Color.fromRGBO(
                        //                               0, 255, 163, 1)),
                        //                     ),
                        //                     Row(children: [
                        //                       Text(
                        //                         " PRODUCTS \n SUBMITTED",
                        //                         style: TextStyle(
                        //                             color: Color.fromRGBO(
                        //                                 159, 158, 164, 1)),
                        //                       )
                        //                     ]),
                        //                   ],
                        //                 ),
                        //               ]),
                        //             ),
                        //           ]),
                        //         ),
                        //         Positioned(
                        //             top: 0,
                        //             right: 0,
                        //             child: Container(
                        //               decoration: const BoxDecoration(
                        //                   color: Colors.green,
                        //                   borderRadius: BorderRadius.only(
                        //                       topRight: Radius.circular(30),
                        //                       topLeft: Radius.circular(50),
                        //                       bottomRight:
                        //                           Radius.circular(50),
                        //                       bottomLeft:
                        //                           Radius.circular(50))),
                        //               height: 70,
                        //               width: 70,
                        //               child: const Icon(Icons.arrow_upward),
                        //             )),
                        //       ]),
                        //     ),
                        //   ),
                        // ),

                        Expanded(
                          child: Container(
                            height: 130.h,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF000705),
                                    Color(0xFF125956)
                                  ]),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.15),
                                  width: 2.sp),
                              borderRadius: BorderRadius.circular(16.r - 2.sp),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(16.r - 2.sp),
                                      child: Image.asset(
                                        //fit: BoxFit.fitHeight,
                                        MediaRes.claimPointsBg,
                                        //fit: BoxFit.scaleDown,
                                      ),
                                    )),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(16.r - 2.sp),
                                    )),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.0.w, top: 5.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GradientText(
                                        "32",
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF00FFA3),
                                            Color(0xFF12AED0),
                                          ],
                                        ),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 40.sp),
                                      ),
                                      const Row(children: [
                                        Text(
                                          " PRODUCTS \n SUBMITTED",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  159, 158, 164, 1)),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFFFFFF)
                                              .withOpacity(0.1),
                                          // gradient: const LinearGradient(
                                          //     begin: FractionalOffset.topCenter,
                                          //     end:
                                          //         FractionalOffset.bottomCenter,
                                          //     colors: [
                                          //       Color(0xFF00FFA3),
                                          //       Color(0xFF12AED0),
                                          //     ],
                                          //     stops: [
                                          //       0.0,
                                          //       1.0
                                          //     ]),
                                          //color: Colors.transparent,
                                          borderRadius: BorderRadius.only(
                                              topRight:
                                                  Radius.circular(14.r - 2.sp),
                                              topLeft:
                                                  Radius.circular(37.r - 2.sp),
                                              bottomRight:
                                                  Radius.circular(37.r - 2.sp),
                                              bottomLeft: Radius.circular(
                                                  37.r - 2.sp))),
                                      height: 60.h,
                                      width: 60.w,
                                      child: Transform.rotate(
                                        angle: 3.14 / 4,
                                        child: const Icon(
                                          Icons.arrow_upward,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        //Product Verified
                        Expanded(
                          child: Container(
                            height: 130.h,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFF4D307D),
                                    Color(0xFF222230)
                                  ]),
                              borderRadius: BorderRadius.circular(16.r - 2.sp),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.r - 2.sp),
                              child: Stack(
                                children: [
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.r - 2.sp),
                                        child: Image.asset(
                                          MediaRes.claimPointsBg,
                                          //fit: BoxFit.scaleDown,
                                        ),
                                      )),
                                  // Positioned(
                                  //     bottom: 0,
                                  //     right: 0,
                                  //    ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.0.w, top: 5.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GradientText(
                                          "77",
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFFE55BFF),
                                              Color(0xFF9747FF),
                                              Color(0xFF621CBE)
                                            ],
                                          ),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 40.sp),
                                        ),
                                        const Row(children: [
                                          Text(
                                            " PRODUCTS \n SUBMITTED",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    159, 158, 164, 1)),
                                          ),
                                        ]),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color(0x362858)
                                                .withOpacity(0.9),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    14.r - 2.sp),
                                                topLeft: Radius.circular(
                                                    37.r - 2.sp),
                                                bottomRight: Radius.circular(
                                                    37.r - 2.sp),
                                                bottomLeft: Radius.circular(
                                                    37.r - 2.sp))),
                                        height: 60.h,
                                        width: 60.w,
                                        child: Transform.rotate(
                                          angle: 3.14 / 4,
                                          child: const Icon(
                                            Icons.arrow_upward,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //   Expanded(
                        //     child: InkWell(
                        //       onTap: () {
                        //         //  moveToProductVerified();
                        //       },
                        //       child: Stack(children: [
                        //         Positioned(
                        //             top: 0,
                        //             right: 0,
                        //             child: Container(
                        //               decoration: const BoxDecoration(
                        //                   color: Colors.pink,
                        //                   borderRadius: BorderRadius.only(
                        //                       topRight: Radius.circular(30),
                        //                       topLeft: Radius.circular(50),
                        //                       bottomRight:
                        //                           Radius.circular(50),
                        //                       bottomLeft:
                        //                           Radius.circular(50))),
                        //               height: 70,
                        //               width: 70,
                        //               child: const Icon(Icons.arrow_upward),
                        //             )),
                        //         Container(
                        //           decoration: BoxDecoration(
                        //               color: const Color.fromRGBO(
                        //                   255, 255, 255, 0.15),
                        //               border:
                        //                   Border.all(color: Colors.white30),
                        //               borderRadius:
                        //                   BorderRadius.circular(20)),
                        //           child: const Padding(
                        //             padding: EdgeInsets.symmetric(
                        //                 horizontal: 10.0, vertical: 10),
                        //             child: Column(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.start,
                        //               children: [
                        //                 Text(
                        //                   "77",
                        //                   style: TextStyle(
                        //                       fontSize: 50,
                        //                       color: Color.fromRGBO(
                        //                           98, 28, 190, 1)),
                        //                 ),
                        //                 Row(children: [
                        //                   Text(
                        //                     " PRODUCTS \n VERIFIED",
                        //                     style: TextStyle(
                        //                         color: Color.fromRGBO(
                        //                             159, 158, 164, 1)),
                        //                   )
                        //                 ]),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ]),
                        //     ),
                        //   ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                        height: 50.h,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromRGBO(25, 251, 155, 1))),
                            onPressed: () {},
                            child: const Text(
                              "SCAN NOW",
                              style: TextStyle(color: Colors.black),
                            ))),
                    SizedBox(
                      height: 20.h,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "Verify Products",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Help verify new submissions – build a better collection of products worldwide.",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.7),
                              fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarSolana extends StatefulWidget {
  const BottomBarSolana({super.key});

  static const routeName = '/bottom_bar';

  @override
  State<BottomBarSolana> createState() => _BottomBarSolanaState();
}

class _BottomBarSolanaState extends State<BottomBarSolana> {
  static const List<Widget> _widgetOptions = <Widget>[Home(), History()];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //  PersistentTabController controller;
    /// controller = PersistentTabController(initialIndex: 0);
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: false,
          // resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: const Color(0xFF19FB9B),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ScanProduct()),
              );
            },
            child: const Icon(
              CupertinoIcons.barcode_viewfinder,
              color: Colors.black,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          backgroundColor: Colors.black,
          body: _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: FlashyTabBar(
            iconSize: 30,
            height: 55,
            backgroundColor: Colors.black,
            selectedIndex: _selectedIndex,
            showElevation: true,
            onItemSelected: _onItemTapped,
            items: [
              FlashyTabBarItem(
                inactiveColor: const Color(0xFF9F9EA4),
                activeColor: const Color(0xFF19FB9B),
                icon: const Icon(Icons.home),
                title: const Text('Home'),
              ),
              FlashyTabBarItem(
                inactiveColor: const Color(0xFF9F9EA4),
                activeColor: const Color(0xFF19FB9B),
                icon: const Icon(Icons.history),
                title: const Text('History'),
              ),
            ],
          )

          //
          //
          //
          //
          // BottomNavigationBar(
          //   //type: ,
          //   unselectedItemColor: const Color(0xFF9F9EA4),
          //   //fixedColor: ,
          //   backgroundColor: Colors.black,
          //   items: const <BottomNavigationBarItem>[
          //     BottomNavigationBarItem(
          //       icon: Center(child: Icon(Icons.home)),
          //       label: 'Home',
          //       backgroundColor: Color(0xFF19FB9B),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.history),
          //       label: 'History',
          //       backgroundColor: Color(0xFF19FB9B),
          //     ),
          //   ],
          //   currentIndex: _selectedIndex,
          //   selectedItemColor: const Color(0xFF19FB9B),
          //   onTap: _onItemTapped,
          // ),
          // bottomNavigationBar: PersistentTabView(context,
          //     controller: controller,
          //     screens: _buildScreens(),
          //     items: _navBarsItems(),
          //     backgroundColor: Colors.black,
          //     // floatingActionButton: Row(children: [
          //     //   Container(
          //     //     color: Colors.red,
          //     //     child: Align(
          //     //       alignment: Alignment.bottomCenter,
          //     //       child: Center(
          //     //         child: FloatingActionButton(
          //     //           onPressed: () {
          //     //             // Add your action here
          //     //           },
          //     //           child: Icon(Icons.add),
          //     //           backgroundColor: Colors.blue,
          //     //         ),
          //     //       ),
          //     //     ),
          //     //   ),
          //     // ]),

          //     // floatingActionButtonLocation:
          //     //     FloatingActionButtonLocation.centerFloat,
          //     // backgroundColor: Colors.black,
          //     // Default is Colors.white.
          //     handleAndroidBackButtonPress: true,
          //     // Default is true.
          //     resizeToAvoidBottomInset: true,
          //     // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          //     stateManagement: true,
          //     // Default is true.
          //     hideNavigationBarWhenKeyboardShows: true,
          //     // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          //     decoration: NavBarDecoration(
          //       borderRadius: BorderRadius.circular(0),
          //       //colorBehindNavBar: Colors.white,
          //     ),
          //     popAllScreensOnTapOfSelectedTab: true,
          //     popActionScreens: PopActionScreensType.all,
          //     // floatingActionButton: Center(
          //     //   child: Container(
          //     //     color: Colors.white,
          //     //     child: Text("123"),
          //     //   ),
          //     // ),
          //     // itemAnimationProperties: const ItemAnimationProperties(
          //     //   // Navigation Bar's items animation properties.
          //     //   duration: Duration(milliseconds: 200),
          //     //   curve: Curves.ease,
          //     // ),
          //     //     onItemSelected: (int int) {
          //     //   if (int == 1) {
          //     //     Navigator.of(context).pushNamed(ScanProduct.routeName);
          //     //   }
          //     // },
          //     screenTransitionAnimation: const ScreenTransitionAnimation(
          //       // Screen transition animation on change of selected tab.
          //       animateTabTransition: true,
          //       curve: Curves.ease,
          //       duration: Duration(milliseconds: 200),
          //     ),
          //     navBarStyle: NavBarStyle.simple //

          //     // Choose the nav bar style with this property.
          //     ),
          ),
    );
  }
}

// List<Widget> _buildScreens() {
//   return [
//     const Home(),
//     // Container(
//     //   color: Colors.black,
//     // ),
//     const History(),
//   ];
// }

// List<PersistentBottomNavBarItem> _navBarsItems() {
//   return [
//     PersistentBottomNavBarItem(
//       icon: const Icon(Icons.home_filled),
//       activeColorPrimary: const Color(0xFF19FB9B),
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//     ),
//     // PersistentBottomNavBarItem(
//     //   icon: const Icon(
//     //     CupertinoIcons.barcode_viewfinder,
//     //     color: Colors.black,
//     //   ),
//     //   activeColorPrimary: const Color(0xFF19FB9B),
//     //   inactiveColorPrimary: Colors.black,
//     // ),
//     PersistentBottomNavBarItem(
//       icon: const Icon(Icons.library_books_rounded),
//       activeColorPrimary: const Color(0xFF19FB9B),
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//     ),
//   ];
// }
