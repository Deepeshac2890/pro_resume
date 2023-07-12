import 'package:flutter/material.dart';

BoxDecoration getNavItemSelectedDecor(bool isDarkMode, bool toShow) {
  return toShow
      ? BoxDecoration(boxShadow: [
          BoxShadow(
            color: (isDarkMode) ? Colors.black12 : Colors.white12,
            offset: const Offset(0.0, 1.0), //(x,y)
            blurRadius: 5.0,
          )
        ])
      : const BoxDecoration();
}
