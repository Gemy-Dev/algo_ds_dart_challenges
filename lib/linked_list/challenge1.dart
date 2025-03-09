// Challenge 1: Print in Reverse
// Create a function that prints the nodes of a linked list in reverse order. For example:
// 1 -> 2 -> 3 -> null
// // should print out the following:
// 3
// 2
// 1

import 'package:algo_ds_dart_challenges/linked_list/linked_list.dart';

void main(List<String> args) {
  final list = LinkedList<int>();
  list
    ..push(3)
    ..push(2)
    ..push(1);
  print(list);
  printNodesRecursevly(list.head);

}

 printNodesRecursevly<E>(Node<E>? node) {
  if (node == null) return ;
  printNodesRecursevly(node.next);
  print(node.value);
}


// Challenge 3: Reverse a Linked List
// Create a function that reverses a linked list. You do this by manipulating the nodes 
// so that they’re linked in the other direction. For example:
// // before
// 1 -> 2 -> 3 -> null
// // after
// 3 -> 2 -> 1 -> null
// Challenge 4: Remove All Occurrences
// Create a function that removes all occurrences of a specific element from a linked 
// list. The implementation is similar to the removeAfter method that you 
// implemented earlier. For example:
// // original list
// 1 -> 3 -> 3 -> 3 -> 4
// // list after removing all occurrences of 3
// 1 -> 4
// Key Points
// • Linked lists are linear and unidirectional. As soon as you move a reference from 
// one node to another, you can’t go back.
// • Linked lists have O(1) time complexity for head first insertions, whereas standard 
// lists have O(n) time complexity for head-first insertions.
// • Implementing the Dart Iterable interface allows you to loop through the 
// elements of a collection as well as offering a host of other helpful methods.
// Data Structures & Algorithms in