import 'package:finsight/component/custom_button.dart';
import 'package:finsight/presentation/register/register_view.dart';
import 'package:finsight/presentation/register/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockRegisterViewModel extends Mock implements RegisterViewModel {}

void main() {
  group('Register widget to register User', () {
    late RegisterViewModel registerViewModel;
    late MockRegisterViewModel mockmodel;

    setUp(() {
      registerViewModel = RegisterViewModel();
      mockmodel = MockRegisterViewModel();
    });

    testWidgets('test register page', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => registerViewModel,
          child: const RegisterUser(),
        ),
      ));

      // final backgroundImage = find.byType(Image);
      // expect(backgroundImage, findsOneWidget);

      final headingText = find.text("Register User Details");
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

    testWidgets('validate low charchater length in password', (tester) async {

      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => registerViewModel,
          child: const RegisterUser(),
        ),
      ));
      //Test textform field by enter value
      await tester.enterText(find.byKey(const Key('name')), 'John Doe');

      //Test email TextFormField by entering value
      await tester.enterText(find.byKey(const Key('email')), 'rajesh@gmail.com');

      //Test password by given weak or low characters
      await tester.enterText(find.byKey(const Key('password')), '123');

      //Tap the button to Test tha validation Flow
      await tester.tap(find.byType(CustomButton));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      //chech the validation weak message show on the profile
      expect(find.text("Password cannot be Empty"), findsOneWidget);
    });

    // testWidgets('mock value for Register User', (tester) async {
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: ChangeNotifierProvider(
    //         create: (_) => mockmodel,
    //         child: const RegisterUser(),
    //         ),
    //     ));

    //     await tester.enterText(find.byKey(const Key('name')), 'rajesh');
    //     await tester.enterText(find.byKey(const Key('email')), 'rajesh@gmail.com');
    //     await tester.enterText(find.byKey(const Key('password')), 'rajesh123');

    //     // await tester.tap(find.byType(CustomButton));
    //     final customButtonFinder = find.byType(CustomButton);

    //     final context = tester.element(customButtonFinder);

    //     await tester.tap(customButtonFinder);
    //     await tester.pump();

    //     verify(()=> mockmodel.saveUserDetails(
    //       email: 'rajesh@gmail.com', 
    //       password: 'rajesh123', 
    //       userName: 'rajesh', 
    //       context: context)).called(1);
    // });
  });
}
