class Endpoints {
  static const String baseUrl = 'http://localhost:8000';

  static const login = '$baseUrl/affiliates/login';
  static const register = '$baseUrl/affiliates/create-affiliate';
  static const getAffiliates = '$baseUrl/affiliates/list-network';
  static const buyProduct = '$baseUrl/ventas/ventas';

  static const getInventory = '$baseUrl/inventory/list';
  static const deleteInventory = '$baseUrl/inventory/delete-product';
  static const addInventory = '$baseUrl/inventory/add';
  static const updateInventory = '$baseUrl/inventory/producto/{idProducto}';
}
