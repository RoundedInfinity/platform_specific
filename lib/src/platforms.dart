import 'package:universal_platform/universal_platform.dart';

/// {@template platform_type}
/// Abstract class representing a platform type.
///
/// Use can use this to implement your own platform.
///
/// Example:
///```dart
/// class Web extends PlatformType {
///   const Web();
///   @override
///   bool isPlatform(PlatformType? override) =>
///       override == this || UniversalPlatform.isWeb;
/// }
/// ```
/// {@endtemplate}
abstract class PlatformType {
  /// {@macro platform_type}
  const PlatformType();

  /// Checks if this is the current platform.
  ///
  /// When `override == this` this should return true.
  bool isPlatform(PlatformType? override);
}

class _Web extends PlatformType {
  const _Web();
  @override
  bool isPlatform(PlatformType? override) =>
      override == this || UniversalPlatform.isWeb;
}

class _Windows extends PlatformType {
  const _Windows();
  @override
  bool isPlatform(PlatformType? override) =>
      override == this || UniversalPlatform.isWindows;
}

class _Linux extends PlatformType {
  const _Linux();
  @override
  bool isPlatform(PlatformType? override) =>
      override == this || UniversalPlatform.isLinux;
}

class _Android extends PlatformType {
  const _Android();
  @override
  bool isPlatform(PlatformType? override) =>
      override == this || UniversalPlatform.isAndroid;
}

class _MacOS extends PlatformType {
  const _MacOS();
  @override
  bool isPlatform(PlatformType? override) =>
      override == this || UniversalPlatform.isMacOS;
}

class _Fuchsia extends PlatformType {
  const _Fuchsia();
  @override
  bool isPlatform(PlatformType? override) =>
      override == this || UniversalPlatform.isFuchsia;
}

class _IOS extends PlatformType {
  const _IOS();
  @override
  bool isPlatform(PlatformType? override) =>
      override == this || UniversalPlatform.isIOS;
}

class _Combined extends PlatformType {
  const _Combined({required this.types});

  final List<PlatformType> types;
  @override
  bool isPlatform(PlatformType? override) =>
      types.any((element) => element.isPlatform(override));
}

/// A collection of different platform types.
///
/// See also:
/// - `Platforms.on`
class PlatformTypes {
  ///Whether the program is running on web.
  static const web = _Web();

  ///Whether the operating system is a version of Windows.
  static const windows = _Windows();

  ///Whether the operating system is a version of Linux.
  static const linux = _Linux();

  ///Whether the operating system is a version of Android.
  static const android = _Android();

  ///Whether the operating system is a version of macOS.
  static const macOS = _MacOS();

  ///Whether the operating system is a version of Fuchsia.
  static const fuchsia = _Fuchsia();

  ///Whether the operating system is a version of iOS.
  static const iOS = _IOS();

  /// Whether the current platform is one of [types].
  static PlatformType oneOf(List<PlatformType> types) =>
      _Combined(types: types);

  /// Whether the current platform is [windows], [linux] or [macOS].
  static final isDesktop = oneOf([windows, linux, macOS]);
}
