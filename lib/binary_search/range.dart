class Range {
  int? _findStart(List list, int value) {
    if (value == list[0]) return 0;
    var startIndex = 1;
    var lastIndex = list.length;

    while (startIndex < lastIndex) {
      var mid = startIndex + (lastIndex - startIndex) ~/ 2;
      if (list[mid] == value && list[mid - 1] != value) {
        print('find first');
        return mid;
      }
      if (list[mid] < value) {
        startIndex = mid + 1;
      } else {
        lastIndex = mid;
      }
    }
    return null;
  }

  int? _findLast(List list, int value) {
    if (value == list[0]) return 0;
    var startIndex = 1;
    var lastIndex = list.length - 1;

    while (startIndex < lastIndex) {
      var mid = startIndex + (lastIndex - startIndex) ~/ 2;
      if (list[mid] == value && list[mid + 1] != value) {
        print('find last');
        return mid + 1;
      }
      if (list[mid] < value) {
        startIndex = mid + 1;
      } else {
        lastIndex = mid;
      }
    }
    return null;
  }

  findRange(List list, value) {
    return (_findStart(list, value), _findLast(list, value));
  }
}
