// Challenge 4: Remove All Occurrences
// Create a function that removes all occurrences of a specific element from a linked
// list. The implementation is similar to the removeAfter method that you
// implemented earlier. For example:
// // original list
// 1 -> 3 -> 3 -> 3 -> 4
// // list after removing all occurrences of 3
// 1 -> 4

import 'package:algo_ds_dart_challenges/linked_list/linked_list.dart';

void main(List<String> args) {
  final list = LinkedList<int>();
  list
    ..push(4)
    ..push(3)
    ..push(3)
    ..push(3)
    ..push(3)
    ..push(2)
    ..push(2)
    ..push(1);
  print(list);
  list.removeAll(3);
  print(list);
}

extension Revers<E> on LinkedList<E> {
  void removeAll(E value) {
    while (head != null && head?.value == value) {
      head = head?.next;
    }
    var prev = head;
    var current = head?.next;
    while (current?.next != null) {
      if (current?.value == value) {
        prev?.next = current?.next;
        current = prev?.next;
        continue;
      }

      prev = current;
      current = current?.next;
    }

    // while (itrator?.next != null) {
    //   if (current == itrator) {
    //     prev?.next = itrator;
    //   } else {
    //     prev = current;
    //   }
    //   current = itrator;
    //   itrator = itrator?.next;
    // }
  }
}
