// ignore_for_file: unused_local_variable

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ExternalshowADS(context)
  final sharedPreferences = await SharedPreferences.getInstance();
 
}
