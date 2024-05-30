import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/entities/scan_barcode_response.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_1/values/enum.dart';
import 'package:flutter_application_1/core/widgets/modal_hide_item.dart';
import 'package:flutter_application_1/core/widgets/modal_share.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/media_res.dart';

class Details extends StatefulWidget {
  const Details({super.key, this.barCode, this.dataBarCode});

  static const routeName = '/details';

  final String? barCode;

  final DataBarCode? dataBarCode;

  @override
  State<Details> createState() => DetailsState();
}

class DetailsState extends State<Details> {
  bool isVerified = false;
  SampleItem? selectedItem;

  @override
  void initState() {
    super.initState();
    //set status bar is dark
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(children: [
            Positioned(
                child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black,
            )),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  //height is height of device
                  height: MediaQuery.of(context).size.height - 220.h,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32))),

                  child: Padding(
                    padding: EdgeInsets.only(bottom: 24.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _header(context, selectedItem),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    Center(
                                      child: Image.network(
                                        widget.dataBarCode!.images[0],
                                        fit: BoxFit.cover,
                                        height: 300.h,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 24.h,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20.w),
                                      child: Row(children: [
                                        Text(
                                          widget.dataBarCode!.name,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 32.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(width: 10.w),
                                        isVerified
                                            ? Image.asset(
                                                MediaRes.iconVerified,
                                                width: 32.sp,
                                                height: 32.sp,
                                              )
                                            : const SizedBox()
                                      ]),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20.w),
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                                color: Color(0xFFF1F1F1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.w, vertical: 6.h),
                                            child: Text(
                                              widget.dataBarCode!.manufactureCode
                                                  .toString(),
                                              style: TextStyle(
                                                  color: const Color(0xFF9F9EA4),
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                                color: Color(0xFFF1F1F1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 6),
                                            child: Row(children: [
                                              Image.asset(
                                                MediaRes.vietnamFlag,
                                                width: 24.sp,
                                                height: 24.sp,
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Text(
                                                "Vietnam",
                                                style: TextStyle(
                                                    color: const Color(0xFF9F9EA4),
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w400),
                                              )
                                            ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 24.h,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20.sp),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.dataBarCode!.description,
                                              style: TextStyle(
                                                  color: const Color(0xFF9F9EA4),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.sp),
                                            ),
                                            SizedBox(
                                              height: 12.h,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Show more",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16.sp),
                                                ),
                                                const Icon(
                                                  Icons.keyboard_arrow_down_rounded,
                                                  color: Colors.black,
                                                )
                                              ],
                                            ),
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 24.h,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20.w),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            launchUrl(Uri.parse(widget
                                                .dataBarCode!.explorer
                                                .toString()));
                                          },
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Color(0xFFF1F1F1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.w, vertical: 6.h),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.link,
                                                  color: const Color(0xFF9F9EA4),
                                                  weight: 24.sp,
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Text(
                                                  "TX Hash",
                                                  style: TextStyle(
                                                      color: const Color(0xFF9F9EA4),
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.w600,
                                                      decoration:
                                                          TextDecoration.underline),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ]),
                  ),
                ))
          ]),
        ),
        bottomNavigationBar: Container(
          height: 165.h,
          color: Colors.black,
          child: Stack(children: [
            !isVerified
                ? Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 70.h,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color(0xFF9C4BDB),
                          // shadow color
                          spreadRadius: 0,
                          // how wide the shadow should spread
                          blurRadius: 150,
                          // how blurry the shadow should be
                          offset: Offset(0, 0), // the position of the shadow
                        ),
                      ]),
                    ))
                : const SizedBox(),
            Positioned(
              bottom: 40.h,
              left: 0,
              right: 0,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isVerified = true;
                      });
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(999)),
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: isVerified
                              ? const Color(0xFF605D69)
                              : const Color(0xFF9C4BDB),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(999))),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 16.h),
                        child: Text(
                          isVerified ? "VERIFIED" : "VERIFY THIS PRODUCT",
                          style: TextStyle(
                              color: isVerified
                                  ? const Color(0xFF9F9EA4)
                                  : Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (isVerified)
              Positioned(
                top: 24.h,
                left: 0,
                right: 0,
                child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Image.asset(
                          MediaRes.iconVerified,
                          width: 32.sp,
                          height: 32.sp,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "This product has been",
                          style: TextStyle(
                              color: const Color(0xFFFFFFFF).withOpacity(0.7),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp),
                        ),
                         Text(
                          " verified",
                          style: TextStyle(
                              color: const Color(0xFF19FB9B),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp),
                        ),
                        Text(
                          ".",
                          style: TextStyle(
                              color: const Color(0xFFFFFFFF).withOpacity(0.7),
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp),
                        ),
                      ],
                    )),
              )
            else
              const SizedBox(),
          ]),
        ),
      ),
    );
  }
}

Widget _header(BuildContext context, SampleItem? selectedItem) {
  return Container(
      padding:  EdgeInsets.symmetric(horizontal: 12.w),
      width: double.infinity,
      height: 56.h,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 48.sp,
              height: 48.sp,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon:  Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 28.sp,
                  ),
                ),
              ),
            ),
             Text(
              "Product Details",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 48.sp,
              height: 48.sp,
              child: Center(
                child: popupMenuButton(selectedItem: selectedItem),
              ),
            ),
          ],
        ),
      ));
}

class popupMenuButton extends StatelessWidget {
  const popupMenuButton({
    super.key,
    required this.selectedItem,
  });

  final SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      initialValue: selectedItem,
      icon: const Icon(
        Icons.more_vert,
        color: Colors.black,
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem<SampleItem>(
          onTap: () {
            showModalHideItem(context);
          },
          value: SampleItem.itemOne,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.remove_red_eye_outlined),
              SizedBox(
                width: 20.w,
              ),
              const Text("Hide this item")
            ],
          ),
        ),
        PopupMenuItem<SampleItem>(
          onTap: () {
            showModalShare(context);
          },
          value: SampleItem.itemTwo,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.share),
              SizedBox(
                width: 20.w,
              ),
              const Text("Share")
            ],
          ),
        ),
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.flag),
              SizedBox(width: 20.w),
              const Text("Report")
            ],
          ),
        ),
      ],
    );
  }
}
