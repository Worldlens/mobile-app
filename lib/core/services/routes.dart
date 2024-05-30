import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/module/connect_wallet/presentation/connect_wallet.dart';
import 'package:flutter_application_1/module/home/presentation/home.dart';
import 'package:flutter_application_1/module/comingsoon/presentation/comingsoon.dart';
import 'package:flutter_application_1/module/details/presentation/details.dart';
import 'package:flutter_application_1/module/explore/presentation/explore.dart';
import 'package:flutter_application_1/module/history/presentation/history.dart';
import 'package:flutter_application_1/module/onboarding/presentation/onboarding.dart';
import 'package:flutter_application_1/module/profile/presentation/profile.dart';

import 'package:flutter_application_1/module/scan_product/presentation/scan_product.dart';
import 'package:flutter_application_1/module/scan_text/text_detector_view.dart';
import 'package:flutter_application_1/module/search/presentation/search.dart';
import 'package:flutter_application_1/module/search_scanned_product/presentation/search_scanned.dart';

import 'package:flutter_application_1/module/settings/settings.dart';

import '../../module/register_product/presentation/register_product.dart';
import '../../module/splash/presentation/splash.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return _pageBuilder((context) => const SplashScreen(),
          settings: settings);
    case OnBoarding.routeName:
      return _pageBuilder((context) => const OnBoarding(), settings: settings);
    case ConnectWalletScreen.routeName:
      return _pageBuilder((context) => const ConnectWalletScreen(),
          settings: settings);
    case BottomBarSolana.routeName:
      return _pageBuilder((context) => const BottomBarSolana(),
          settings: settings);
    // case OnBoarding4.routeName:
    //   return _pageBuilder((context) => const OnBoarding4(), settings: settings);
    case Explore.routeName:
      return _pageBuilder((context) => const Explore(), settings: settings);
    case Profile.routeName:
      return _pageBuilder((context) => const Profile(), settings: settings);
    case Settings.routeName:
      return _pageBuilder((context) => const Settings(), settings: settings);
    case Search.routeName:
      return _pageBuilder((context) => const Search(), settings: settings);
    case ScanProduct.routeName:
      return _pageBuilder(
          (context) => const ScanProduct(
                from: "",
              ),
          settings: settings);
    case Details.routeName:
      return _pageBuilder((context) => const Details(), settings: settings);
    case RegisterProduct.routeName:
      return _pageBuilder((context) => const RegisterProduct(),
          settings: settings);
    case History.routeName:
      return _pageBuilder((context) => const History(), settings: settings);
    case SearchScannedProduct.routeName:
      return _pageBuilder((context) => const SearchScannedProduct(),
          settings: settings);
    // case TextRecognizerView.name:
    //   return _pageBuilder((context) => TextRecognizerView((String a) {}),
    //       settings: settings);
    default:
      return _pageBuilder((_) => const ComingSoon(), settings: settings);
  }
}

PageRouteBuilder<dynamic> _pageBuilder(Widget Function(BuildContext) page,
    {required RouteSettings settings}) {
  return PageRouteBuilder(
      settings: settings,
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
      pageBuilder: (context, _, __) => page(context));
}
