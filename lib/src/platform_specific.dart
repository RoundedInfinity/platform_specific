import 'package:platform_specific/src/platforms.dart';

/// Callback for a function that returns [T].
typedef PlatformCallback<T> = T Function();

/// A utility class for platform-specific operations and callbacks.
class Platforms {
  /// Invokes the appropriate platform-specific callback based on the given
  /// map of platform types and corresponding callback functions.
  ///
  /// The [map] parameter is a map where each key represents a [PlatformType],
  /// and the corresponding value is a callback function that returns
  /// a value of type [T].
  /// The platform type indicates the target platform for which the
  /// callback should be executed.
  ///
  /// The [override] parameter allows specifying a specific platform
  /// type to override the automatic platform detection.
  /// This is useful for testing platform specific behavior.
  ///
  /// The [orElse] parameter is a fallback callback function that will be
  /// executed when no platform type matches  the automatic platform detection.
  /// It should also return a value of type [T].
  ///
  /// Returns the value returned by the executed callback function associated
  /// with the detected or overridden platform type. If no platform type matches
  /// and [orElse] is provided, the value returned by [orElse] will be returned.
  ///
  /// If neither a platform type matches nor [orElse] is provided,
  /// `null` is returned.
  ///
  /// Example:
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
  /// print(myValue); // Output: 🍎 (if running on iOS or macOS), 🤖 (if running on Android), 🪟 (if running on Windows), or 'unknown' (if running on any other platform).
  /// ```
  static T? on<T>(
    Map<PlatformType, PlatformCallback<T>> map, {
    PlatformType? override,
    PlatformCallback<T>? orElse,
  }) {
    final filtered = map.entries
        .where((element) => element.key.isPlatform(override))
        .firstOrNull;

    // Return the orElse function when no platform matches.
    if (filtered == null && orElse != null) {
      return orElse.call();
    }
    return filtered?.value.call();
  }
}
