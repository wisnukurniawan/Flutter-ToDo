/// A functional interface that takes a value and returns another value, possibly with a
/// different type.
///
/// @param <T> the input value type
/// @param <R> the output value type
abstract class Mapper<T, R> {
  /// Apply some calculation to the input value and return some other value.
  /// @param t the input value
  /// @return the output value
  R apply(T t);
}
