import 'package:flutter/material.dart';

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getAdaptiveTextSize(dynamic value , BuildContext context,) {
    // 816 is medium screen height
    return (value / 816.0) * MediaQuery.of(context).size.height;
  }
}

AdaptiveTextSize adaptiveTextSize =AdaptiveTextSize();