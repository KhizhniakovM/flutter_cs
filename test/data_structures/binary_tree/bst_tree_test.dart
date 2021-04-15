import 'package:flutter_cs/data_structures/binary_tree/bst_node.dart';
import 'package:flutter_cs/data_structures/binary_tree/bst_tree.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('bst_tree', () {
    test('1', () {
      BST_Node node1 = BST_Node(key: 5, value: '5');
      BST_Node node2 = BST_Node(key: 3, value: '3');
      BST_Node node3 = BST_Node(key: 7, value: '7');

      BST_Tree tree = BST_Tree(root: node1);
      tree.insert(node2);
      tree.insert(node3);

      expect(node1.leftNode?.value, '3');
      expect(node1.rightNode?.value, '7');
    });
    test('2', () {
      BST_Node node1 = BST_Node(key: 5, value: '5');
      BST_Node node2 = BST_Node(key: 3, value: '3');
      BST_Node node3 = BST_Node(key: 7, value: '7');

      BST_Tree tree = BST_Tree(root: node1);
      tree.insert(node2);
      tree.insert(node3);

      expect(tree.search(3), node2);
    });
    test('3', () {
      BST_Node node1 = BST_Node(key: 5, value: '5');
      BST_Node node2 = BST_Node(key: 3, value: '3');
      BST_Node node3 = BST_Node(key: 7, value: '7');
      BST_Node node4 = BST_Node(key: 2, value: '2');
      BST_Node node5 = BST_Node(key: 4, value: '4');

      BST_Tree tree = BST_Tree(root: node1);
      tree.insert(node2);
      tree.insert(node3);
      tree.insert(node4);
      tree.insert(node5);

      tree.delete(3);

      expect(node1.leftNode?.value, '2');
      expect(node1.leftNode?.leftNode?.value, null);
      expect(node1.leftNode?.rightNode?.value, '4');
      expect(node1.rightNode?.value, '7');
    });
    test('4', () {
      BST_Node node1 = BST_Node(key: 5, value: '5');
      BST_Node node2 = BST_Node(key: 3, value: '3');
      BST_Node node3 = BST_Node(key: 7, value: '7');
      BST_Node node4 = BST_Node(key: 2, value: '2');
      BST_Node node5 = BST_Node(key: 4, value: '4');

      BST_Tree tree = BST_Tree(root: node1);
      tree.insert(node2);
      tree.insert(node3);
      tree.insert(node4);
      tree.insert(node5);

      tree.delete(5);

      expect(tree.root, node2);
      expect(node2.rightNode?.value, '4');
      expect(node2.rightNode?.rightNode?.value, '7');
      expect(node2.leftNode?.value, '2');
    });
    test('5', () {
      BST_Node node1 = BST_Node(key: 5, value: '5');
      BST_Node node2 = BST_Node(key: 3, value: '3');
      BST_Node node3 = BST_Node(key: 7, value: '7');
      BST_Node node4 = BST_Node(key: 2, value: '2');
      BST_Node node5 = BST_Node(key: 4, value: '4');

      BST_Tree tree = BST_Tree(root: node1);
      tree.insert(node2);
      tree.insert(node3);
      tree.insert(node4);
      tree.insert(node5);

      tree.traverseInOrder(print);
      print('//==================================================');
      tree.traversePreOrder(print);
      print('//==================================================');
      tree.traversePostOrder(print);
    });
    test('6', () {
      BST_Tree tree = BST_Tree();

      tree.traverseInOrder(print);
    });
  });
}
