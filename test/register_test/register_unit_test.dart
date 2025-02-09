import 'dart:convert';
import 'package:finsight/presentation/register/register_view_model.dart';
import 'package:finsight/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

class _MockBuildContext extends Mock implements BuildContext {
  void pushReplacementNamed(String routeName) {}
}
class _MockCommonApiServices extends Mock implements CommonApiServices {}

@GenerateMocks([CommonApiServices])
void main() {
  late _MockCommonApiServices mockApiService;
  late RegisterViewModel registerViewModel;

  setUp(() {
    mockApiService = _MockCommonApiServices();
    registerViewModel = RegisterViewModel();
  });

  testWidgets('saveUserDetails should save user details and navigate to LoginView on success', (WidgetTester tester) async {
    final mockContext = _MockBuildContext();
    const email = 'test@example.com';
    const password = 'password';
    const userName = 'Test User';
    final response = jsonEncode({'success': true});

    when(mockApiService.saveData("/register", any, mockContext)).thenAnswer((_) async => response);

     await tester.runAsync(() async {
      registerViewModel.saveUserDetails(
        email: email,
        password: password,
        userName: userName,
        context: mockContext,
      );
    });

    verify(mockApiService.saveData('/register', json.encode({
      'email': email,
      'password': password,
      'name': userName,
    }), mockContext)).called(1);

    expect(registerViewModel.customerName, userName);
    verify(mockContext.pushReplacementNamed('/login')).called(1);
  });
}