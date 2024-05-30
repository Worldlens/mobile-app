import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/media_res.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../explore/presentation/explore.dart';
import '../../../profile/presentation/profile.dart';
import '../../../settings/settings.dart';

Widget HomeAppBar(BuildContext context) {
  return
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        decoration: BoxDecoration(
          color: const Color(0xFF19FB9B).withOpacity(0.25),
          borderRadius: BorderRadius.circular(999.r),
          border: Border.all(
            color: const Color(0xFF19FB9B),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          child: InkWell(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                      builder: (context) => const Explore()));

            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  MediaRes.iconExplore,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Explore",
                  style: TextStyle(
                      color: const Color(0xFF19FB9B),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
      Row(
        children: [
          Container(
            width: 48.sp,
            height: 48.sp,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(999.r)),
            child: InkWell(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                        builder: (context) => const Settings()));
              },
              child: Center(
                child: SvgPicture.asset(
                  MediaRes.iconSetting,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Container(
            width: 40.sp,
            height: 40.sp,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(999.r),
                border: Border.all(
                  color: const Color(0xFF9F9EA4),
                  width: 1.sp,
                )),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9999),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) => const Profile()));
                  },
                  child: const Image(
                    height: 36,
                    width: 36,
                    fit: BoxFit.cover,
                    image: AssetImage(MediaRes.avatar),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    ],
  );
}
