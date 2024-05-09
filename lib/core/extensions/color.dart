import 'package:flutter/material.dart';
import 'package:trackus/lib.dart';

extension ColorExtension on int? {
  Color get color => Color(this ?? defaultColor.value);
}
