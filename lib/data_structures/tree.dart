class TreeNode<T> {
  // MARK: - Properties
  final T value;
  TreeNode? parent;
  List<TreeNode<T>> _children = [];
  List<TreeNode<T>> get children => _children;

  // MARK: - Initializer
  TreeNode(this.value);

  // MARK: - Methods
  void addChild(TreeNode<T> node) {
    children.add(node);
    node.parent = this;
  }

  TreeNode<T>? search(T value) {
    if (value == this.value) return this;

    for (TreeNode<T> child in children) {
      TreeNode<T>? result = child.search(value);
      if (result != null) return result;
    }
    return null;
  }

  // MARK: - Call
  String call() => '$value' + ' { ' + this.children.map((node) => node()).join(', ') + ' }';
}
