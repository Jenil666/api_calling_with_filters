import 'package:api_calling/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main()
{
  WidgetsFlutterBinding;

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>  GetMaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        // initialRoute: ,
        getPages: [
          GetPage(name: '/', page: () => const HomeScreen()),
        ],
      ),
    ),
  );
}
