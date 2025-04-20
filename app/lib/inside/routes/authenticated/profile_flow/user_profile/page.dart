import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../../../outside/repositories/profile/repository.dart';
import '../../../../../outside/theme/theme.dart';
import '../../../../cubits/user_meme_stats/cubit.dart';
import '../../../../cubits/user_meme_stats/state.dart';
import '../../../../cubits/user_profile/cubit.dart';
import '../../../../cubits/user_uploaded_memes/cubit.dart';
import '../../../../cubits/user_uploaded_memes/state.dart';
import 'widgets/header.dart';
import 'widgets/meme_stats.dart';
import 'widgets/meme_upload_status_listener.dart';
import 'widgets/uploaded_meme_list.dart';
import 'widgets/user_info.dart';

@RoutePage()
class UserProfile_Page extends StatefulWidget {
  const UserProfile_Page({super.key});

  @override
  State<UserProfile_Page> createState() => _UserProfile_PageState();
}

class _UserProfile_PageState extends State<UserProfile_Page> {
  @override
  Widget build(BuildContext context) {
    final profile = context.watch<UserProfile_Cubit>().state.profile;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserUploadedMemes_Cubit(
            profileRepository: context.read<Profile_Repository>(),
            initialState: UserUploadedMemes_State.initial(),
          )..fetchUploadedMemes(userId: profile!.id),
        ),
        BlocProvider(
          create: (context) => UserMemeStats_Cubit(
            profileRepository: context.read<Profile_Repository>(),
            initialState: UserMemeStats_State.initial(),
          )..fetchMemeStats(userId: profile!.id),
        ),
      ],
      child: FScaffold(
        header: const UserProfile_Header(),
        content: Profile_Listener_MemeUpload(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserProfile_UserInfo(profile: profile),
                Gap(context.tokens.spacing.medium),
                const UserProfile_MemeStats(),
                const FDivider(),
                const UserProfile_UploadedMemeList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
