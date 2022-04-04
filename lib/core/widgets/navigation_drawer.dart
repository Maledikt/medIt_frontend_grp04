import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/user/presentation/bloc/user_cubit.dart';
import '../../features/user/presentation/bloc/user_state.dart';
import '../../injection_container.dart';
import '../bloc/app_cubit.dart';

class NavigationDrawer extends StatelessWidget{
  final UserCubit userCubit = sl<UserCubit>();

  NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        BlocProvider(
          create: (_) => userCubit,
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, state){
              String userName = "<userName>";
              String userEmail = "<email>";

              if(state is UserStateIdle){
                userCubit.loadUserById("admin");
              } else if(state is UserStateReady){
                userName = state.user.userName;
                userEmail = state.user.email;
              }

              return UserAccountsDrawerHeader(
                accountName: Text(userName), accountEmail: Text(userEmail)
              );
            }
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: Text("navigation.home".tr()),
          onTap: () {
            sl<AppCubit>().gotoNamedRoute("home");
          },
        ),
        ListTile(
          leading: const Icon(Icons.people),
          title: Text("navigation.users".tr()),
          onTap: () {
            sl<AppCubit>().gotoNamedRoute("user");
          },
        ),
      ],
    );
  }

}