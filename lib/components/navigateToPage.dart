import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void navigateToPage(BuildContext context, Widget page) {
  Navigator.push(
    context,
    PageTransition(
      child: page,
      type: PageTransitionType.scale,
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 400),
    ),
  );
}
