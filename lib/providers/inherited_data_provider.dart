import 'package:flutter/material.dart';

// inherited data provider
class InheritedDataProvide extends InheritedWidget {
  final ScrollController scrollController;
  const InheritedDataProvider({
    Widget child,
    this.scrollController,
  });

  @override
  bool updateShouldNotify(InheritedDataProvider oldWidget) =>
      scrollController != oldWidget.scrollController;
  static InheritedDataProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedDataProvider>();
}
