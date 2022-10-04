import 'package:design_tokens_chapter/theme/generated_kit.dart' as g;
import 'package:flutter/material.dart';

class ButtonKit {
  static final primary = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(g.KitColors.button),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: g.fontSize.PrimaryButton)),
    padding:
        MaterialStateProperty.all(const EdgeInsets.fromLTRB(16, 16, 16, 16)),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(g.ButtonRadius)),
      ),
    ),
  );
}
