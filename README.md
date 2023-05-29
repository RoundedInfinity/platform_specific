# Platform Specific

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

Dart package that simplifies handling platform-specific operations and callbacks in your Dart/Flutter applications.

## Features 🚀

- Execute platform-specific callback functions based on the detected platform type.
- Define custom platform types to handle specific platforms.
- Supports a wide range of platforms out of the box including web, Windows, Linux, Android, macOS, Fuchsia, and iOS.

## Usage 🧪

Use the `Platforms.on` method to execute the appropriate callback function based on the platform:

```dart
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

print(myValue); // Output: 🍎 (if running on iOS or macOS), 🤖 (if running on Android), 🪟 (if running on Windows), or 'unknown' (if running on any other platform)

```

### Custom Platform Types

You can create custom platform types by extending the `PlatformType` class and overriding the `isPlatform` method. This allows you to handle additional platforms not covered by the predefined types.

```dart
class MyCustomPlatform extends PlatformType {
  const MyCustomPlatform();

  @override
  bool isPlatform(PlatformType? override) {
    // Add your custom platform detection logic here
    // Should return true if override == this
    ...
  }
}
```

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
