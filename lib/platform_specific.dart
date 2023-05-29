/// Dart package that simplifies handling platform-specific operations and callbacks in your Dart/Flutter applications.
///
/// Example usage:
/// ```dart
/// final myValue = Platforms.on<String>(
///   {
///     PlatformTypes.android: () {
///       return '🤖';
///     },
///     PlatformTypes.windows: () {
///       return '🪟';
///     },
///     PlatformTypes.oneOf([PlatformTypes.iOS, PlatformTypes.macOS]): () {
///       return '🍎';
///     }
///   },
///   orElse: () {
///     return 'unknown';
///   },
/// );
/// print(myValue); // Output: 🍎 (if running on iOS or macOS), 🤖 (if running on Android), 🪟 (if running on Windows), or 'unknown' (if running on any other platform)
/// ```
library platform_specific;

export 'src/platform_specific.dart';
export 'src/platforms.dart';
