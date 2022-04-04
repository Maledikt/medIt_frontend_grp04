import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/user_cubit.dart';
import '../bloc/user_state.dart';

class UserGist extends StatefulWidget {
  final String? userName;

  const UserGist({this.userName, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _UserGistState();
  }
}

class _UserGistState extends State<UserGist> {
  UserCubit userCubit = sl<UserCubit>();
  String? lastRequestedUserName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => userCubit,
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (lastRequestedUserName != widget.userName) {
            if (widget.userName != null) {
              userCubit.loadUserById(widget.userName!);
            }
            lastRequestedUserName = widget.userName;
          }

          if (state is UserStatePending) {
            return const Text("Loading ...");
          } else if (state is UserStateError) {
            return Text("An Error occurred: ${state.errorMessage}");
          } else if (state is UserStateReady) {
            return Text("User: ${state.user.userName} (${state.user.email})");
          } else {
            return const Text("empty");
          }
        },
      ),
    );
  }
}
