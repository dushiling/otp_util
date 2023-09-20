import 'package:flutter_test/flutter_test.dart';

import 'package:otp_util/otp_util.dart';
import 'package:otp_util/src/utils/otp_util.dart';

void main() {
  test('adds one to input values', () {
    expect(OTPUtil.otpTypeValue(), 'totp');
    expect(OTPUtil.otpTypeValue(type: OTPType.HOTP), 'hotp');
  });
}
