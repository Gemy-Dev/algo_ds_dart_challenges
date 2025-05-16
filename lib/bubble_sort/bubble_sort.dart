extension SwapList<E> on List<E> {
  swap(int a, int b) {
    final temp = this[a];
    this[a] = this[b];
    this[b] = temp;
  }
}

bubbleSort<E extends Comparable<dynamic>>(List<E> list) {
  int counter = 0;
  for (var end = list.length - 1; end > 0; end--) {
    bool swap = false;
    for (int i = 0; i < end; i++) {
      if (list[i].compareTo(list[i + 1]) > 0) {
        list.swap(i, i + 1);
        swap = true;
        print(++counter);
      }
    }
    if (!swap) return;
  }
}

void main(List<String> args) {
  final list = [5, 4, 1, 7, 5, 44, 8, 10, 52, 4, 11];
  bubbleSort(list);
  print(list);
}
