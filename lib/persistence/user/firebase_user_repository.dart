import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_flutter_project/domain/user/user.dart';
import 'package:final_flutter_project/domain/user/user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Future<String> createUser(User user) async {
    late String result;
    await _usersCollection
        .add(user.toJson())
        .then((value) => result = value.id)
        .catchError((error) => result = "Failed to add user: $error");

    return result;
  }

  @override
  Future<List<User>> getAllUsers() async {
    QuerySnapshot querySnapshot = await _usersCollection.get();
    List<User> users = querySnapshot.docs.map((e) {
      Map<String, dynamic> data = e.data() as Map<String, dynamic>;
      User user = User.fromJson(data).copyWith(id: e.id);
      return user;
    }).toList();

    return users;
  }
}
