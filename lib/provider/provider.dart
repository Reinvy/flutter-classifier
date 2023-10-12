import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imageResultProvider = StateProvider.autoDispose<String?>((ref) => null);
final isLoadingProvider = StateProvider.autoDispose<bool>((ref) => false);
final imageProvider = StateProvider.autoDispose<XFile?>((ref) => null);
