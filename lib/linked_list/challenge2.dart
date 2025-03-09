// Challenge 2: Find the Middle Node
// Create a function that finds the middle node of a linked list. For example:
// 1 -> 2 -> 3 -> 4 -> null
// // middle is 3
// 1 -> 2 -> 3 -> null
// // middle is 2

import 'package:algo_ds_dart_challenges/linked_list/linked_list.dart';

void main(List<String> args) {
  final list1 = LinkedList<int>();
  list1
    ..push(3)
    ..push(2)
    ..push(1);

  final list2 =
      LinkedList<int>()
        ..push(4)
        ..push(3)
        ..push(2)
        ..push(1);

  print(list1);
  print(getMiddel(list1)?.value);
  print(list2);
  print(getMiddel(list2)?.value);
}

Node<E>? getMiddel<E>(LinkedList<E> list) {
  var fast = list.head;
  var slow = list.head;

  while (fast?.next != null) {
   
    fast = fast?.next?.next;
    slow = slow?.next;
  }
  return slow;
}
