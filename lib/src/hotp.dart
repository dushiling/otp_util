///
/// @module   : HOTP module to generate and verify HOTP password
/// @author   : dushiling (dsl1197467923@gmail.com)
///

import 'components/otp_algorithm.dart';
import 'components/otp_type.dart';
import 'otp.dart';

///
/// HOTP class will generate the OTP (One Time Password) object with given counter.
class HOTP extends OTP {
  /// The counter value for one-time password.
  int? counter;

  @override
  OTPType get type => OTPType.HOTP;

  @override
  Map<String, dynamic> get extraUrlProperties => {"counter": counter};

  ///
  /// This constructor will create an HOTP instance.
  ///
  /// All parameters are mandatory however [counter],
  /// [digits] and [algorithm] have a default values, so can be ignored.
  ///
  /// Will throw an exception if the line above isn't satisfied.
  ///
  HOTP(
      {String? secret,
      int counter = 0,
      int digits = 6,
      OTPAlgorithm algorithm = OTPAlgorithm.SHA1})
      : super(secret: secret, digits: digits, algorithm: algorithm) {
    this.counter = counter;
  }

  ///
  /// Generate the HOTP value with the given count
  ///
  /// ```dart
  /// HOTP hotp = HOTP(secret: 'BASE32ENCODEDSECRET');
  /// hotp.at(counter: 0); // => 145089
  /// ```
  ///
  String at({int? counter}) {
    if (counter == null || counter < 0) {
      return '';
    }

    return super.generateOTP(input: counter);
  }

  ///
  /// Verifies the HOTP value passed in against the a given counter.
  ///
  /// All parameters are mandatory.
  ///
  /// ```dart
  /// HOTP hotp = HOTP(secret: 'BASE32ENCODEDSECRET');
  /// hotp.at(counter: 0); // => 145089
  /// // Verify for current time
  /// hotp.verify(otp: 145089, counter: 0); // => true
  /// // Verify after 30s
  /// hotp.verify(otp: 145089, counter: 10); // => false
  /// ```
  ///
  bool verify({String? otp, int? counter}) {
    if (otp == null || counter == null) {
      return false;
    }

    String otpCount = this.at(counter: counter);
    return otp == otpCount;
  }
}
