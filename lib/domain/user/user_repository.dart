import 'package:final_flutter_project/domain/user/user.dart';

abstract class UserRepository {
  Future<void> createUser(User user);
  Future<List<User>> getAllUsers();
}