import '../components/otp_type.dart';

abstract class OTPUtil {
  static String otpTypeValue({OTPType? type = OTPType.TOTP}) {
    switch (type) {
      case OTPType.TOTP:
        return "totp";

      case OTPType.HOTP:
        return "hotp";

      default:
        return "totp";
    }
  }
}
