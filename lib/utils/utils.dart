import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

///Generate MD5 hash
generateMd5(String string) {
  var content = new Utf8Encoder().convert(string);
  var md5 = crypto.md5;
  var digest = md5.convert(content);
  return hex.encode(digest.bytes);
}

