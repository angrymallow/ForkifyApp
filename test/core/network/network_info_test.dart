import 'package:ForkifyApp/core/network/network_info.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  MockDataConnectionChecker mockDataConnectionChecker;
  NetworkInfoImpl networkInfo;

  setUp((){
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(
      dataConnectionChecker: mockDataConnectionChecker
    );
  });

  test('should forward has connection property to the networkinfo', () async{
    // Arrange
    final tHasConnectionFutre = Future.value(true);
    when(mockDataConnectionChecker.hasConnection).thenAnswer((_) => tHasConnectionFutre);

    // Act
    final result = networkInfo.isConnected;

    // Assert
    verify(mockDataConnectionChecker.hasConnection);
    expect(result, tHasConnectionFutre);
  });
}