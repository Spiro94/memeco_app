import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../../i18n/translations.g.dart';
import '../../../../router.dart';

class Profile_Header extends StatelessWidget {
  const Profile_Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FHeader.nested(
      prefixActions: [
        FHeaderAction.back(
          onPress: () {
            context.router.navigate(const HomeShell_Route());
          },
        ),
      ],
      title: Text(context.t.profile.title),
    );
  }
}
