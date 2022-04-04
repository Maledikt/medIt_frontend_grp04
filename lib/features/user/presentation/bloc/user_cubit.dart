

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_user_by_id.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState>{
  final GetUserById getUserById;

  UserCubit({required this.getUserById}) : super(UserStateIdle());

  void loadUserById(String userName) {
    emit(UserStatePending());
    getUserById.call(Params(userName: userName)).then((value){
      value.fold((l){
        emit(UserStateError(errorMessage: l.message));
      }, (r) {
        emit(UserStateReady(user: r));
      });
    });
  }

}