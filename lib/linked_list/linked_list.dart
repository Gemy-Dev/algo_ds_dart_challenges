// node it's for hold value and refare to another
class Node<E> {
  final E value;
  Node<E>? next;

  Node({required this.value, this.next});
  @override
  String toString() {
    return next == null ? '$value' : '$value -> ${next!.toString()}';
  }
}

// class <E> Generic to take any input by default it be dynamic
// E is Elemnet you can chose whitch char you want
class LinkedList<E> extends Iterable {
  // head is the first item in the list
  Node<E>? head;

  // tail is the last item in the list
  Node<E>? tail;
  bool get isEmpty => head == null;

  ///
  /// add item in the first of list  ---> [Time  ---> O(1)]
  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  /// add item in the last   ---> [Time  ---> O(1)]
  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }

    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  /// add item in spicific position using nodeAt  --->[Time --> O(1)] when we get node befor using nodeAt
  Node<E> insertAfter(Node<E> node, E value) {
    if (tail == node) {
      append(value);
      return tail!;
    }
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  /// get node position      ----> [Time --> O(i)] i is itration to find item
  Node<E>? nodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;
    while (currentNode != null && currentIndex < index) {
      currentIndex++;
      currentNode = currentNode.next;
    }
    return currentNode;
  }

  /// pop in remove item from  the first   ---> [Time ---> O(1)]
  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) tail = null;
    return value;
  }

  /// using remove Last to remove last item in list   [Time ---> O(n)] because it must loop for all item in list
  E? removeLast() {
    if (head?.next == null) return pop();
    var current = head;
    while (current?.next != tail) {
      current = current?.next;
    }
    final value = tail?.value;
    tail = current;
    tail?.next = null;

    return value;
  }

  /// remove after spicific node  [Time ---> O(1)] because it get spisific node befor
  E? removeAfter(Node<E> node) {
    final value = node.next?.value;
    if (node.next == tail) {
      tail = node;
      return value;
    }
    node.next = node.next?.next;
    return value;
  }

  // this to print nodes in sequance
  @override
  String toString() {
    return isEmpty ? "emptyList" : "$head";
  }
// this to make list iteration using for loop
  @override
 
  Iterator get iterator => _IteratorLinkedList(this);
}

class _IteratorLinkedList<E> implements Iterator<E> {
  _IteratorLinkedList(LinkedList list) : _list = list;
  final LinkedList _list;

  Node<E>? currentNode;
  @override
 // to get value of current node
  get current => currentNode!.value;
  bool _firstPass = true;

  // to check it can be move to next or not
  @override
  bool moveNext() {
    if (_list.isEmpty ) return false;
    if (_firstPass) {
      // in the first of iteration the first item will be the head
      currentNode = _list.head as Node<E>;
      _firstPass = false;
    } else { 
      
      currentNode = currentNode?.next;
    }
    return currentNode != null;
  }
}

void main(List<String> args) {
  final node = LinkedList<int>();
  node.push(3);
  node.push(2);
  node.push(1);

  node.insertAfter(node.nodeAt(1)!, 5);

  for (int i in node) {
    print(i);
  }
}
