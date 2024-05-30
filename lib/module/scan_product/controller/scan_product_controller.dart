import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/module/details/presentation/details.dart';
import 'package:flutter_application_1/module/scan_product/presentation/scan_product.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import "package:http/http.dart" as http;
import 'package:flutter_application_1/core/utils/media_res.dart';

import '../../../core/domain/entities/scan_barcode_response.dart';
import '../../register_product/presentation/register_product.dart';

extension ScanProductController on ScanProductState {
  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  void goToRegisterProduct(BuildContext context) {
    Navigator.pushNamed(context, '/register_product');
  }

  void startCamera() {
    if (camStarted) {
      return;
    }
    controller.start().then((_) {
      if (mounted) {
        setState(() {
          camStarted = true;
        });
      }
    }).catchError((Object error, StackTrace stackTrace) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Something went wrong! $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

  void onBarcodeDetect(BarcodeCapture barcodeCapture) {
    if (isScanSuccess || pathList.isNotEmpty) {
      return;
    }
    final barcode = barcodeCapture.barcodes.last;
    print(barcode.rawValue);
    setState(() {
      isScanSuccess = true;
      overlayText = barcodeCapture.barcodes.last.displayValue ??
          barcode.rawValue ??
          'Barcode has no displayable value';

      fetchBarCode(overlayText);
    });
  }

  Future<ScanBarCodeResponse?> fetchBarCode(String barcode) async {
    // String title = '';
    // String des = '';
    var navigator = Navigator.of(context);
    String title_Text = "";
    String descriptionText = "";

    final response = await http.get(Uri.parse(
        'https://worldlens-stag.vertiree.com/api/metadata-service/product/$barcode'));
    print(response.body);
    if (response.statusCode != 200) {
      //isScan = true;
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    MediaRes.notFound,
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'The Item with the code ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: overlayText,
                            style: const TextStyle(
                              color: Colors.greenAccent,
                              // Màu sắc của overlayText
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const TextSpan(
                            text:
                                ' has not been registered. Would you like to register this item?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isScanProductName = true;
                        });
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(99),
                      child: Container(
                        width: double.maxFinite,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF19FB9B),
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: const Center(child: Text("ADD PRODUCT")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ).whenComplete(() {
        isScanSuccess = false;
        //moveToRegisterProduct(title_Text, descriptionText);
      });
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => Details(
          barCode: overlayText,
          dataBarCode:
              ScanBarCodeResponse.fromJson(jsonDecode(response.body)).data,
        ),
      ));
    }

    return ScanBarCodeResponse.fromJson(jsonDecode(response.body));
  }

  // Future<void> moveToRegisterProduct(
  //     String descriptionText, String title_Text) async {
  //   Navigator.of(context).pushReplacement(MaterialPageRoute(
  //       builder: (BuildContext context) => RegisterProduct(
  //             des: descriptionText,
  //             title: title_Text,
  //             barCode: overlayText,
  //           )));
  // }
}
