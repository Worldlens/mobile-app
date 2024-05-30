import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/module/scan_text/text_detector_painter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:touchable/touchable.dart';

import 'init_cam_view.dart';

class CameraView extends StatefulWidget {
  const CameraView(
      {super.key,
      required this.customPaint,
      required this.onImage,
      this.onCameraFeedReady,
      this.foundText = "No text found",
      this.onDetectorViewModeChanged,
      this.onCameraLensDirectionChanged,
      this.initialCameraLensDirection = CameraLensDirection.back,
      this.customPainter,
      required this.setState,
      this.title,
      this.onSkip,
      this.isScanName = true,
      this.onBack})
      : super();

  final bool? isScanName;
  final Function? onSkip;
  final CanvasTouchDetector? customPaint;
  final Function(InputImage inputImage) onImage;
  final VoidCallback? onCameraFeedReady;
  final VoidCallback? onDetectorViewModeChanged;
  final Function(CameraLensDirection direction)? onCameraLensDirectionChanged;
  final CameraLensDirection initialCameraLensDirection;
  final String? foundText;
  final TextRecognizerPainter? customPainter;
  final Function(String) setState;
  final String? title;
  final Function? onBack;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  static List<CameraDescription> _cameras = [];
  CameraController? _controller;
  int _cameraIndex = -1;
  double _currentZoomLevel = 1.0;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  double _minAvailableExposureOffset = 0.0;
  double _maxAvailableExposureOffset = 0.0;
  double _currentExposureOffset = 0.0;
  bool _changingCameraLens = false;
  Color color = Colors.orange;

  @override
  void initState() {
    super.initState();

    _initialize();
    WidgetsBinding.instance.addObserver(this);
  }

  void _initialize() async {
    if (_cameras.isEmpty) {
      _cameras = await availableCameras();
    }
    for (var i = 0; i < _cameras.length; i++) {
      if (_cameras[i].lensDirection == widget.initialCameraLensDirection) {
        _cameraIndex = i;
        break;
      }
    }
    if (_cameraIndex != -1) {
      _startLiveFeed();
    }
  }

  @override
  void dispose() {
    _stopLiveFeed();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _liveFeedBody();
  }

  Widget _liveFeedBody() {
    if (_cameras.isEmpty) return InitCameraView();
    if (_controller == null) return InitCameraView();
    if (_controller?.value.isInitialized == false) return InitCameraView();
    final Rect scanWindow;
    if (widget.isScanName == true) {
      scanWindow = Rect.fromLTWH(
        MediaQuery.of(context).size.width / 2 - 150.w,
        MediaQuery.of(context).size.height / 3.5 - 50.h,
        300.w,
        100.h,
      );
    } else {
      scanWindow = Rect.fromLTWH(
        MediaQuery.of(context).size.width / 2 - 175.w,
        MediaQuery.of(context).size.height / 3.5 - 50.h,
        350.w,
        200.h,
      );
    }
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        CameraPreview(
          _controller!,
          child: widget.customPaint,
        ),
        CustomPaint(
          foregroundPainter: BorderPainter(scanWindow),
          child: Container(
            constraints: BoxConstraints.expand(height: 100.h),
          ),
        ),
        _backButton(),
      ],
    );
  }

  Widget _backButton() => Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      if (widget.onBack != null) {
                        widget.onBack!();
                      } else {
                        setState(() {
                          widget.setState("");
                        });
                      }
                    },
                    borderRadius: BorderRadius.circular(9999),
                    child: SizedBox(
                      width: 48.sp,
                      height: 48.sp,
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  widget.title ?? "Scanning...",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700),
                ),
                if (widget.onSkip == null)
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(9999),
                      child: SizedBox(
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
                  )
                else
                  GestureDetector(
                    onTap: () {
                      widget.onSkip!();
                    },
                    child: SizedBox(
                      width: 48.sp,
                      height: 48.sp,
                      child: Center(
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      );

  Future _startLiveFeed() async {
    final camera = _cameras[_cameraIndex];
    _controller = CameraController(
      camera,
      // Set to ResolutionPreset.high. Do NOT set it to ResolutionPreset.max because for some phones does NOT work.
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
    );
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }

      _controller?.getMinZoomLevel().then((value) {
        _currentZoomLevel = value;
        _minAvailableZoom = value;
      });
      _controller?.getMaxZoomLevel().then((value) {
        _maxAvailableZoom = value;
      });
      _currentExposureOffset = 0.0;
      _controller?.getMinExposureOffset().then((value) {
        _minAvailableExposureOffset = value;
      });
      _controller?.getMaxExposureOffset().then((value) {
        _maxAvailableExposureOffset = value;
      });
      _controller?.startImageStream(_processCameraImage).then((value) {
        if (widget.onCameraFeedReady != null) {
          widget.onCameraFeedReady!();
        }
        if (widget.onCameraLensDirectionChanged != null) {
          widget.onCameraLensDirectionChanged!(camera.lensDirection);
        }
      });
      setState(() {});
    });
  }

  Future _stopLiveFeed() async {
    await _controller?.stopImageStream();
    await _controller?.dispose();
    _controller = null;
  }

  Future _switchLiveCamera() async {
    setState(() => _changingCameraLens = true);
    _cameraIndex = (_cameraIndex + 1) % _cameras.length;

    await _stopLiveFeed();
    await _startLiveFeed();
    setState(() => _changingCameraLens = false);
  }

  void _processCameraImage(CameraImage image) {
    final inputImage = _inputImageFromCameraImage(image);
    if (inputImage == null) return;

    widget.onImage(inputImage);
  }

  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    if (_controller == null) return null;

    // get image rotation
    // it is used in android to convert the InputImage from Dart to Java: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/android/src/main/java/com/google_mlkit_commons/InputImageConverter.java
    // `rotation` is not used in iOS to convert the InputImage from Dart to Obj-C: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/ios/Classes/MLKVisionImage%2BFlutterPlugin.m
    // in both platforms `rotation` and `camera.lensDirection` can be used to compensate `x` and `y` coordinates on a canvas: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/example/lib/vision_detector_views/painters/coordinates_translator.dart
    final camera = _cameras[_cameraIndex];
    final sensorOrientation = camera.sensorOrientation;
    // print(
    //     'lensDirection: ${camera.lensDirection}, sensorOrientation: $sensorOrientation, ${_controller?.value.deviceOrientation} ${_controller?.value.lockedCaptureOrientation} ${_controller?.value.isCaptureOrientationLocked}');
    InputImageRotation? rotation;
    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation =
          _orientations[_controller!.value.deviceOrientation];
      if (rotationCompensation == null) return null;
      if (camera.lensDirection == CameraLensDirection.front) {
        // front-facing
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        // back-facing
        rotationCompensation =
            (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
      // print('rotationCompensation: $rotationCompensation');
    }
    if (rotation == null) return null;
    // print('final rotation: $rotation');

    // get image format
    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    // validate format depending on platform
    // only supported formats:
    // * nv21 for Android
    // * bgra8888 for iOS
    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) return null;

    // since format is constraint to nv21 or bgra8888, both only have one plane
    if (image.planes.length != 1) return null;
    final plane = image.planes.first;

    // compose InputImage using bytes
    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation, // used only in Android
        format: format, // used only in iOS
        bytesPerRow: plane.bytesPerRow, // used only in iOS
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  BorderPainter(this.scanWindow);

  final Rect scanWindow;

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.save();
    // final backgroundPath = Path()..addRect(Rect.largest);
    //
    // // Draw the white border
    // double sh = scanWindow.height; // for convenient shortage
    // double sw = scanWindow.width; // for convenient shortage
    // double cornerSide = sh * 0.1; // desirable value for corners side
    //
    // final cutoutPath = Path()
    //   ..addRRect(
    //     RRect.fromRectAndCorners(
    //       scanWindow,
    //       topLeft: Radius.circular(borderRadius),
    //       topRight: Radius.circular(borderRadius),
    //       bottomLeft: Radius.circular(borderRadius),
    //       bottomRight: Radius.circular(borderRadius),
    //     ),
    //   )
    //   ..moveTo(cornerSide, 0)
    //   ..quadraticBezierTo(0, 0, 0, cornerSide)
    //   ..moveTo(0, sh - cornerSide)
    //   ..quadraticBezierTo(0, sh, cornerSide, sh)
    //   ..moveTo(sw - cornerSide, sh)
    //   ..quadraticBezierTo(sw, sh, sw, sh - cornerSide)
    //   ..moveTo(sw, cornerSide)
    //   ..quadraticBezierTo(sw, 0, sw - cornerSide, 0);
    //
    // final backgroundPaint = Paint()
    //   ..color = Colors.transparent
    //   ..style = PaintingStyle.fill
    //   ..blendMode = BlendMode.dstOut;
    //
    // final backgroundWithCutout = Path.combine(
    //   PathOperation.difference,
    //   backgroundPath,
    //   cutoutPath,
    // );
    //
    // final canvasRect = Offset.zero & size;
    // const rectWidth = 200.0;
    // final rect = Rect.fromCircle(
    //   center: canvasRect.center,
    //   radius: rectWidth / 2,
    // );
    // const radius = 12.0;
    // const strokeWidth = 3.0;
    // const extend = radius + 24.0;
    // var arcSize = const Size.square(radius * 2);
    //
    // canvas.translate(rect.left, rect.top);
    // final path = Path();
    // for (var i = 0; i < 4; i++) {
    //   final l = i & 1 == 0;
    //   final t = i & 2 == 0;
    //   path
    //     ..moveTo(l ? 0 : rectWidth, t ? extend : rectWidth - extend)
    //     ..arcTo(
    //         Offset(l ? 0 : rectWidth - arcSize.width,
    //                 t ? 0 : rectWidth - arcSize.width) &
    //             arcSize,
    //         l ? pi : pi * 2,
    //         l == t ? pi / 2 : -pi / 2,
    //         false)
    //     ..lineTo(l ? extend : rectWidth - extend, t ? 0 : rectWidth);
    // }
    // canvas.drawPath(
    //   path,
    //   Paint()
    //     ..color = Colors.white
    //     ..strokeWidth = strokeWidth
    //     ..style = PaintingStyle.stroke,
    // );
    // canvas.restore();
    //
    // canvas.drawPath(backgroundWithCutout, backgroundPaint);
    canvas.save();
    final rect = Rect.fromLTWH(
      scanWindow.left,
      scanWindow.top,
      scanWindow.width,
      scanWindow.height,
    );
    //border radius
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawRect(rect, paint);

    //Fill the background with grey color
    final paintBg = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill;
    final rectBg = Rect.fromLTWH(0, 0, size.width, size.height);
    final bgPath = Path()..addRect(rectBg);
    final path = Path()..addRect(rect);
    final region = Path.combine(PathOperation.difference, bgPath, path);
    canvas.drawPath(region, paintBg);
    canvas.restore();
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BorderPainter oldDelegate) => false;
}
