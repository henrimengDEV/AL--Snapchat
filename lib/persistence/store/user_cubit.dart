import 'package:final_flutter_project/domain/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<List<User>> {
  UserCubit() : super([]);

  void add(User user) => emit([...state, user]);
}
