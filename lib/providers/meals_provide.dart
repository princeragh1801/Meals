import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProvider = Provider((ref) {
  return DUMMY_MEALS;
});
