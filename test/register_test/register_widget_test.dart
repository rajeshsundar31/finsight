import 'package:finsight/component/custom_button.dart';
import 'package:finsight/presentation/register/register_view.dart';
import 'package:finsight/presentation/register/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('Register widget to register User', () {
    late RegisterViewModel registerViewModel;

    setUp(() {
      registerViewModel = RegisterViewModel();
    });

    testWidgets('test register page', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => registerViewModel,
          child: const RegisterUser(),
        ),
      ));

      final backgroundImage = find.byType(Image);
      expect(backgroundImage, findsOneWidget);

      final headingText = find.text("Register User");
      expect(headingText, findsOneWidget);

      expect(find.byType(TextFormField), findsNWidgets(3));

      expect(find.byType(CustomButton), findsOneWidget);
    });

    testWidgets('Validating Text Form Fields', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => registerViewModel,
          child: const RegisterUser(),
        ),
      ));

      await tester.tap(find.byType(CustomButton));

      await tester.pump();

      expect(find.text('Please Enter valid Name'), findsOneWidget);

      expect(find.text('Please Enter valid Mail Addess'), findsOneWidget);

      expect(find.text('Password cannot be Empty'), findsOneWidget);
    });
  });
}
