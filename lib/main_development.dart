import 'package:agrostack/app/app.dart';
import 'package:agrostack/bootstrap.dart';
import 'package:flutter/cupertino.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
}
