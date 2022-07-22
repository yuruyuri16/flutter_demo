import 'package:flutter/material.dart';
import 'package:flutter_demo/app/app.dart';
import 'package:flutter_demo/home/home.dart';
import 'package:flutter_demo/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
