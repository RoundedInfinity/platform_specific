// ignore_for_file: avoid_print

import 'package:platform_specific/platform_specific.dart';

void main(List<String> args) {
  final myValue = Platforms.on<String>(
    {
      PlatformTypes.android: () {
        return '🤖';
      },
      PlatformTypes.windows: () {
        return '🪟';
      },
      PlatformTypes.oneOf([PlatformTypes.iOS, PlatformTypes.macOS]): () {
        return '🍎';
      }
    },
    orElse: () {
      return 'unknown';
    },
  );

  print(myValue);
}

class MyCustomPlatform extends PlatformType {
  const MyCustomPlatform();

  @override
  // here you can test for your specific platform.
  bool isPlatform(PlatformType? override) => true;
}
