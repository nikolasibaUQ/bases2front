class AuthApi {
  Future<dynamic> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return 'ok';
  }
}
