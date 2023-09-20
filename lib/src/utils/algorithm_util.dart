import 'package:crypto/crypto.dart';
import '../components/otp_algorithm.dart';

abstract class AlgorithmUtil {
  static Hmac createHmacFor(
      {OTPAlgorithm? algorithm = OTPAlgorithm.SHA1, required List<int> key}) {
    switch (algorithm) {
      case OTPAlgorithm.SHA1:
        return Hmac(sha1, key);
      case OTPAlgorithm.SHA256:
        return Hmac(sha256, key);
      case OTPAlgorithm.SHA384:
        return Hmac(sha384, key);
      case OTPAlgorithm.SHA512:
        return Hmac(sha512, key);

      default:
        return Hmac(sha1, key);
    }
  }

  static String rawValue({OTPAlgorithm? algorithm = OTPAlgorithm.SHA1}) {
    switch (algorithm) {
      case OTPAlgorithm.SHA1:
        return 'SHA1';
      case OTPAlgorithm.SHA256:
        return 'SHA256';
      case OTPAlgorithm.SHA384:
        return 'SHA384';
      case OTPAlgorithm.SHA512:
        return 'SHA512';

      default:
        return 'SHA1';
    }
  }
}
