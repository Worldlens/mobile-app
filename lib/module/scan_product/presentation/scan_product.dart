import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/module/scan_product/controller/scan_product_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scanning_effect/scanning_effect.dart';

import '../../register_product/presentation/register_product.dart';
import '../../scan_text/text_detector_view.dart';

class ScanProduct extends StatefulWidget {
  const ScanProduct({super.key, this.from});

  static const routeName = "/scanScreen";
  final String? from;

  @override
  State<ScanProduct> createState() => ScanProductState();
}

class ScanProductState extends State<ScanProduct> {
  String overlayText = "Please scan QR Code";
  bool camStarted = true;
  bool isScanSuccess = false;
  List<String> pathList = [];
  bool isScanProductName = false;
  bool isScanProductDescription = false;
  String productName = "";

  final MobileScannerController controller = MobileScannerController(
    formats: [
      BarcodeFormat.code128,
      BarcodeFormat.code39,
      BarcodeFormat.code93,
      BarcodeFormat.codabar,
      BarcodeFormat.dataMatrix,
      BarcodeFormat.ean13,
      BarcodeFormat.ean8,
      BarcodeFormat.itf,
      BarcodeFormat.upcA,
      BarcodeFormat.upcE,
      BarcodeFormat.pdf417,
      BarcodeFormat.aztec
    ],
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startCamera();
  }

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: 200.sp,
      height: 200.sp,
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: isScanProductName
          ? TextRecognizerView(titleHeader: "Scan product name", onSkip: () {
              isScanProductName = false;
              isScanProductDescription = true;
              setState(() {
                productName = "";
              });
            }, onBack: () {
              Navigator.pop(context);
            }, (String titleText) {
              setState(() {
                isScanProductName = false;
                isScanProductDescription = true;
                productName = titleText;
              });
            })
          : isScanProductDescription
              ? TextRecognizerView(
                  titleHeader: "Scan product description",
                  isScanName: false, onSkip: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => RegisterProduct(
                      barCode: overlayText,
                      productName: productName,
                      productDescription: "",
                    ),
                  ));
                }, onBack: () {
                  setState(() {
                    isScanProductName = true;
                    isScanProductDescription = false;
                  });
                }, onRegister: (String titleText) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => RegisterProduct(
                      barCode: overlayText,
                      productName: productName,
                      productDescription: titleText,
                    ),
                  ));
                }, (String titleText) {})
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: camStarted
                            ? Stack(
                                fit: StackFit.expand,
                                children: [
                                  Center(
                                    child: MobileScanner(
                                      fit: BoxFit.fill,
                                      onDetect: onBarcodeDetect,
                                      overlay: const Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Opacity(
                                            opacity: 1,
                                          ),
                                        ),
                                      ),
                                      controller: controller,
                                      scanWindow: scanWindow,
                                      errorBuilder: (context, error, child) {
                                        return Center(
                                          child: Text(
                                            'Error: $error',
                                            style: const TextStyle(
                                                color: Colors.red),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  CustomPaint(
                                    painter: ScannerOverlay(scanWindow),
                                  ),
                                  Positioned(
                                    left: scanWindow.left,
                                    top: scanWindow.top,
                                    child: Container(
                                        //color: Colors.red,
                                        width: scanWindow.width,
                                        height: scanWindow.height,
                                        alignment: Alignment.center,
                                        child: ScanningEffect(
                                          scanningLinePadding:
                                              EdgeInsets.symmetric(
                                                  vertical: 5.h),
                                          scanningColor:
                                              const Color(0xFF19FB9B),
                                          borderLineColor: Colors.white,
                                          isHaveBorderLine: false,
                                          delay: const Duration(seconds: 1),
                                          duration: const Duration(seconds: 2),
                                          direction: ScannerDirection.up,
                                          child: Container(
                                              color: Colors.transparent),
                                        )),
                                  ),
                                  SafeArea(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              widget.from == "Home"
                                                  ? const Icon(
                                                      Icons.more_vert,
                                                      color: Colors.transparent,
                                                    )
                                                  : Material(
                                                      color: Colors.transparent,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9999),
                                                        child: Container(
                                                          width: 48.sp,
                                                          height: 48.sp,
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons.arrow_back,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                              const Text(
                                                "Scanning...",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Material(
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  onTap: () {},
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9999),
                                                  child: Container(
                                                    width: 48.sp,
                                                    height: 48.sp,
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.more_vert,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 24.h),
                                          Text(
                                            "Aim the barcode horizontally centered \n"
                                            "to the frame.",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9999)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Stack(children: [
                                                      Positioned(
                                                          child: Container(
                                                        height: 40,
                                                        width: 40,
                                                        decoration:
                                                            const BoxDecoration(
                                                                boxShadow: [
                                                              BoxShadow(
                                                                color: Color(
                                                                    0xFF2DFF8E),
                                                                // shadow color
                                                                spreadRadius: 0,
                                                                // how wide the shadow should spread
                                                                blurRadius: 30,
                                                                // how blurry the shadow should be
                                                                offset: Offset(
                                                                    0,
                                                                    0), // the position of the shadow
                                                              ),
                                                            ]),
                                                      )),
                                                      Container(
                                                        height: 54.sp,
                                                        width: 54.sp,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: const Color(
                                                                    0xFF4BF0AA),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            9999),
                                                                gradient:
                                                                    const LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0xFF4BF0AA),
                                                                    Color(
                                                                        0xFF13AC75)
                                                                  ],
                                                                )),
                                                        child: Center(
                                                            child: Text(
                                                          "x2",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 28.sp),
                                                        )),
                                                      ),
                                                    ]),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      height: 40.sp,
                                                      width: 40.sp,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.24),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9999),
                                                      ),
                                                      child: const Center(
                                                          child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                      )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container(
                                color: Colors.white,
                                child: const Center(
                                  child: Text(
                                      "Tap on Camera to activate QR Scanner"),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
    );
  }
}

class ScannerOverlay extends CustomPainter {
  ScannerOverlay(this.scanWindow);

  final Rect scanWindow;
  final double borderRadius = 12.0;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    final backgroundPath = Path()..addRect(Rect.largest);

    // Draw the white border
    double sh = scanWindow.height; // for convenient shortage
    double sw = scanWindow.width; // for convenient shortage
    double cornerSide = sh * 0.1; // desirable value for corners side

    final cutoutPath = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          scanWindow,
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      )
      ..moveTo(cornerSide, 0)
      ..quadraticBezierTo(0, 0, 0, cornerSide)
      ..moveTo(0, sh - cornerSide)
      ..quadraticBezierTo(0, sh, cornerSide, sh)
      ..moveTo(sw - cornerSide, sh)
      ..quadraticBezierTo(sw, sh, sw, sh - cornerSide)
      ..moveTo(sw, cornerSide)
      ..quadraticBezierTo(sw, 0, sw - cornerSide, 0);

    final backgroundPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );

    final canvasRect = Offset.zero & size;
    const rectWidth = 200.0;
    final rect = Rect.fromCircle(
      center: canvasRect.center,
      radius: rectWidth / 2,
    );
    const radius = 12.0;
    const strokeWidth = 3.0;
    const extend = radius + 24.0;
    var arcSize = const Size.square(radius * 2);

    canvas.translate(rect.left, rect.top);
    final path = Path();
    for (var i = 0; i < 4; i++) {
      final l = i & 1 == 0;
      final t = i & 2 == 0;
      path
        ..moveTo(l ? 0 : rectWidth, t ? extend : rectWidth - extend)
        ..arcTo(
            Offset(l ? 0 : rectWidth - arcSize.width,
                    t ? 0 : rectWidth - arcSize.width) &
                arcSize,
            l ? pi : pi * 2,
            l == t ? pi / 2 : -pi / 2,
            false)
        ..lineTo(l ? extend : rectWidth - extend, t ? 0 : rectWidth);
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.white
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke,
    );
    canvas.restore();

    canvas.drawPath(backgroundWithCutout, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BorderPainter extends CustomPainter {
  BorderPainter(this.scanWindow);

  final Rect scanWindow;
  final double borderRadius = 12.0;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    double sh = scanWindow.height; // for convenient shortage
    double sw = scanWindow.width; // for convenient shortage
    double cornerSide = sh * 0.1; // desirable value for corners side

    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path()
      ..moveTo(cornerSide, 0)
      ..quadraticBezierTo(0, 0, 0, cornerSide)
      ..moveTo(0, sh - cornerSide)
      ..quadraticBezierTo(0, sh, cornerSide, sh)
      ..moveTo(sw - cornerSide, sh)
      ..quadraticBezierTo(sw, sh, sw, sh - cornerSide)
      ..moveTo(sw, cornerSide)
      ..quadraticBezierTo(sw, 0, sw - cornerSide, 0);

    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BorderPainter oldDelegate) => false;
}
