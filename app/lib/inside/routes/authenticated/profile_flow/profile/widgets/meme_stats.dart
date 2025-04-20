import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../outside/theme/theme.dart';
import '../../../../../cubits/meme_stats/cubit.dart';
import '../../../../../cubits/meme_stats/state.dart';

class Profile_MemeStats extends StatelessWidget {
  const Profile_MemeStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemeStats_Cubit, MemeStats_State>(
      builder: (context, state) {
        if (state.status == MemeStats_Status.loading) {
          return const CircularProgressIndicator();
        } else if (state.status == MemeStats_Status.error) {
          return const Text('Error loading your stats');
        } else if (state.status == MemeStats_Status.loaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Your Stats',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(context.tokens.spacing.medium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        state.memeStats.likesGiven.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text('Likes'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        state.memeStats.memesPosted.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text('Memes Created'),
                    ],
                  ),
                ],
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
