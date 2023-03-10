import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'app/routes/app_pages.dart';

void main() {
  Intl.withLocale('id', () => print("ok"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: Color.fromARGB(255, 25, 192, 136),
            elevation: 0,
            centerTitle: true,
            // toolbarHeight: 100,
            actionsIconTheme: IconThemeData(color: Colors.white),
          ),
          scaffoldBackgroundColor: Colors.grey.shade100),
    );
  }
}
