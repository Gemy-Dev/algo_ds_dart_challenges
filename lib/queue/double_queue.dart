import 'package:algo_ds_dart_challenges/doubly_linked_list/doubly_linked_list.dart';
import 'package:algo_ds_dart_challenges/queue/queue.dart';

class DoubleQueue<E> implements Queue<E> {
  final _linkedList = DoublyLinkedList();
  @override
  E? dequeue() {
    return _linkedList.pop();
  }

  @override
  bool enqueue(E element) {
    _linkedList.append(element);
    return true;
  }

  @override
  bool get isEmpty => _linkedList.isEmpty;

  @override
  E? get peek => _linkedList.peek;
}
