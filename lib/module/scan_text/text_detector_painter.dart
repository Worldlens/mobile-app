import 'dart:io';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touchable/touchable.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import 'coordinates_translator.dart';

class TextRecognizerPainter extends CustomPainter {
  TextRecognizerPainter(
    this.recognizedText,
    this.imageSize,
    this.rotation,
    this.cameraLensDirection,
    this.context,
    this.setState, {
    this.isScanName = true,
    this.onRegister,
  });

  final RecognizedText recognizedText;
  final Size imageSize;
  final InputImageRotation rotation;
  final CameraLensDirection cameraLensDirection;
  final BuildContext context;
  final Function(String) setState;
  final bool? isScanName;
  final Function(String)? onRegister;

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = const Color(0xFF19FB9B);

    final Paint background = Paint()..color = Colors.transparent;
    final Paint background1 = Paint()..color = Colors.black;

    for (final textBlock in recognizedText.blocks) {
      final ParagraphBuilder builder = ParagraphBuilder(
        ParagraphStyle(
            textAlign: TextAlign.left,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            textDirection: TextDirection.ltr),
      );
      builder.pushStyle(
          ui.TextStyle(color: Colors.white, background: background1));
      builder.addText(textBlock.text);
      builder.pop();

      final left = translateX(
        textBlock.boundingBox.left,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );
      final top = translateY(
        textBlock.boundingBox.bottom,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );
      final right = translateX(
        textBlock.boundingBox.right,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );
      final bottom = translateY(
        textBlock.boundingBox.top,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );

      final List<Offset> cornerPoints = <Offset>[];
      for (final point in textBlock.cornerPoints) {
        double x = translateX(
          point.x.toDouble(),
          size,
          imageSize,
          rotation,
          cameraLensDirection,
        );
        double y = translateY(
          point.y.toDouble(),
          size,
          imageSize,
          rotation,
          cameraLensDirection,
        );

        if (Platform.isAndroid) {
          switch (cameraLensDirection) {
            case CameraLensDirection.front:
              switch (rotation) {
                case InputImageRotation.rotation0deg:
                case InputImageRotation.rotation90deg:
                  break;
                case InputImageRotation.rotation180deg:
                  x = size.width - x;
                  y = size.height - y;
                  break;
                case InputImageRotation.rotation270deg:
                  x = translateX(
                    point.y.toDouble(),
                    size,
                    imageSize,
                    rotation,
                    cameraLensDirection,
                  );
                  y = size.height -
                      translateY(
                        point.x.toDouble(),
                        size,
                        imageSize,
                        rotation,
                        cameraLensDirection,
                      );
                  break;
              }
              break;
            case CameraLensDirection.back:
              switch (rotation) {
                case InputImageRotation.rotation0deg:
                case InputImageRotation.rotation270deg:
                  break;
                case InputImageRotation.rotation180deg:
                  x = size.width - x;
                  y = size.height - y;
                  break;
                case InputImageRotation.rotation90deg:
                  x = size.width -
                      translateX(
                        point.y.toDouble(),
                        size,
                        imageSize,
                        rotation,
                        cameraLensDirection,
                      );
                  y = translateY(
                    point.x.toDouble(),
                    size,
                    imageSize,
                    rotation,
                    cameraLensDirection,
                  );
                  break;
              }
              break;
            case CameraLensDirection.external:
              break;
          }
        }

        cornerPoints.add(Offset(x, y));
      }
      final Rect boundingBox = Rect.fromLTRB(
        translateX(
          textBlock.boundingBox.left,
          size,
          imageSize,
          rotation,
          cameraLensDirection,
        ),
        translateY(
          textBlock.boundingBox.top,
          size,
          imageSize,
          rotation,
          cameraLensDirection,
        ),
        translateX(
          textBlock.boundingBox.right,
          size,
          imageSize,
          rotation,
          cameraLensDirection,
        ),
        translateY(
          textBlock.boundingBox.bottom,
          size,
          imageSize,
          rotation,
          cameraLensDirection,
        ),
      );
      double screenHeight = MediaQuery.of(context).size.height;
      double screenWidth = MediaQuery.of(context).size.width;
      final Rect scanWindow;
      Offset topLeft;
      Offset bottomLeft;
      if (isScanName == true) {
        scanWindow = Rect.fromLTWH(
          screenWidth / 2 - 150.w,
          screenHeight / 3.5 - 50.h,
          300.w,
          100.h,
        );
        topLeft = Offset(screenWidth / 2 - 150.w, screenHeight / 3.5 - 50.h);
        bottomLeft = Offset(screenWidth / 2 + 150.w, screenHeight / 3.5 + 50.h);
      } else {
        scanWindow = Rect.fromLTWH(
          screenWidth / 2 - 150.w,
          screenHeight / 3.5 - 50.h,
          350.w,
          200.h,
        );
        topLeft = Offset(screenWidth / 2 - 175.w, screenHeight / 3.5 - 100.h);
        bottomLeft =
            Offset(screenWidth / 2 + 175.w, screenHeight / 3.5 + 100.h);
      }

      if (top >= topLeft.dy &&
          bottom <= bottomLeft.dy &&
          left >= topLeft.dx &&
          right <= bottomLeft.dx &&
          boundingBox.overlaps(scanWindow)) {
        myCanvas.drawRect(boundingBox, background, onTapDown: (_) {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: screenHeight * 0.4,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 8,
                      ),
                      Center(
                        child: Container(
                          height: 2,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(999)),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Title",
                          style: TextStyle(
                            color: Color(0xFF9F9EA4),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.grey, width: 1)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    textBlock.text,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              if (onRegister != null) {
                                onRegister!(textBlock.text);
                              } else {
                                setState(textBlock.text);
                                Navigator.pop(context);
                              }
                            },
                            borderRadius: BorderRadius.circular(99),
                            child: Container(
                              width: double.maxFinite,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFF19FB9B),
                                borderRadius: BorderRadius.circular(99),
                              ),
                              child: const Center(child: Text("OK")),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });

        // Add the first point to close the polygon
        cornerPoints.add(cornerPoints.first);

        canvas.drawPoints(PointMode.polygon, cornerPoints, paint);
        canvas.drawParagraph(
          builder.build()
            ..layout(ParagraphConstraints(
              width: (right - left).abs(),
            )),
          Offset(
              Platform.isAndroid &&
                      cameraLensDirection == CameraLensDirection.front
                  ? right
                  : left,
              top),
        );
      }
    }
  }

  @override
  bool shouldRepaint(TextRecognizerPainter oldDelegate) {
    return oldDelegate.recognizedText != recognizedText;
  }
}
