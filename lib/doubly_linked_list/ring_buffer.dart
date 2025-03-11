
class RingBuffer<E> {
  RingBuffer(int length) : _list = List.filled(length, null, growable: false);
  final List<E?> _list;
  bool get isFull => _size == _list.length;
  bool get isEmpty => _size == 0;
  int _readIndex = 0;
  int _writeIndex = 0;
  int _size = 0;

  void write(E value) {
    if (isFull) throw Exception('Buffer is Full');
    _list[_writeIndex] = value;
    _writeIndex = _advance(_writeIndex);
    _size++;
  }

  E? read() {
    if (isEmpty) return null;
    final value = _list[_readIndex];
    _readIndex = _advance(_readIndex);
    _size--;
    return value;
  }

  E? get peek => isEmpty ? null : _list[_readIndex];
  int _advance(int index) {
    return index == _list.length - 1 ? 0 : index + 1;
  }

  @override
  String toString() {
    final text = StringBuffer();
    text.write('[');
    int index = _readIndex;
    while (index != _writeIndex) {
      if (index != _readIndex) {
        text.write(', ');
      }
      text.write(_list[index % _list.length]);
      index++;
    }
    text.write(']');
    return text.toString();
  }
}

void main(List<String> args) {
  final ring = RingBuffer(4);
  ring.write(1);
  ring.write(2);
  ring.write(3);
  ring.write(4);
  print(ring);
  print(ring.peek);
  ring.read();
  print(ring.peek);
  ring.read();
  print(ring.peek);
  ring.read();
  print(ring.peek);
  ring.read();
  print(ring.peek);
  ring.read();

  print(ring.peek);
}
