import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testing_application_complete/user_model.dart';
import 'package:testing_application_complete/user_repository.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    userRepository = UserRepository(mockHttpClient);
  });

  test('Given UserRepository When Call getUser Then return 200', () async {
    //inicializacion
    when(() => mockHttpClient
            .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')))
        .thenAnswer((invocation) async {
      return Response('''
          {
          "id": 1,
          "name": "Leanne Graham",
          "username": "Bret",
          "email": "Sincere@april.biz",
          "address": {
            "street": "Kulas Light",
            "suite": "Apt. 556",
            "city": "Gwenborough",
            "zipcode": "92998-3874",
            "geo": {
              "lat": "-37.3159",
              "lng": "81.1496"
            }
          },
          "phone": "1-770-736-8031 x56442",
          "website": "hildegard.org",
          "company": {
            "name": "Romaguera-Crona",
            "catchPhrase": "Multi-layered client-server neural-net",
            "bs": "harness real-time e-markets"
          }
        }
      ''', 200);
    });

    //ejecucion
    final user = await userRepository.getUser();

    //asercion
    expect(user, isA<User>());
  });
}
