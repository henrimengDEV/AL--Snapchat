import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_flutter_project/common/mock_user.dart';
import 'package:final_flutter_project/domain/user.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitial()) {
    on<FetchAllUser>(_onFetchAllUser);
    on<FetchOneUser>(_onFetchOneUser);
    on<CreateUser>(_onCreateUser);
    on<UpdateUser>(_onUpdateUser);
    on<RemoveUser>(_onRemoveUser);
    on<ResetAllUser>(_onResetAllUser);
    on<ResetOneUser>(_onResetOneUser);
  }

  _onFetchAllUser(FetchAllUser event, Emitter<UserState> emit) {
    print('FetchAllUser');
    emit(state.copyWith(entities: MockUser.entities));
  }

  _onFetchOneUser(FetchOneUser event, Emitter<UserState> emit) {
    print('FetchAllUser');
    emit(state.copyWith(entity: MockUser.entity));
  }

  _onCreateUser(CreateUser event, Emitter<UserState> emit) {
    print('CreateUser');
    emit(state.copyWith(
      entities: [...state.entities, event.user],
      entity: event.user,
    ));
  }

  _onUpdateUser(UpdateUser event, Emitter<UserState> emit) {
    print('UpdateUser');
  }

  _onRemoveUser(RemoveUser event, Emitter<UserState> emit) {
    print('RemoveUser');
    emit(state.copyWith(
      entities:
          state.entities.where((element) => element.id != event.id).toList(),
    ));
  }

  _onResetAllUser(ResetAllUser event, Emitter<UserState> emit) {
    print('ResetAllUser');
    emit(state.copyWith(entities: const UserInitial().entities));
  }

  _onResetOneUser(ResetOneUser event, Emitter<UserState> emit) {
    print('ResetOneMessage');
    emit(state.copyWith(entity: const UserInitial().entity));
  }
}
