// import 'dart:convert';
// import 'package:finsight/presentation/login/login_view.dart';
// import 'package:finsight/presentation/register/register_view_model.dart';
// import 'package:finsight/service/api_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:mockito/annotations.dart';

// class MockBuildContext extends Mock implements BuildContext {}
// class MockCommonApiServices extends Mock implements CommonApiServices {}

// @GenerateMocks([CommonApiServices])
// void main() {
//   late MockCommonApiServices mockApiService;
//   late RegisterViewModel registerViewModel;

//   setUp(() {
//     mockApiService = MockCommonApiServices();
//     registerViewModel = RegisterViewModel();
//   });

//   testWidgets('saveUserDetails should save user details and navigate to LoginView on success', (WidgetTester tester) async {
//     final mockContext = MockBuildContext();
//     final email = 'test@example.com';
//     final password = 'password';
//     final userName = 'Test User';
//     final response = jsonEncode({'success': true});

//     when(mockApiService.saveData(any, any, any)).thenAnswer((_) async => Future.value(response));

//     await tester.runAsync(() async {
//       registerViewModel.saveUserDetails(
//         email: email,
//         password: password,
//         userName: userName,
//         context: mockContext,
//       );
//     });

//     verify(mockApiService.saveData('/register', json.encode({
//       'email': email,
//       'password': password,
//       'name': userName,
//     }), mockContext)).called(1);

//     expect(registerViewModel.customerName, userName);
//     verify(mockContext.pushReplacement(any)).called(1);
//   });
// }