// Challenge 4: Double-Ended Queue
// A doubled-ended queue — a.k.a. deque — is, as its name suggests, a queue where
// elements can be added or removed from the front or back.
// • A queue (FIFO order) allows you to add elements to the back and remove from the
// front.
// • A stack (LIFO order) allows you to add elements to the back, and remove from the
// back.
// Deque can be considered both a queue and a stack at the same time.
// Your challenge is to build a deque. Below is a simple Deque interface to help you
// build your data structure. The enum Direction describes whether you are adding or
// removing an element from the front or back of the deque. You can use any data
// structure you prefer to construct a Deque.
import 'package:algo_ds_dart_challenges/doubly_linked_list/doubly_linked_list.dart';

enum Direction { front, back }

abstract interface class Deque<E> {
  bool get isEmpty;
  E? peek(Direction from);
  bool enqueue(E element, Direction to);
  E? dequeue(Direction from);
}

class DequeImpl<E> implements Deque<E> {
  final _list = DoublyLinkedList<E>();
  @override
  E? dequeue(Direction from) {
    switch (from) {
      case Direction.front:
        return _list.pop();
      case Direction.back:
        return _list.removeLast();
    }
  }

  @override
  bool enqueue(E element, Direction to) {
    switch (to) {
      case Direction.front:
        _list.push(element);
        return true;
      case Direction.back:
        _list.append(element);
        return true;
    }
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? peek(Direction from) {
    switch (from) {
      case Direction.front:
        return _list.head?.value;
      case Direction.back:
        return _list.tail?.value;
    }
  }
}
