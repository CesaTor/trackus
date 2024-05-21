import 'package:flutter/material.dart';
import 'package:trackus/_shared/global.dart';

extension ColorExtension on int? {
  Color get color => Color(this ?? defaultColor.value);
}
