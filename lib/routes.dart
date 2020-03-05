import 'package:flutter/material.dart';
import 'package:saryin/screens/home/home_screen.dart';
import 'package:saryin/screens/login/login_screen.dart';

final routes = {
  '/login': (BuildContext context) => new LoginScreen(),
  '/home' : (BuildContext context) => new HomeScreen(),
  '/': (BuildContext context) => new LoginScreen()
};
