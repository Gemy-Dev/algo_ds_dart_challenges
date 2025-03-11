// Challenge 3: Whose Turn Is It?
// Imagine that you are playing a game of Monopoly with your friends. The problem is
// that everyone always forgets whose turn it is! Create a Monopoly organizer that
// always tells you whose turn it is. Below is an extension method that you can
// implement

import 'package:algo_ds_dart_challenges/queue/ring_queue.dart';

extension BoardGameManager<E> on RingQueue<E> {
  E? nextPlayer() {
    final person = dequeue();
    if (person != null) {
      enqueue(person);
    }
      return person;
  }
}
