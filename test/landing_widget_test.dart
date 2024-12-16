import 'package:finsight/component/custom_button.dart';
import 'package:finsight/core/constants/app_strings.dart';
import 'package:finsight/presentation/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class MockNavigatorObserver extends Mock implements NavigatorObserver {}
void main () {

  group('test all', (){
    late NavigatorObserver mockObserver;

  setUp(() {
    mockObserver = MockNavigatorObserver();
  });

  testWidgets('Test Landing page', (tester) async{

    // To Validate Widget to Test
    await tester.pumpWidget(MaterialApp(
      home: const LandingPage(),
      navigatorObservers: [mockObserver], 
      ));

    // Test the Heading
    final headingText = find.text(AppStrings.welcome);
    expect(headingText, findsOneWidget);

    // Test the Image
    final landingImage = find.byType(Image);
    expect(landingImage, findsOneWidget);

    // Test Navigate Button

    final navigateButton = find.byType(CustomButton);

    expect(navigateButton, findsOneWidget);

  });

  });
}