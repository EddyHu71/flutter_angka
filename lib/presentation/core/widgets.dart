import 'package:flutter/material.dart';
import 'package:flutter_angka/presentation/core/colours.dart';

class Widgets {
  static RawMaterialButton chooseButton({
    required VoidCallback callback,
    required String types,
  }) =>
      RawMaterialButton(
          fillColor: Colours.btnColor,
          onPressed: callback,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(types,
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ));
  static RawMaterialButton butons({
    required VoidCallback callback,
  }) =>
      RawMaterialButton(
          fillColor: Colours.btnColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Calculate", style: TextStyle(color: Colors.white)),
          ),
          onPressed: callback);
}
