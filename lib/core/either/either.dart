abstract class Either<L, R> {
  const Either();

  /// Aplica una función dependiendo de si es [Left] o [Right].
  T fold<T>(T Function(L l) onLeft, T Function(R r) onRight);

  /// Verifica si es una instancia de [Left].
  bool isLeft() => this is Left<L, R>;

  /// Verifica si es una instancia de [Right].
  bool isRight() => this is Right<L, R>;
}

class Left<L, R> extends Either<L, R> {
  final L value;

  const Left(this.value);

  @override
  T fold<T>(T Function(L l) onLeft, T Function(R r) onRight) {
    return onLeft(value);
  }
}

class Right<L, R> extends Either<L, R> {
  final R value;

  const Right(this.value);

  @override
  T fold<T>(T Function(L l) onLeft, T Function(R r) onRight) {
    return onRight(value);
  }
}
