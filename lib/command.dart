import 'dart:math';
import 'package:flutter/material.dart';
String getRandomString(int length) {
  const characters =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random random = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
}



/// Based on https://www.youtube.com/watch?v=Wl4F5V6BoJw
