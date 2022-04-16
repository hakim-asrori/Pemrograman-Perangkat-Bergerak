import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Authors',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    )
  );
}

