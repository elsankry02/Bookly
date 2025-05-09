import 'package:bookly/app.dart';
import 'package:flutter/material.dart';

import 'core/service_locator.dart';

void main() {
  serviceLocator();
  runApp(const Bookly());
}
