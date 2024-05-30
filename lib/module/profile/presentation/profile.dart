import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/media_res.dart';
import 'package:flutter_application_1/module/profile/controller/profile_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  static const routeName = '/profile';
  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          goBack(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    Text(
                      "User Profile",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                    const Icon(Icons.more_vert, color: Colors.white)
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                    child: SizedBox(
                        height: 150.h,
                        width: 150.w,
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(MediaRes.profileAvatar),
                        ))),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text(
                    "Alexie Brehnick",
                    style: TextStyle(color: Colors.white, fontSize: 22.sp),
                  ),
                ),
                Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    "This is the first sentence describing the product. The second sentence further elaborate the details."),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Progress",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white30),
                      //color: Colors.black,
                      borderRadius: BorderRadius.circular(20.r)),
                  width: double.infinity,
                  height: 200.h,
                  child: Stack(children: [
                    Positioned(
                        bottom: 20,
                        right: 20,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              border: Border.all(color: Colors.white60)),
                          child: TextButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.transparent)),
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  "SHARE",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        )),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.asset(
                        width: double.infinity,
                        './assets/images/effects/ellipse4.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) => const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF00FFA3), // rgba(0, 255, 163, 1)
                                Color(0xFF9CDBFF), // rgba(156, 219, 255, 1)
                                Color(0xFF3CBFFF), // rgba(60, 183, 252, 1)
                                Color(0xFF0035BC), // rgba(0, 53, 188, 1)
                              ],
                            ).createShader(Rect.fromLTWH(
                                0, 0, bounds.width, bounds.height)),
                            child: Text(
                              "109",
                              style: TextStyle(
                                  fontSize: 50.sp,
                                  color: const Color.fromRGBO(50, 97, 218, 1)),
                            ),
                          ),
                          // const Text(
                          //   "109",
                          //   style: TextStyle(
                          //       fontSize: 50,
                          //       color: Color.fromRGBO(50, 97, 218, 1)),
                          // ),
                          Text(
                            "TOTAL POINTS",
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: const Color.fromRGBO(159, 158, 164, 1)),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            //height: 30,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.r)),
                                color:
                                    const Color.fromRGBO(255, 255, 255, 0.15)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                textAlign: TextAlign.center,
                                "\$10.90",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 70.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //
                        children: [
                          Column(
                            children: [
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Center(
                                      child: Image.asset(
                                          height: 40.h,
                                          width: 40.w,
                                          MediaRes.profileUploaded)),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 10)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "32",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.white),
                                      ),
                                      Text("Submmited",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.white70)),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                        child: SizedBox(
                      height: 70.h,
                      child: Row(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Center(
                                      child: Image.asset(
                                          height: 40.h,
                                          width: 40.w,
                                          MediaRes.profileVerified)),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 10)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "77",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.white),
                                      ),
                                      Text("Verified",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.white70)),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text("My NFTs",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10.h,
                ),
                Text("Unlock bonus points with NFT ownership.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18.sp,
                    )),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(23, 18, 25, 1),
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: SizedBox(
                                // Adjust if needed for image aspect ratio
                                child: Image.asset(MediaRes.profileX2),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            // Right image with a flexible width (integer for flex)
                            Expanded(
                              child: SizedBox(
                                // Adjust if needed for image aspect ratio
                                child: Image.asset(MediaRes.profileX3),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: Image.asset(MediaRes.profileX5),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: SizedBox(
                                child: Image.asset(MediaRes.profileCubic),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
