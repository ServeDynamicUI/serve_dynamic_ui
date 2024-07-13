import 'package:serve_dynamic_ui/src/constants/index.dart';

enum ImageType {
  network,
  asset,
  file,
}

enum RequestType {
  get,
  post,
  put,
  delete,
}

enum PercentageIndicatorType { circular, linear }

enum PopAndNavigateStrategy { popToRoot, popCurrent, popUntilScreen }

extension PopAndNavigateStrategyExtension on PopAndNavigateStrategy {
  String get name {
    switch (this) {
      case PopAndNavigateStrategy.popToRoot:
        return Strings.popToRoot;
      case PopAndNavigateStrategy.popCurrent:
        return Strings.popCurrent;
      case PopAndNavigateStrategy.popUntilScreen:
        return Strings.popUntilScreen;
      default:
        return '';
    }
  }
}
