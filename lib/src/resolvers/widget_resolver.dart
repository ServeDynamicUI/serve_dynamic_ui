
import '../dynamic_widgets/dynamic_widget.dart';

class WidgetResolver {
  ///Returns the Top Level Widget of type [T] by passing any widget below it.
  static T? getTopAncestorOfType<T>(DynamicWidget widget) {
    DynamicWidget? child = widget.parent;
    T? topAncestor;
    while (child != null) {
      if (child is T) {
        topAncestor = child as T?;
      }
      child = child.parent;
    }
    return topAncestor;
  }

  ///Returns root widget in the hierarchy.
  static DynamicWidget? getRoot(DynamicWidget? child) {
    DynamicWidget? root;
    while (child?.parent != null) {
      root = child?.parent;
      child = child?.parent;
    }
    return root;
  }

  ///Returns widget for a key.
  static DynamicWidget? getWidgetWithKey(
      DynamicWidget? root,
      String key,
      ) {
    if(root == null) {
      return null;
    }
    DynamicWidget? matchedElement;
    if (root.key?.compareTo(key) == 0) {
      matchedElement = root;
    } else {

      if (root.childWidgets?.isNotEmpty ?? false) {
        for (int i = 0; i < (root.childWidgets?.length ?? 0); i++) {
          DynamicWidget? internalMatchedElement = getWidgetWithKey(root.childWidgets![i]!, key);
          if (internalMatchedElement != null) {
            matchedElement = internalMatchedElement;
            break;
          }
        }
      }
    }
    return matchedElement;
  }
}
