import 'package:flutter/material.dart';



final double physicalHeight = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height;
final double physicalWidth = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;
final double devicePixelRatio =
    WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
final double height = physicalHeight / devicePixelRatio;
double heightScreen =
    physicalHeight / devicePixelRatio;
double widthScreen =
    physicalWidth / devicePixelRatio;

const double dHeight = 920;
const double dWidth = 414;


