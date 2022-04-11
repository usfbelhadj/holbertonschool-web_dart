import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("checking app", () {
    FlutterDriver? driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      Directory("screenshots").create();
    });
    tearDownAll(() async {
      if (driver != null) {
        await (driver!).close();
      }
    });
    test("name", () async {
      await driver!.takeScreenShot("testTaT");
    });
  });
}

extension on FlutterDriver {
  Future<void> takeScreenShot(String name) async {
    try {
      final filePath = File('screenshot/$name.jpg');
      if (await filePath.exists()) {
        await filePath.delete(recursive: true);
      }
      final file = await filePath.create(recursive: true);
      final png = await screenshot();
      file.writeAsBytesSync(png);
      print('screenshot take on name $name');
    } catch (e) {
      print("TTTTTTEEEEEEEEEESSSSSSSSSSTTTTTTTT    $e");
    }
  }
}
