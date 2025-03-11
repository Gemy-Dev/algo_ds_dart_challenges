class Node<E> {
  final E value;
  Node<E>? next;
  Node<E>? prev;

  Node({required this.value, this.next, this.prev});

  @override
  String toString() {
    return next == null
        ? '$value<----->null'
        : prev != null || next != null
        ? "$value<----->${next.toString()}"
        : 'null <------> $value';
  }
}

class DoublyLinkedList<E> {
  Node<E>? head;
  Node<E>? tail;

  bool push(E value) {
    final node = Node(value: value, next: head);
    if (isEmpty) {
      tail = node;
    } else {
      head?.prev = node;
      tail?.prev ??= node;
    }
    head = node;
    return true;
  }

  void append(E value) {
    final node = Node(value: value, prev: tail);
    if (isEmpty) {
      head = node;
    } else {
      tail?.next = node;
      head?.next ??= node;
    }

    tail = node;
  }

  E? pop() {
    if (isEmpty) return null;
    final value = head?.value;
    if (head?.next == null) {
      head = null;
      tail == null;
      return value;
    }

    head = head?.next;
    head?.prev = null;
    return value;
  }

  E? removeLast() {
    if (tail?.prev == null) return pop();
    final value = tail?.value;
    tail = tail?.prev;
    tail?.next = null;
    return value;
  }

  bool get isEmpty => head == null;
  E? get peek => isEmpty ? null : head?.value;
  @override
  String toString() => head.toString();
}

void main(List<String> args) {
  final list = DoublyLinkedList<int>();
  list.push(5);
  list.push(4);
  list.push(3);
  list.push(2);
  list.push(1);
  list.pop();
  list.pop();
  list.pop();
  list.pop();
  list.pop();
  list.pop();
  list.pop();

  print(list.tail?.toString());
}
