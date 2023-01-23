import 'package:agrostack/l10n/l10n.dart';

class ValidationService {
  static final _emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  static String? notEmpty(String? val, [String? field]) {
    if (val != null && val.isEmpty) {
      return "${field ?? "field"} shuld not be empty";
    }
    return null;
  }

  static String? isEmail(String? val, AppLocalizations localizations) {
    if (val != null && _emailRegex.hasMatch(val)) {
      return null;
    }
    return localizations.validEmail;
  }

  static String? password(String? val, AppLocalizations localizations) {
    if (val != null && val.length > 6) {
      return null;
    }
    return localizations.strongPassword;
  }
}
