import 'package:flutter_test/flutter_test.dart';
import 'package:testing_application_complete/dto/counter.dart';

void main() {
  test('Given Counter when call increment then must return 1', () {
    //Construccion de las precondiciones
    Counter counter = Counter();

    // Ejecucion de las acciones
    counter.incrementCounter();

    //Espero obtener como resultado de la prueba
    expect(counter.counter, 1);
  });
}
