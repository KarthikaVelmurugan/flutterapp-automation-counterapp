import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Counter App", () {
    final textFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');
    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    test("Increment the value", () async {
      for (int i = 1; i < 20; i++) {
        await driver.tap(buttonFinder);
        expect(await driver.getText(textFinder), i.toString());
      }
    });
  });
}
