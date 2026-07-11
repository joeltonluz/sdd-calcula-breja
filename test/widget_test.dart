import 'package:flutter_test/flutter_test.dart';
import 'package:sdd_calcula_breja_flutter/main.dart';
import 'package:sdd_calcula_breja_flutter/core/di/injection.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    await di.init();
  });
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
  });
}



