// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/module/comingsoon/comingsoon.dart';
// import 'package:flutter_application_1/module/details/presentation/details.dart';
// import 'package:flutter_application_1/module/explore/presentation/explore.dart';
// import 'package:flutter_application_1/module/first_page/presentation/first_page.dart';
// import 'package:flutter_application_1/module/home/presentation/home.dart';
// import 'package:flutter_application_1/module/onboarding/presentation/onboarding.dart';
// import 'package:flutter_application_1/module/profile/presentation/profile.dart';
// import 'package:flutter_application_1/module/register_product/presentation/register_product.dart';
// import 'package:flutter_application_1/module/scan_product/presentation/scan_product.dart';
// import 'package:flutter_application_1/module/search/presentation/search.dart';
// //import 'package:flutter_application_1/module/search_scanned_product/domain/usecases/search_scanned_product.dart';
// import 'package:flutter_application_1/module/search_scanned_product/presentation/search_scanned.dart';
// import 'package:flutter_application_1/module/settings/settings.dart';
// import 'package:flutter_application_1/module/splash/presentation/splash.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       title: 'Flutter Demo',
//       theme: ThemeData(),
//       routes: {
//         // When navigating to the "/" route, build the FirstScreen widget.
//         '/': (context) => const SplashScreen(),
//         '/onboard': (context) => const OnBoarding(),
//         // When navigating to the "/second" route, build the SecondScreen widget.
//         '/onboardFinish': (context) => const OnBoarding4(),
//         '/comingSoon': (context) => const ComingSoon(),
//         '/explore': (context) => const Explore(),
//         '/search': (context) => const Search(),
//         '/search_scanned': (context) => const SearchScannedProduct(),
//         '/settings': (context) => const Settings(),
//         '/home': (context) => const MyFirstPage(),
//         '/details': (context) => const Details(),
//         '/profile': (context) => const Profile(),
//         '/register_product': (context) => const RegisterProduct(),
//         '/scan_product': (context) => const ScanProduct(),
//       },
//     );
//   }
// }
//
// // class LoadingScreen extends StatelessWidget {
// //   const LoadingScreen({super.key});
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return Image.asset("./assets/images/loading/loading_screen.png");
// //   }
// // }
//
//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/services/injection_container.dart';
import 'package:flutter_application_1/module/history/domain/usecase/get_submitted_item.dart';
import 'package:flutter_application_1/module/history/presentation/cubit/submitted_product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/common/extensions/size_ext.dart';
import 'core/services/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SubmittedProductCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(dWidth, dHeight),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Solana",
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(accentColor: Colors.white),
              useMaterial3: true,
              appBarTheme: const AppBarTheme(color: Colors.transparent),
              visualDensity: VisualDensity.adaptivePlatformDensity),
          onGenerateRoute: generateRoute,
        ),
      ),
    );
  }
}
