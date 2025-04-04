import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../blocs/auth/bloc.dart';
import '../../../../blocs/auth/events.dart';
import '../../../../i18n/translations.g.dart';

@RoutePage()
class Profile_Page extends StatefulWidget {
  const Profile_Page({super.key});

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
    return FScaffold(
      header: FHeader(
        title: Text(context.t.profile.title),
        actions: [
          FPopoverMenu(
            popoverController: controller,
            menuAnchor: Alignment.topRight,
            childAnchor: Alignment.bottomRight,
            menu: [
              FTileGroup(
                children: [
                  FTile(
                    prefixIcon: FIcon(FAssets.icons.user),
                    title: Text(context.t.profile.actions.editProfile.label),
                    onPress: () {},
                  ),
                ],
              ),
              FTileGroup(
                children: [
                  FTile(
                    prefixIcon: FIcon(FAssets.icons.logOut),
                    title: Text(context.t.profile.actions.signOut.label),
                    onPress: () {
                      context.read<Auth_Bloc>().add(Auth_Event_SignOut());
                    },
                  ),
                ],
              ),
            ],
            child: FHeaderAction(
              icon: FIcon(FAssets.icons.ellipsis),
              onPress: controller.toggle,
            ),
          ),
        ],
      ),
      content: const Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
