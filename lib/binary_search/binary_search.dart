import 'dart:developer';

import 'package:algo_ds_dart_challenges/binary_search/range.dart';

extension BinarySearch<E extends Comparable> on List<E> {
  int? binarySearch(E value, [int? start, int? last]) {
    var startIndex = start ?? 0;
    var endIndex = last ?? length;

    if (startIndex >= endIndex) return null;

    final size = endIndex - startIndex;
    final middle = startIndex + size ~/ 2;
    if (this[middle] == value) return middle;
    if (value.compareTo(this[middle]) < 0) {
      return binarySearch(value, startIndex, middle);
    } else {
      return binarySearch(value, middle + 1, endIndex);
    }
  }
}

int? binary<E extends Comparable<dynamic>>(
  List<E> list,
  E value, [
  int? first,
  int? last,
]) {
  var firstIndex = first ?? 0;
  var lastIndex = last ?? list.length;
  while (firstIndex < lastIndex) {
    final size = lastIndex - firstIndex;
    final middle = firstIndex + size ~/ 2;
    if (value == list[middle]) return middle;
    if (value.compareTo(list[middle]) < 0) {
      lastIndex = middle;
    } else {
      firstIndex = middle + 1;
    }
  }
  return null;
}

(int?, int?)? findRange(List list, int value) {
  int firstIndex = -1;
  int lastIndex = -1;
  int tracker = 0;
  do {
    print(list[tracker]);
    if (list[tracker] == value) {
      print(firstIndex);
      if (firstIndex.isNegative) {
        firstIndex = tracker;
        lastIndex = tracker;
      } else {
        lastIndex = tracker;
      }
    }
    tracker++;
  } while (list[tracker] <= value);

  return firstIndex == -1 ? null : (firstIndex, tracker);
}

void main(List<String> args) {
  final list = [1, 2, 3, 3, 3, 4, 5, 5];
  final range = Range();
  final binary31 = range.findRange(list, 5 );
  print('binary :$binary31');
}
