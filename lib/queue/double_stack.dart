import 'package:algo_ds_dart_challenges/queue/queue.dart';

class DoubleStack<E> implements Queue<E> {
  final _left = <E>[];
  final _right = <E>[];
  @override
  E? dequeue() {
    if (_left.isEmpty) {
      _left.addAll(_right.reversed);
      _right.clear();
    }
    if (_left.isEmpty) return null;
    return _left.removeLast();
  }

  @override
  bool enqueue(E element) {
    _right.add(element);
    return true;
  }

  @override
  bool get isEmpty => _left.isEmpty && _right.isEmpty;

  @override
  E? get peek => _left.isEmpty ? _right.first : _left.last;

  @override
String toString() {
 final combined = [
 ..._left.reversed,
 ..._right,
 ].join(', ');
 return '[$combined]';
}

}
