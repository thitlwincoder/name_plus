import 'dart:io';

import 'package:name_plus/name_plus.dart';

void main() {
  /// File

  /// without sync
  File(Directory.current.path).namePlus('test.txt');
  // test 1.txt

  File(Directory.current.path).namePlus('test.txt', format: '(d)');
  // test (1).txt

  File(Directory.current.path).namePlus('test.txt', space: false);
  // test1.txt

  /// with sync
  File(Directory.current.path).namePlusSync('test.txt');
  // test 1.txt

  /// Directory

  /// without sync
  Directory(Directory.current.path).namePlus('test');
  // test 1

  Directory(Directory.current.path).namePlus('test', format: '(d)');
  // test (1)

  Directory(Directory.current.path).namePlus('test', space: false);
  // test1

  /// with sync
  Directory(Directory.current.path).namePlusSync('test');
  // test 1
}
