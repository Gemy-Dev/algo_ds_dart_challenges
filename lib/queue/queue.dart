abstract interface class Queue<E> {
  bool enqueue(E element);
  E? dequeue();
  E? get peek;
  bool get isEmpty;
}
