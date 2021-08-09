part of 'this.dart';

class RandomIntegerGenerator {
  RandomIntegerGenerator._({
    required Random rng,
  }) : _rng = rng {
    _singleton = this;
  }

  factory RandomIntegerGenerator() => _singleton ?? RandomIntegerGenerator._(
    rng: Random(DateTime.now().microsecondsSinceEpoch),
  );

  static RandomIntegerGenerator? _singleton;
  
  final Random _rng;

  int next({
    int min = 0,
    required int max,
  }) {
    assert (max > min, '\'max\' should be more than \'min\'');
    return _rng.nextInt(max - min) + min;
  }
}