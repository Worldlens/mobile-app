import 'dart:convert';
import 'dart:io';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/module/register_product/controller/register_product.dart';
import 'package:flutter_application_1/module/register_product/domain/entities/country_rp.dart';
import 'package:flutter_application_1/module/register_product/domain/entities/data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../core/utils/media_res.dart';
import '../../scan_text/text_detector_view.dart';

class RegisterProduct extends StatefulWidget {
  const RegisterProduct(
      {super.key, this.barCode, this.productName, this.productDescription});

  static const routeName = '/register_product';
  final String? barCode;
  final String? productName;
  final String? productDescription;

  @override
  State<RegisterProduct> createState() => RegisterProductState();
}

class RegisterProductState extends State<RegisterProduct> {
  String country = "";
  String productName = "";
  String manufacturer = "";
  String description = "";
  String path = "";
  bool isScan = false;
  bool isScanName = true;

  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  TextEditingController manuController = TextEditingController();
  TextEditingController productCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();
  List<String> pathList = [];
  bool enable = false;

  @override
  void initState() {
    super.initState();
    if (widget.barCode != null) {
      setState(() {
        productCodeController.text = widget.barCode!;
        manufacturer = widget.barCode!.substring(2, 6);
        manuController.text = manufacturer;
        // nameController.text = widget.title!;
        // desController.text = widget.des!;
      });
    }
    if (widget.productName != null) {
      setState(() {
        nameController.text = widget.productName!;
      });
    }
    if (widget.productDescription != null) {
      setState(() {
        desController.text = widget.productDescription!;
      });
    }
    if (widget.barCode!.isNotEmpty &&
        widget.productName!.isNotEmpty &&
        widget.productDescription!.isNotEmpty) {
      setState(() {
        enable = true;
      });
    }
    if (widget.productName != null) {
      setState(() {
        nameController.text = widget.productName!;
      });
    }
    if (widget.productDescription != null) {
      setState(() {
        desController.text = widget.productDescription!;
      });
    }
    if (widget.barCode!.isNotEmpty &&
        widget.productName!.isNotEmpty &&
        widget.productDescription!.isNotEmpty) {
      setState(() {
        enable = true;
      });
    }
    fetchCountry();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: isScan
              ? TextRecognizerView(isScanName: isScanName, (String titleText) {
                  if (titleText.isEmpty) {
                    setState(() {
                      isScan = false;
                    });
                    return;
                  }
                  if (isScanName) {
                    nameController.text = titleText;
                  } else {
                    desController.text = titleText;
                  }
                  setState(() {
                    isScan = false;
                    if (nameController.text.isNotEmpty &&
                        manufacturer.isNotEmpty &&
                        desController.text.isNotEmpty) {
                      enable = true;
                    } else {
                      enable = false;
                    }
                  });
                })
              : SafeArea(
                  child: Scaffold(
                      backgroundColor: Colors.black,
                      appBar: AppBar(
                          backgroundColor: Colors.black,
                          elevation: 0,
                          leading: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            onPressed: () {
                              goBack(context);
                            },
                          ),
                          title: Text(
                            "Register Product",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      body: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 32.h,
                              ),
                              Text.rich(TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Product’s Code ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "*",
                                    style: TextStyle(
                                      color: const Color(0xFF19FB9B),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF171219),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: TextField(
                                    enabled: false,
                                    controller: productCodeController,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    style: TextStyle(
                                      color: const Color(0xFF19FB9B),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 32.h,
                              ),
                              Text.rich(TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Images",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " *",
                                    style: TextStyle(
                                      color: const Color(0xFF19FB9B),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () async {
                                        onPickImage();
                                      },
                                      child: DottedBorder(
                                        borderType: BorderType.RRect,
                                        dashPattern: const [6, 5],
                                        color: const Color(0xFF605D69),
                                        radius: const Radius.circular(8),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0.sp),
                                            child: Container(
                                              width: double.maxFinite,
                                              height: 112.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: const Color(0xFF171219),
                                              ),
                                              child: pathList.isEmpty
                                                  ? Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(MediaRes
                                                            .iconCameraPlus),
                                                        SizedBox(
                                                          height: 8.h,
                                                        ),
                                                        Text(
                                                          "Tap here to take a picture",
                                                          style: TextStyle(
                                                            color: const Color(
                                                                0xFF9F9EA4),
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    )
                                                  : Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount:
                                                              pathList.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right:
                                                                          7.0),
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(12
                                                                            .r),
                                                                    border: Border.all(
                                                                        color: const Color(
                                                                            0xFF605D69))),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          2.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                    child: Image
                                                                        .file(
                                                                      File(pathList[
                                                                          index]),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      height:
                                                                          112.h,
                                                                      width:
                                                                          100.w,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      onPickImage();
                                    },
                                    child: Container(
                                      width: 85.w,
                                      height: 128.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xFF9F9EA4),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.upload,
                                            color: Color(0xFF9F9EA4),
                                            size: 24,
                                          ),
                                          Text(
                                            "Upload images",
                                            style: TextStyle(
                                              color: const Color(0xFF9F9EA4),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: "Maximum ",
                                      style: TextStyle(
                                        color: const Color(0xFF9F9EA4),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  TextSpan(
                                      text: "5MB ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  TextSpan(
                                      text: "only. Supported formats: ",
                                      style: TextStyle(
                                        color: const Color(0xFF9F9EA4),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  TextSpan(
                                      text: ".png",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  TextSpan(
                                      text: ", ",
                                      style: TextStyle(
                                        color: const Color(0xFF9F9EA4),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  TextSpan(
                                      text: ".jpg",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ]),
                              ),
                              SizedBox(
                                height: 32.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Product's Name",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " *",
                                        style: TextStyle(
                                          color: const Color(0xFF19FB9B),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  )),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isScanName = true;
                                        isScan = true;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.qr_code_scanner_sharp,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                height: 50.h,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                      color: const Color(0xFF605D69)),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    controller: nameController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Enter product name",
                                        hintStyle: TextStyle(
                                          color: const Color(0xFF605D69),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    cursorColor: const Color(0xFF19FB9B),
                                    onChanged: (text) {
                                      setState(() {
                                        if (nameController.text.isNotEmpty &&
                                            manufacturer.isNotEmpty &&
                                            description.isNotEmpty) {
                                          setState(() {
                                            enable = true;
                                          });
                                        } else {
                                          setState(() {
                                            enable = false;
                                          });
                                        }
                                        productName = text;
                                      });
                                    },
                                    style: TextStyle(
                                      color: const Color(0xFF9F9EA4),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Text.rich(TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Manufacturer's Code",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " *",
                                    style: TextStyle(
                                      color: const Color(0xFF19FB9B),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                height: 50.h,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: const Color(0xFF605D69)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 13.h),
                                  child: TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    controller: manuController,
                                    decoration: InputDecoration(
                                        // fillColor: Colors.red,
                                        // filled: true,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.h, horizontal: 15),
                                        border: InputBorder.none),
                                    cursorColor: const Color(0xFF19FB9B),
                                    onChanged: (text) {
                                      if (productName.isNotEmpty &&
                                          description.isNotEmpty &&
                                          description.isNotEmpty) {
                                        setState(() {
                                          enable = true;
                                        });
                                      } else {
                                        setState(() {
                                          enable = false;
                                        });
                                      }
                                      setState(() {
                                        manufacturer = text;
                                      });
                                    },
                                    style: TextStyle(
                                      color: const Color(0xFF605D69),
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 32.h,
                              ),
                              Row(children: [
                                Text("Country",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    )),
                                Text(
                                  " *",
                                  style: TextStyle(
                                    color: const Color(0xFF19FB9B),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ]),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                      color: const Color(0xFF605D69)),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                  ),
                                  child: TextField(
                                    enabled: false,
                                    controller: countryController,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    cursorColor: const Color(0xFF19FB9B),
                                    style: TextStyle(
                                      color: const Color(0xFF9F9EA4),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 32.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Description",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  Visibility(
                                    visible: nameController.text.isNotEmpty,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isScanName = false;
                                          isScan = true;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.qr_code_scanner_sharp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                      color: const Color(0xFF605D69)),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.w, right: 16.w, bottom: 48.h),
                                  child: TextField(
                                    controller: desController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Write a short description",
                                      hintStyle: TextStyle(
                                        color: const Color(0xFF605D69),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    maxLines: null,
                                    cursorColor: const Color(0xFF19FB9B),
                                    onChanged: (text) {
                                      if (productName.isNotEmpty &&
                                          description.isNotEmpty &&
                                          desController.text.isNotEmpty) {
                                        setState(() {
                                          enable = true;
                                        });
                                      } else {
                                        setState(() {
                                          enable = false;
                                        });
                                      }
                                      setState(() {
                                        description = text;
                                      });
                                    },
                                    style: TextStyle(
                                      color: const Color(0xFF9F9EA4),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      bottomNavigationBar: Container(
                        padding:
                            EdgeInsets.only(left: 20.w, top: 16.h, right: 20.w),
                        child: enable
                            ? RoundedLoadingButton(
                                successColor: Colors.green,
                                errorColor: Colors.red,
                                controller: btnController,
                                borderRadius: 999,
                                onPressed: () {
                                  if (nameController.text.isEmpty ||
                                      manufacturer.isEmpty ||
                                      desController.text.isEmpty ||
                                      pathList.isEmpty) {
                                    btnController.reset();

                                    CherryToast.error(
                                            title: const Text(
                                                "Please fill in all the information",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            animationType:
                                                AnimationType.fromRight,
                                            animationDuration: const Duration(
                                                milliseconds: 1000),
                                            autoDismiss: true)
                                        .show(context);

                                    return;
                                  }
                                  btnController.start();
                                  asyncFileUpload(
                                    context: context,
                                    name: nameController.text,
                                    code: widget.barCode ?? "",
                                    mCode: manufacturer,
                                    des: desController.text,
                                    file: File(pathList[0]),
                                  );
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: enable
                                        ? const Color(0xFF19FB9B)
                                        : const Color(0xFF605D69),
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "SUBMIT",
                                      style: TextStyle(
                                        color: enable
                                            ? Colors.black
                                            : const Color(0xFF9F9EA4),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: enable
                                      ? const Color(0xFF19FB9B)
                                      : const Color(0xFF605D69),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Center(
                                  child: Text(
                                    "SUBMIT",
                                    style: TextStyle(
                                      color: enable
                                          ? Colors.black
                                          : const Color(0xFF9F9EA4),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                      )),
                ),
        ),
      );
}

CountryRp countryRpFromJson(String str) => CountryRp.fromJson(json.decode(str));

String countryRpToJson(CountryRp data) => json.encode(data.toJson());

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());
