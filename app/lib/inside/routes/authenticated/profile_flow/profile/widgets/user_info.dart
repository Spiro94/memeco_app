import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../../../../outside/theme/theme.dart';
import '../../../../../cubits/profile/cubit.dart';
import '../../../../../cubits/profile/state.dart';

class Profile_UserInfo extends StatelessWidget {
  const Profile_UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Profile_Cubit, Profile_State>(
      builder: (context, state) {
        if (state.status == Profile_Status.loading) {
          return const CircularProgressIndicator();
        } else if (state.status == Profile_Status.failure) {
          return const Text('Error loading your profile');
        } else if (state.status == Profile_Status.loaded) {
          return Column(
            children: [
              FAvatar(
                image: const NetworkImage(''),
                fallback: Text(
                  state.profile!.username[0].toUpperCase(),
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                size: 80,
              ),
              Gap(context.tokens.spacing.medium),
              Text(
                state.profile!.username,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
