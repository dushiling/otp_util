import 'package:otp_util/otp_util.dart';

void main() {
  TOTP totp = TOTP(secret: "BASE32ENCODEDSECRET");
  print(totp.now());
  print(totp.value(date: DateTime.now()));
  print(totp.verify(otp: totp.now(), time: DateTime.now()));

  TOTP totp2 = TOTP(secret: "BASE32ENCODEDSECRET", interval: 60, digits: 8);
  print(totp2.now());
  print(totp2.value(date: DateTime.now()));
  print(totp2.value(date: DateTime.parse('2018-10-10 09:30:36')));
  print(totp2.verify(otp: '80271722', time: DateTime.parse('2018-10-10 09:30:36')));

  print('*******************************');

  HOTP hotp = HOTP(secret: "BASE32ENCODEDSECRET");
  print(hotp.at(counter: 0));
  print(hotp.at(counter: 1));
  print(hotp.at(counter: 2438));
  print(hotp.verify(otp: '397732', counter: 2438));

  HOTP hotp2 = HOTP(secret: "BASE32ENCODEDSECRET", counter: 60, digits: 8);
  print(hotp2.at(counter: 0));
  print(hotp2.at(counter: 1));
  print(hotp2.at(counter: 2438));
  print(hotp2.verify(otp: '75397732', counter: 2438));
}
