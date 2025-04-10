import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../blocs/meme_upload/bloc.dart';
import '../../../../../blocs/meme_upload/state.dart';
import '../../../../../cubits/user_meme_stats/cubit.dart';
import '../../../../../cubits/user_profile/cubit.dart';
import '../../../../../cubits/user_uploaded_memes/cubit.dart';

class Profile_Listener_MemeUpload extends StatelessWidget {
  const Profile_Listener_MemeUpload({required this.child, super.key});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<MemeUpload_Bloc, MemeUpload_State>(
      listener: (context, state) {
        final userId = context.read<UserProfile_Cubit>().state.profile!.id;
        switch (state.status) {
          case MemeUpload_Status.success:
            context.read<UserMemeStats_Cubit>().fetchMemeStats(userId: userId);

            context
                .read<UserUploadedMemes_Cubit>()
                .fetchUploadedMemes(userId: userId);

          case MemeUpload_Status.failure:
          case MemeUpload_Status.idle:
          case MemeUpload_Status.imageNotSafe:
          case MemeUpload_Status.loading:
            break;
        }
      },
      child: child,
    );
  }
}
