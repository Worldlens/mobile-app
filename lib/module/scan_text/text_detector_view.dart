import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/module/scan_text/text_detector_painter.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:touchable/touchable.dart';

import 'detector_view.dart';

class TextRecognizerView extends StatefulWidget {
  TextRecognizerView(
    this.setState, {
    this.titleHeader = "Scanning...",
    this.onSkip,
    this.isScanName = true,
    this.onRegister,
    this.onBack,
  });

  final String? titleHeader;
  final Function? onSkip;
  final bool? isScanName;
  final Function(String)? onRegister;
  final Function? onBack;

  @override
  State<TextRecognizerView> createState() => _TextRecognizerViewState();
  Function(String) setState;
}

class _TextRecognizerViewState extends State<TextRecognizerView> {
  final _script = TextRecognitionScript.latin;
  final _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  bool _canProcess = true;
  bool _isBusy = false;
  CanvasTouchDetector? _customPaint;

  TextRecognizerPainter? _customPainter;
  String? _text;
  var _cameraLensDirection = CameraLensDirection.back;

  @override
  void dispose() async {
    _canProcess = false;
    _textRecognizer.close();
    super.dispose();
    print("text reconi dispose");
  }

  @override
  Widget build(BuildContext context) {
    return DetectorView(
      isScanName: widget.isScanName,
      onSkip: widget.onSkip,
      titleHeader: widget.titleHeader,
      title: 'Text Detector',
      customPaint: _customPaint,
      text: _text,
      customPainter: _customPainter,
      onImage: _processImage,
      initialCameraLensDirection: _cameraLensDirection,
      onCameraLensDirectionChanged: (value) => _cameraLensDirection = value,
      setState: widget.setState,
      onBack: widget.onBack,
    );
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final recognizedText = await _textRecognizer.processImage(inputImage);
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      _text = recognizedText.text;
      _customPaint = CanvasTouchDetector(builder: (myContext) {
        final painter = TextRecognizerPainter(
          recognizedText,
          inputImage.metadata!.size,
          inputImage.metadata!.rotation,
          _cameraLensDirection,
          myContext,
          widget.setState,
          isScanName: widget.isScanName,
          onRegister: widget.onRegister,
        );
        return CustomPaint(
          painter: painter,
        );
      });
    } else {
      _text = 'Recognized text:\n\n${recognizedText.text}';
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
