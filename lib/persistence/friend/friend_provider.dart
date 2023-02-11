import 'package:final_flutter_project/common/data_provider.dart';
import 'package:final_flutter_project/common/mock_friend.dart';
import 'package:final_flutter_project/domain/friend.dart';

class FriendProvider {
  const FriendProvider();

  Future<Friend> createData(Friend newData) {
    return Future.delayed(
      const Duration(seconds: 1),
          () => newData,
    );
  }

  Future deleteData(dataId) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  Future<List<Friend>> readData(Friend? criteria) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => MockFriend.entities,
    );
  }

  Future updateData(newData) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
