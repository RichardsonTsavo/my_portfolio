import 'calculations_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'calculations_page.dart';

class CalculationsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CalculationsController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/calculations",
            child: (_, args) => CalculationsPage()),
      ];

  static Inject get to => Inject<CalculationsModule>.of();
}
