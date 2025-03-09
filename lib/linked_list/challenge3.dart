
// Challenge 3: Reverse a Linked List
// Create a function that reverses a linked list. You do this by manipulating the nodes 
// so that they’re linked in the other direction. For example:
// // before
// 1 -> 2 -> 3 -> null
// // after
// 3 -> 2 -> 1 -> null

import 'package:algo_ds_dart_challenges/linked_list/linked_list.dart';

void main(List<String> args) {
  final list = LinkedList<int>();
  list
    ..push(3)
    ..push(2)
    ..push(1);
  print(list);
 list.reverse();
  print(list);

}

reverseLindedList<E>(LinkedList<E> list) {
  var reversed = LinkedList();
  for (var node in list) {
    reversed.push(list.pop());
  }
  return reversed;
}

extension Revers on LinkedList {
 void reverse() {
    tail = head;
    var prev = head;
    var current = head?.next;
    prev?.next = null;
    while (current != null) {
      var next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }
    head = prev;
  
  }
}


