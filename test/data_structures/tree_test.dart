import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cs/data_structures/tree.dart';

void main() {
  group('node', () {
    TreeNode<int>? node1;

    setUp(() {
      node1 = TreeNode(1);
    });

    test('node create', () {
      expect(node1?.value, 1);
      expect(node1?.parent, null);
      expect(node1?.children, []);
    });
    test('node add child', () {
      TreeNode<int> node2 = TreeNode(2);
      node1?.addChild(node2);

      expect(node1?.children, [node2]);
      expect(node2.parent, node1);
      expect(node2.children, []);
    });
    test('node search', () {
      TreeNode<int> node2 = TreeNode(2);
      TreeNode<int> node3 = TreeNode(3);
      TreeNode<int> node4 = TreeNode(4);

      node1?.addChild(node2);
      node2.addChild(node3);
      node2.addChild(node4);

      expect(node1?.search(4), node4);
    });
  });
}
