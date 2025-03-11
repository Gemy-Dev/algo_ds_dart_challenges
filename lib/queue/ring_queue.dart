import 'package:algo_ds_dart_challenges/doubly_linked_list/ring_buffer.dart';
import 'package:algo_ds_dart_challenges/queue/queue.dart';

class RingQueue<E> implements Queue<E> {
  RingQueue(int length) : _ring = RingBuffer<E>(length);
  final RingBuffer<E> _ring;
  @override
  E? dequeue() {
    return _ring.read();
  }

  @override
  bool enqueue(E element) {
    if (!_ring.isFull) {
      _ring.write(element);
      return true;
    }
    return false;
  }

  @override
  bool get isEmpty => _ring.isEmpty;

  @override
  E? get peek => _ring.peek;
  @override
  String toString() {
return _ring.toString();
  }
}
