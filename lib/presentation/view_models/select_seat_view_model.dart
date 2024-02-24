import 'package:flutter/material.dart';

class SelectSeatViewModel extends ChangeNotifier {
  double _scale = 1.0;
  ScrollController _scrollController = ScrollController();

  double get scale => _scale;
  ScrollController get scrollController => _scrollController;

  void setScale(double newScale) {
    _scale = newScale;
    notifyListeners();
  }

  void zoomIn() {
    double newScale = _scale + 0.1;
    if (newScale < 2.0) {
      setScale(newScale);
    }
  }

  void zoomOut() {
    double newScale = _scale - 0.1;
    if (newScale > 0.5) {
      setScale(newScale);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
