import 'package:get/route_manager.dart';

class ForceNavigateToRouteMiddleware extends GetMiddleware {
  final String from;
  final String to;

  ForceNavigateToRouteMiddleware({
    required this.from,
    required this.to,
  });

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    var pos =
        route.currentTreeBranch.indexWhere((p) => p.name == route.location);
    if (pos == -1) {
      return GetNavConfig.fromRoute('/404');
    }
    if (route.location == from) {
      return GetNavConfig.fromRoute(to);
    }
    return route;
  }
}
