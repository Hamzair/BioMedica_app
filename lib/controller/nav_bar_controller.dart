import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController {


  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}