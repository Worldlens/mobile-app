import 'dart:convert';
import 'dart:io';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/module/home/presentation/home.dart';
import 'package:flutter_application_1/module/register_product/domain/entities/country_rp.dart';
import 'package:flutter_application_1/module/register_product/presentation/register_product.dart';
import "package:http/http.dart" as http;
import 'package:image_picker/image_picker.dart';

import '../../home/presentation/home.dart';

extension RegisterProductController on RegisterProductState {
  void goBack(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(builder: (context) => const BottomBarSolana()),
    );
  }

  void moveToDetails(BuildContext context) {
    Navigator.pushNamed(context, '/details');
  }

  Future<CountryRp> fetchCountry() async {
    final response = await http.get(Uri.parse(
        'https://worldlens-stag.vertiree.com/api/metadata-service/barcode/check?barcode=${widget.barCode}'));
    setState(() {
      try {
        countryController.text =
            CountryRp.fromJson(jsonDecode(response.body)).data?.country ??
                "Vietnam";
      } catch (e) {
        countryController.text = "Vietnam";
      }
    });
    return CountryRp.fromJson(jsonDecode(response.body));
  }

  void onPickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          pathList.add(image.path);
        });
      }
    } catch (e) {
      print("failed 176 $e");
    }
  }

  asyncFileUpload(
      {required BuildContext context,
      required String name,
      required String code,
      required String mCode,
      required String des,
      required File file}) async {
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://worldlens-stag.vertiree.com/api/metadata-service/product"));
    //add text fields
    request.fields["code"] = code;
    request.fields["name"] = name;
    request.fields["manufactureCode"] = mCode;
    request.fields["description"] = des;
    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath("images", file.path);
    request.files.add(pic);

    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    if (jsonDecode(responseString)['status'].toString().trim() ==
        "201".trim()) {
      setState(() {
        btnController.success();
      });
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     backgroundColor: Colors.green,
      //     content: Text(
      //       "Create product success",
      //       style: TextStyle(color: Colors.white),
      //     )));

      CherryToast.success(
              animationType: AnimationType.fromRight,
              animationDuration: const Duration(milliseconds: 2000),
              autoDismiss: true,
              backgroundColor: Colors.white,
              title: const Text("Create product success",
                  style: TextStyle(color: Colors.black)))
          .show(context);

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context, rootNavigator: true).pushReplacement(
          MaterialPageRoute(builder: (context) => const BottomBarSolana()),
        );
      });
    } else {
      btnController.error();

      // ScaffoldMessenger.of(context)
      //     .showSnackBar(const SnackBar(content: Text("Create product failed")));

      CherryToast.error(
              title: const Text("Create product failed",
                  style: TextStyle(color: Colors.black)),
              animationType: AnimationType.fromRight,
              animationDuration: const Duration(milliseconds: 2000),
              autoDismiss: true)
          .show(context);
    }
  }
}
