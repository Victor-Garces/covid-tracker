import 'dart:async';

import 'package:myapp/models/disease/disease.dart';

abstract class BaseDisease {
  Future<List<Disease>> getDiseases();
}
