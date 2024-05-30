import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/media_res.dart';
import 'package:flutter_application_1/module/comingsoon/controller/coming_soon_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  @override
  State<ComingSoon> createState() => ComingSoonState();
}

class ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            goBack(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Center(
            child: Text(
          "Sorry",
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 200.h, child: Image.asset(MediaRes.wait)),
          Center(
            child: Text(
              "Coming Soon...",
              style: TextStyle(color: Colors.white, fontSize: 25.sp),
            ),
          ),
          const Center(
            child: Text(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
                "This feature is not fully released yet.\nStay tuned for more updates!"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 20, left: 20),
            child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromRGBO(25, 251, 155, 1)),
                ),
                onPressed: () {
                  // goBack(context);
                },
                child: const Text(
                  "GO BACK",
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
    );
  }
}
