import 'package:finsight/presentation/register/register_view_model.dart';
import 'package:finsight/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';


// Mocking dependencies
class MockBuildContext extends Mock implements BuildContext {}

class MockCommonApiServices extends Mock implements CommonApiServices {}



void main() {
  late RegisterViewModel registerViewModel;
  late MockCommonApiServices mockApiService;
  late MockBuildContext mockContext;

  setUp(() {
    // Initialize the mocks
    mockApiService = MockCommonApiServices();
    mockContext = MockBuildContext();
  });

  group('Register user', (){

    test('save Register Details', () {
      
    });
  });

  test('saveUserDetails calls Navigator.pushReplacement on successful response', () async {
    // Arrange: Mock the API service to return a successful response
    when(() => mockApiService.saveData(
      any(),
      any(),
      mockContext,
    )).thenAnswer((_) async => '{"success": true}');


  //   // Assert: Verify that Navigator.pushReplacement is called
  //   verify(() => Navigator.pushReplacement(
  //     mockContext,
  //     any(),
  //   )).called(1);

  //   // You can also check if the customerName was updated correctly
    // expect(registerViewModel.customerName, 'rajesh');
  });
}
