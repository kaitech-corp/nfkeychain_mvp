import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_chain_mvp/services/locator.dart';

import 'screens/home/home.dart';
import 'services/navigation/navigation_service.dart';
import 'services/navigation/router.dart';
import 'services/responsive/responsive_wrapper.dart';

void main() async {
  ///Initialize get it locator.
  setupLocator();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Sizer(
      builder: (context,orientation, deviceType) {

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NFKeychain',
          theme: ThemeData(
            fontFamily: GoogleFonts.literata().fontFamily,
            textTheme: GoogleFonts.literataTextTheme(
                Theme.of(context).textTheme
            ),
          ),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.dark,
          builder: (context, widget) {
            return responsiveWrapperBuilder(context, widget);
          },
          home: const MyHomePage(),
          navigatorKey: locator<NavigationService>().navigationKey,
          onGenerateRoute: generateRoute,
        );
      }
    );
  }
}


