import 'package:final_flutter_project/common/mock_user.dart';
import 'package:final_flutter_project/domain/friend.dart';

class MockFriend {
  static List<Friend> entities = MockUser.entities
      .where((element) => element != MockUser.entities.last)
      .map<Friend>(
    (e) {
      final int index = MockUser.entities.indexOf(e);
      return Friend(
        id: 1,
        sourceUserId: e,
        targetUserId: MockUser.entities[index + 1],
        createdAt: DateTime.now(),
      );
    },
  ).toList();

  static Friend entity = entities.first;
}
