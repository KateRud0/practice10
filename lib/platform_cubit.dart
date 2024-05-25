import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class PlatformCubit extends Cubit<String> {
  PlatformCubit() : super(_getPlatform());

  static String _getPlatform() {
    if (kIsWeb) {
      return 'Web Platform';
    } else if (Platform.isAndroid) {
      return 'Android Platform';
    } else {
      return 'Unknown Platform';
    }
  }

  void showPlatformInfo() {
    emit(_getPlatform());
  }
}
