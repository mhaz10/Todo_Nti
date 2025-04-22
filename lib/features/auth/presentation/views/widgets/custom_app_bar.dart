import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

class CustomAppBar extends PreferredSize {
  const CustomAppBar({super.key, required super.preferredSize, required super.child});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: child,
      ),
    );
  }
}