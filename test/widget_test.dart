// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:hm_shop/routes/index.dart';

void main() {
  testWidgets('default route shows the main page', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(getRootWiget());

    // The initial route is the main page, which renders the text "\u4e3b\u9875"
    // in both the AppBar title and the page body.
    expect(find.text('\u4e3b\u9875'), findsWidgets);
  });
}
