import 'dart:collection';
import 'dart:developer';

import 'package:algo_ds_dart_challenges/queue/challenge2.dart';
import 'package:algo_ds_dart_challenges/queue/double_queue.dart';
import 'package:algo_ds_dart_challenges/queue/double_stack.dart';

class TreeNode<T> {
  final T value;
  List<TreeNode<T>> childern = [];

  TreeNode(this.value);

  void add(TreeNode<T> node) {
    childern.add(node);
  }

  void forEachDepthFirst(void Function(TreeNode<T>) perforAction) {
    perforAction(this);
    for (final node in childern) {
      node.forEachDepthFirst(perforAction);
    }
  }

  void forEachLevleOrder(void Function(TreeNode<T>) perforAction) {
    final queue = DoubleQueue();

    log(this.value.toString());
    perforAction(this);
    childern.forEach(queue.enqueue);
    TreeNode<T>? node = queue.dequeue();

    while (node != null) {
      perforAction(node);
      node.childern.forEach(queue.enqueue);

      node = queue.dequeue();
      if (queue.peek != node) {
        print('------');
      }
    }
  }
}

void main(List<String> args) {
  final node = makeBeverageTree();

  printAsLiver(node);
}

void printAsLiver<T>(TreeNode<T> node) {
  var result = StringBuffer();
  final queue = DoubleStack();
  queue.enqueue(node);
  int leftedNodeInQueue = 0;
  while (!queue.isEmpty) {
    leftedNodeInQueue = queue.length;

    while (leftedNodeInQueue > 0) {
      TreeNode? node = queue.dequeue();
      result.write('${node?.value} | ');
      if (node == null) break;
      for (var element in node.childern) {
        queue.enqueue(element);
      }
      // node.childern.forEach(queue.enqueue);
      leftedNodeInQueue -= 1;
      print(leftedNodeInQueue);
    }
    result.write('\n');
  }
  print(result);
}

TreeNode<String> makeBeverageTree() {
  final tree = TreeNode('beverages');
  final hot = TreeNode('hot');
  final cold = TreeNode('cold');
  final tea = TreeNode('tea');
  final coffee = TreeNode('coffee');
  final chocolate = TreeNode('cocoa');
  final blackTea = TreeNode('black');
  final greenTea = TreeNode('green');
  final chaiTea = TreeNode('chai');
  final soda = TreeNode('soda');
  final milk = TreeNode('milk');
  final gingerAle = TreeNode('ginger ale');
  final bitterLemon = TreeNode('bitter lemon');
  tree.add(hot);
  tree.add(cold);
  hot.add(tea);
  hot.add(coffee);
  hot.add(chocolate);
  cold.add(soda);
  cold.add(milk);
  tea.add(blackTea);
  tea.add(greenTea);
  tea.add(chaiTea);
  soda.add(gingerAle);
  soda.add(bitterLemon);
  return tree;
}
