
// Challenge 2: Balance the Parentheses
// Check for balanced parentheses. Given a string, check if there are ( and ) characters, 
// and return true if the parentheses in the string are balanced. For example:


class Stack<E> {
  Stack() : _storage = <E>[];
  final List<E> _storage;

  void push(E value) => _storage.add(value);
  E pop() => _storage.removeLast();
  bool get isEmpty => _storage.isEmpty;
  E get peek => _storage.last;
}

void main() {
  final st1 = 'h((e))llo(world)()';
  final st2 = '(hello world';
  print(blanceHandel(checkBalance(st1)));
  print(blanceHandel(checkBalance(st2)));
}

bool checkBalance(String text) {
  const left = '(';
  const right = ')';

  final stack = Stack<String>();
  
  for (final char in text.split('')) {
    if (char == left || char == right) {
      if (stack.isEmpty) {
        stack.push(char);
      } else {
        if (stack.peek == left && char == right ||
            stack.peek == right && char == left) {
          stack.pop();
        } else {
          stack.push(char);
        }
      }
    }
  }
  return stack.isEmpty;
}

String blanceHandel(bool isBalanced) {
  return isBalanced ? 'balanced parentheses' : 'Unbalanced parentheses';
}
