import 'package:get/get_navigation/src/routes/get_route.dart';

import '../presentation/ui/pages/home/home_page.dart';




class Routes {
  static String getHomePage() => HomePage.ROUTE_NAME;


  static List<GetPage> routes = [
    // GetPage(name: HomePage.ROUTE_NAME, page: () => const HomePage()),
  ];
}