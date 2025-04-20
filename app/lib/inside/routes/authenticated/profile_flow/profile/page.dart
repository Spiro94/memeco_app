import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../../../outside/repositories/profile/repository.dart';
import '../../../../../outside/theme/theme.dart';
import '../../../../cubits/meme_stats/cubit.dart';
import '../../../../cubits/meme_stats/state.dart';
import '../../../../cubits/profile/cubit.dart';
import '../../../../cubits/uploaded_memes/cubit.dart';
import '../../../../cubits/uploaded_memes/state.dart';
import '../../../../util/breakpoints.dart';
import '../../../widgets/scaffold.dart';
import 'widgets/header.dart';
import 'widgets/meme_stats.dart';
import 'widgets/uploaded_meme_list.dart';
import 'widgets/user_info.dart';

@RoutePage()
class Profile_Page extends StatefulWidget {
  const Profile_Page({
    @PathParam() required this.userId,
    super.key,
  });

  final String userId;

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page>
    with SingleTickerProviderStateMixin {
  late final FPopoverController controller;

  @override
  void initState() {
    super.initState();
    controller = FPopoverController(vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UploadedMemes_Cubit(
            profileRepository: context.read<Profile_Repository>(),
            initialState: UploadedMemes_State.initial(),
          )..fetchUploadedMemes(userId: widget.userId),
        ),
        BlocProvider(
          create: (context) => MemeStats_Cubit(
            profileRepository: context.read<Profile_Repository>(),
            initialState: MemeStats_State.initial(),
          )..fetchMemeStats(userId: widget.userId),
        ),
        BlocProvider(
          create: (context) => Profile_Cubit(
            profileRepository: context.read<Profile_Repository>(),
          )..fetchProfile(userId: widget.userId),
        ),
      ],
      child: Routes_Scaffold(
        breakpointType: InsideUtil_BreakpointType.constrained,
        scaffold: FScaffold(
          header: const Profile_Header(),
          content: SafeArea(
            top: false,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Profile_UserInfo(),
                  Gap(context.tokens.spacing.medium),
                  const Profile_MemeStats(),
                  const FDivider(),
                  const Profile_UploadedMemeList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
