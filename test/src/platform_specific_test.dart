// ignore_for_file: prefer_const_constructors
import 'package:platform_specific/platform_specific.dart';
import 'package:test/test.dart';

void main() {
  group('Platforms', () {
    group('Works for platforms', () {
      test('android', () {
        final val = Platforms.on<bool>(
          {
            PlatformTypes.android: () {
              return true;
            }
          },
          override: PlatformTypes.android,
        );
        expect(val, equals(true));
      });

      test('fuchsia', () {
        final val = Platforms.on<bool>(
          {
            PlatformTypes.fuchsia: () {
              return true;
            }
          },
          override: PlatformTypes.fuchsia,
        );
        expect(val, equals(true));
      });

      test('iOS', () {
        final val = Platforms.on<bool>(
          {
            PlatformTypes.iOS: () {
              return true;
            }
          },
          override: PlatformTypes.iOS,
        );
        expect(val, equals(true));
      });

      test('linux', () {
        final val = Platforms.on<bool>(
          {
            PlatformTypes.linux: () {
              return true;
            }
          },
          override: PlatformTypes.linux,
        );
        expect(val, equals(true));
      });

      test('macOS', () {
        final val = Platforms.on<bool>(
          {
            PlatformTypes.macOS: () {
              return true;
            }
          },
          override: PlatformTypes.macOS,
        );
        expect(val, equals(true));
      });

      test('web', () {
        final val = Platforms.on<bool>(
          {
            PlatformTypes.web: () {
              return true;
            }
          },
          override: PlatformTypes.web,
        );
        expect(val, equals(true));
      });

      test('windows', () {
        final val = Platforms.on<bool>(
          {
            PlatformTypes.windows: () {
              return true;
            }
          },
          override: PlatformTypes.windows,
        );
        expect(val, equals(true));
      });
    });

    test('returns null when no platform was matched', () {
      final val = Platforms.on<bool>(
        {
          PlatformTypes.web: () {
            return true;
          }
        },
        override: PlatformTypes.android,
      );
      expect(val, isNull);
    });
    test('returns for oneOf', () {
      final val = Platforms.on<bool>(
        {
          PlatformTypes.oneOf([PlatformTypes.android, PlatformTypes.macOS]):
              () {
            return true;
          },
        },
        override: PlatformTypes.android,
      );

      final other = Platforms.on<bool>(
        {
          PlatformTypes.oneOf([PlatformTypes.android, PlatformTypes.macOS]):
              () {
            return true;
          },
        },
        override: PlatformTypes.macOS,
      );
      expect(val, equals(true));
      expect(other, equals(true));
    });

    test('returns first match', () {
      final val = Platforms.on<bool>(
        {
          PlatformTypes.oneOf([PlatformTypes.android, PlatformTypes.macOS]):
              () {
            return true;
          },
          PlatformTypes.android: () {
            return false;
          },
        },
        override: PlatformTypes.android,
      );
      expect(val, equals(true));
    });

    test('returns orElse', () {
      final val = Platforms.on<bool>(
        {
          PlatformTypes.android: () {
            return true;
          },
        },
        override: PlatformTypes.windows,
        orElse: () {
          return true;
        },
      );
      expect(val, equals(true));
    });

    test('returns for isDesktop', () {
      final valOnWindows = Platforms.on<bool>(
        {
          PlatformTypes.isDesktop: () {
            return true;
          },
        },
        override: PlatformTypes.windows,
      );

      final valOnLinux = Platforms.on<bool>(
        {
          PlatformTypes.isDesktop: () {
            return true;
          },
        },
        override: PlatformTypes.linux,
      );

      final valOnMac = Platforms.on<bool>(
        {
          PlatformTypes.isDesktop: () {
            return true;
          },
        },
        override: PlatformTypes.macOS,
      );

      expect(valOnWindows, equals(true));
      expect(valOnLinux, equals(true));
      expect(valOnMac, equals(true));
    });
  });
}
