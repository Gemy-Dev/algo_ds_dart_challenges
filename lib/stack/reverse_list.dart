// Challenge 1: Reverse a List
// Create a function that prints the contents of a list in reverse order.

class Stack<E> {
  Stack() : _storage = <E>[];
  final List<E> _storage;

  void push(E value) => _storage.add(value);
  E pop() => _storage.removeLast();
  List<E> get reversed => _storage.reversed.toList();

 
}

void main() {
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  printReversed(stack.reversed);
  print(stack.pop());
 printReversed(stack.reversed);
}
 void printReversed<E>(List<E> list) {
    print('----- Reversed -------\n ${list.join('\n')}\n-------');
  }