import 'package:final_flutter_project/domain/user.dart';

class MockUser {
  static const String defaultAvatar =
      '{"topType":7,"accessoriesType":0,"hairColor":1,"facialHairType":0,"facialHairColor":1,"clotheType":0,"eyeType":0,"eyebrowType":0,"mouthType":8,"skinColor":1,"clotheColor":5,"style":0,"graphicType":0}';

  static List<User> entities = [
      User(
        id: 1000,
        pseudo: 'Teemo',
        avatar: defaultAvatar,
        createAt: DateTime.now(),
      ),
      User(
        id: 1001,
        pseudo: 'Annie',
        avatar: defaultAvatar,
        createAt: DateTime.now(),
      ),
      User(
        id: 1002,
        pseudo: 'Nasus',
        avatar: defaultAvatar,
        createAt: DateTime.now(),
      ),
      User(
        id: 1003,
        pseudo: 'Echo',
        avatar: defaultAvatar,
        createAt: DateTime.now(),
      ),
      User(
        id: 1004,
        pseudo: 'Nidalee',
        avatar: defaultAvatar,
        createAt: DateTime.now(),
      ),
      User(
        id: 1005,
        pseudo: 'Sivir',
        avatar: defaultAvatar,
        createAt: DateTime.now(),
      ),
      User(
        id: 1006,
        pseudo: 'Riven',
        avatar: defaultAvatar,
        createAt: DateTime.now(),
      ),
      User(
        id: 1007,
        pseudo: 'Caitlyn',
        avatar: defaultAvatar,
        createAt: DateTime.now(),
      ),
      User(
        id: 1008,
        pseudo: "Vel'Koz",
        avatar: defaultAvatar,
        createAt: DateTime.now(),
      ),
      User(
        id: 1009,
        pseudo: 'Jax',
        avatar: defaultAvatar,
        createAt: DateTime.now(),
      ),
      User(
        id: 1010,
        pseudo: "Rek'Sai",
        avatar: defaultAvatar,
        createAt: DateTime.now(),
      ),
      User(
        id: 1011,
        pseudo: 'Darius',
        avatar: defaultAvatar,
        createAt: DateTime.now(),
      ),
      User(
        id: 1012,
        pseudo: 'Syndra',
        avatar: defaultAvatar,
        createAt: DateTime.now(),
      ),
      User(
        id: 1013,
        pseudo: 'Leblanc',
        avatar: defaultAvatar,
        createAt: DateTime.now(),
      ),
      User(
        id: 1014,
        pseudo: 'Lucian',
        avatar: defaultAvatar,
        createAt: DateTime.now(),
      ),
      User(
        id: 1015,
        pseudo: 'Lulu',
        avatar: defaultAvatar,
        createAt: DateTime.now(),
      ),
      User(
        id: 1016,
        pseudo: 'Blitzcrank',
        avatar: defaultAvatar,
        createAt: DateTime.now(),
      ),
  ];
  static User entity = entities.first;
}