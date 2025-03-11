import 'package:algo_ds_dart_challenges/doubly_linked_list/doubly_linked_list.dart';
import 'package:algo_ds_dart_challenges/linked_list/linked_list.dart';
import 'package:algo_ds_dart_challenges/queue/queue.dart';

/// implements Queue with [List]
class ListQueue<E> implements Queue<E> {
  final _list = <E>[];
  @override
  E? dequeue() {
    if (isEmpty) return null;
    return _list.removeAt(0);
  }

  @override
  bool enqueue(E element) {
    _list.add(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => _list.first;
  @override
  String toString() {
    return _list.toString();
  }
}

/// implements Queue with [LinkedList]
class LinkedListQueue<E> implements Queue<E> {
  final _list = LinkedList<E>();
  @override
  E? dequeue() {
    return _list.pop();
  }

  @override
  bool enqueue(E element) {
    _list.append(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => _list.head?.value;
  @override
  String toString() {
    // TODO: implement toString
    return _list.toString();
  }
}

/// implenents Queue with [doublyLinkedList]
class DoublyLinkedListQueue<E> implements Queue<E> {
  final _list = DoublyLinkedList();
  @override
  E? dequeue() {
    return _list.pop();
  }

  @override
  bool enqueue(E element) {
    _list.append(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => _list.peek;
  @override
  String toString() {
    return _list.toString();
  }
}

/// implements Queue using [RingBuffer]
/// 


void main(List<String> args) {
  final queue = DoublyLinkedListQueue<String>();
  queue.enqueue('D');
  queue.enqueue('A');

  print(queue);
  queue.enqueue('R');

  print(queue);
  print(queue.dequeue());

  print(queue.dequeue());

  queue.enqueue('T');
  print(queue);
}
