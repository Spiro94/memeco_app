import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../../blocs/profile/bloc.dart';
import '../../../../../i18n/translations.g.dart';

class Home_Header extends StatelessWidget {
  const Home_Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final title = context.t.home.title;
    final profile = context.watch<Profile_Bloc>().state.profile;

    return FHeader(
      title: Text(profile != null ? profile.username : title),
    );
  }
}
