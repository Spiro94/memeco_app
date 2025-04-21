import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../../../../outside/theme/theme.dart';
import '../../../../../../shared/models/profile.dart';

class UserProfile_UserInfo extends StatelessWidget {
  const UserProfile_UserInfo({
    required this.profile,
    super.key,
  });

  final Model_Profile? profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FAvatar(
          image: const NetworkImage(''),
          fallback: Text(
            profile?.username[0].toUpperCase() ?? '',
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
          size: 80,
        ),
        Gap(context.tokens.spacing.medium),
        Text(
          profile?.username ?? '',
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
