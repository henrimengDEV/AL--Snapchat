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
      User(id: 1000, pseudo: 'Teemo', avatar: defaultAvatar),
      User(id: 1001, pseudo: 'Annie', avatar: defaultAvatar),
      User(id: 1002, pseudo: 'Nasus', avatar: defaultAvatar),
      User(id: 1003, pseudo: 'Echo', avatar: defaultAvatar),
      User(id: 1004, pseudo: 'Nidalee', avatar: defaultAvatar),
      User(id: 1005, pseudo: 'Sivir', avatar: defaultAvatar),
      User(id: 1006, pseudo: 'Riven', avatar: defaultAvatar),
      User(id: 1007, pseudo: 'Caitlyn', avatar: defaultAvatar),
      User(id: 1008, pseudo: "Vel'Koz", avatar: defaultAvatar),
      User(id: 1009, pseudo: 'Jax', avatar: defaultAvatar),
      User(id: 1010, pseudo: "Rek'Sai", avatar: defaultAvatar),
      User(id: 1011, pseudo: 'Darius', avatar: defaultAvatar),
      User(id: 1012, pseudo: 'Syndra', avatar: defaultAvatar),
      User(id: 1013, pseudo: 'Leblanc', avatar: defaultAvatar),
      User(id: 1014, pseudo: 'Lucian', avatar: defaultAvatar),
      User(id: 1015, pseudo: 'Lulu', avatar: defaultAvatar),
      User(id: 1016, pseudo: 'Blitzcrank', avatar: defaultAvatar),
    ],
    currentUser: User(id: 1015, pseudo: 'Lulu'),
  );

  static String get defaultAvatar => '{"topType":7,"accessoriesType":0,"hairColor":1,"facialHairType":0,"facialHairColor":1,"clotheType":0,"eyeType":0,"eyebrowType":0,"mouthType":8,"skinColor":1,"clotheColor":5,"style":0,"graphicType":0}';
}
