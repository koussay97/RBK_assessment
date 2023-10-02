import 'package:shared_dart_sependancies/shared_dart_sependancies.dart';
import 'package:shared_domain/shared_domain.dart';
import 'package:test/test.dart';

import '../gode-gen/mock_genrator.dart';

void main() {
  late final GetToDoByIdUC sut; // system under test
  late final MockRepository fakeRepository;
  late final String testIDSuccess;
  late final String testIDFailure;
  late final TodoEntity testEntitySuccess;
  setUp(() {
    fakeRepository = MockRepository();
    sut = GetToDoByIdUC(repository: fakeRepository);
    testIDSuccess = 'sdfsfd';
    testIDFailure = 'azertyuiopqsdfghjklmwxcvbn,;:!m'; // 30 chars long
    testEntitySuccess = TodoEntity(
        name: 'say OY to friends',
        description: 'you should say OY to friends ',
        id: testIDSuccess);
  });

  group('testing GetToDoByIdUC', () {
    test('should call repository', () async {
      // arrange
      when(() async => await fakeRepository.getById.call(id: testIDSuccess))
          .thenAnswer((invocation) async =>
              await Future.value(Right(testEntitySuccess)));
      // act
      final result = await sut(param: testIDSuccess);
      // assert
      verify(() async => await fakeRepository.getById(id: testIDFailure));
      expect(result, testEntitySuccess);
    });
  });
}
