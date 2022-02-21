import 'package:test/test.dart';

Matcher moreOrLessEquals(num value) => closeTo(value, 1e-9);
