import 'package:design_tokens_chapter/theme/generated_kit.dart' as g;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonKit {
  static final primary = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(g.KitColors.button),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    textStyle: MaterialStateProperty.all(GoogleFonts.getFont(
      g.fontFamilies.button,
      fontSize: g.fontSize.PrimaryButton,
      letterSpacing: g.letterSpacing.button * g.fontSize.PrimaryButton,
    )),
    padding:
        MaterialStateProperty.all(const EdgeInsets.fromLTRB(16, 16, 16, 16)),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(g.ButtonRadius)),
      ),
    ),
  );
}
