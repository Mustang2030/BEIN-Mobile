import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  static void push(BuildContext context, String route) {
    context.push(route);
  }

  static void pushReplacement(BuildContext context, String route) {
    context.go(route);
  }

  static void pushAndRemove(BuildContext context, String route) {
    context.go(route);
  }

  static void pop(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    }
  }
}
