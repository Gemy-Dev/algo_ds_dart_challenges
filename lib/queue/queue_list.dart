import 'package:algo_ds_dart_challenges/queue/queue.dart';

class QueueList<E> implements Queue<E> {
  final _list = <E>[];
  @override
  E? dequeue() => isEmpty ? null : _list.removeAt(0);

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

void main(List<String> args) {
  final queue = QueueList<String>();
  queue.enqueue('Gamal');
  queue.enqueue('khaled');
  queue.enqueue('mahmoud');
  queue.enqueue('Ahmed');
  print(queue);
  queue.dequeue();
  print(queue.peek);
  print(queue);
}
