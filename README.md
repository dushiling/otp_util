# otp_util

`otp_util` is a dart package to generate and verify one-time passwords that were used to implement 2FA and MFA authentication method in web applications and other login-required systems.

The package was implement based on [RFC4226](https://tools.ietf.org/html/rfc4226) (HOTP: An HMAC-Based One-Time Password Algorithm) and [RFC6238](https://tools.ietf.org/html/rfc6238) (TOTP: Time-Based One-Time Password Algorithm).

## Feature

* Create and verify a HOTP object
* Create and verify a TOTP object
* Generate a `otpauth url` with the b32 encoded string
* Support for OTP tokens encrypted with SHA1, SHA256, SHA384 and SHA512

### Installation

#### Pubspec

Add `otp_util` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  otp_util: ^1.0.1
```

### Example

#### Time-based OTPs

```dart
import 'package:dart_otp/dart_otp.dart';

void main() {

  /// default initialization for intervals of 30 seconds and 6 digit tokens
  TOTP totp = TOTP(secret: "BASE32ENCODEDSECRET");

  /// initialization for custom interval and digit values
  TOTP totp = TOTP(secret: "BASE32ENCODEDSECRET", interval: 60, digits: 8);

  totp.now(); /// => 745872

  /// verify for the current time
  totp.verify(otp: '745872'); /// => true

  /// verify after 30s
  totp.verify(otp: '745872'); /// => false
}
```

#### Counter-based OTPs

```dart
import 'package:dart_otp/dart_otp.dart';

void main() {

  /// default initialization for intervals of 30 seconds and 6 digit tokens
  HOTP hotp = HOTP(secret: "BASE32ENCODEDSECRET");

  /// initialization for custom counter and digit value
  HOTP hotp = HOTP(secret: "BASE32ENCODEDSECRET", counter: 50, digits: 8);

  hotp.at(counter: 0); /// => 145089
  hotp.at(counter: 1); /// => 899133
  hotp.at(counter: 2438); /// => 146071

  /// verify with a counter
  hotp.verify(otp: '397732', counter: 2438); /// => true
  hotp.verify(otp: '397732', counter: 2438); /// => false
}
```

### Release notes

See [CHANGELOG.md](./CHANGELOG.md).
