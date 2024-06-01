import 'package:teste_artigo/user_dto.dart';

class UserRepository {
  Future<UserDto> getUserData() async {
    // fetching some user data simulation, it could be an API call, in a repository file.
    await Future.delayed(const Duration(seconds: 2), () {});
    return UserDto(name: 'John Doe');
  }
}
