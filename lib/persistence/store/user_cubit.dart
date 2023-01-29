import 'package:final_flutter_project/domain/user.dart';

class UserCubit {
  final User? entity;
  final List<User> entities;
  final User currentUser;

  UserCubit({
    this.entity,
    required this.entities,
    required this.currentUser,
  });

  static UserCubit initialState = UserCubit(
    entities: [
      User(id: 1000, pseudo: 'Teemo'),
      User(id: 1001, pseudo: 'Annie'),
      User(id: 1002, pseudo: 'Nasus'),
      User(id: 1003, pseudo: 'Echo'),
      User(id: 1004, pseudo: 'Nidalee'),
      User(id: 1005, pseudo: 'Sivir'),
      User(id: 1006, pseudo: 'Riven'),
      User(id: 1007, pseudo: 'Caitlyn'),
      User(id: 1008, pseudo: "Vel'Koz"),
      User(id: 1009, pseudo: 'Jax'),
      User(id: 1010, pseudo: "Rek'Sai"),
      User(id: 1011, pseudo: 'Darius'),
      User(id: 1012, pseudo: 'Syndra'),
      User(id: 1013, pseudo: 'Leblanc'),
      User(id: 1014, pseudo: 'Lucian'),
      User(id: 1015, pseudo: 'Lulu'),
      User(id: 1016, pseudo: 'Blitzcrank'),
    ],
    currentUser: User(id: 1015, pseudo: 'Lulu'),
  );
}
