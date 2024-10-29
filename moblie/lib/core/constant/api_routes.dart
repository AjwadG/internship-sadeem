/// List of api end points
class ApiRoutes {
  ApiRoutes._();

  static String wrong = 'http://localhost:8000';
  static String base = 'http://10.0.2.2:8000';
  static String version = '';
  static String meta = '$base$version/meta';
  static String register = '$base$version/signup';
  static String login = '$base$version/login';
  static String vendors = '$base$version/vendors';
  static String tables = '$base$version/tables';
  static String vendor(id) => '$base$version/vendors/$id';
  static String items = '$base$version/items';
  static String add_to_cart = '$base$version/cart/add';
}
