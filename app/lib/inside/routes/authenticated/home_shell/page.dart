import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../outside/repositories/memes/repository.dart';
import '../../../../outside/repositories/profile/repository.dart';
import '../../../blocs/meme_upload/bloc.dart';
import '../../../blocs/meme_upload/events.dart';
import '../../../blocs/meme_upload/state.dart';
import '../../../blocs/memes/bloc.dart';
import '../../../blocs/memes/events.dart';
import '../../../blocs/memes/state.dart';
import '../../../cubits/new_memes_notification/cubit.dart';
import '../../../cubits/new_memes_notification/state.dart';
import '../../../cubits/user_profile/cubit.dart';
import '../../../i18n/translations.g.dart';
import '../../router.dart';
import '../upload/widgets/form.dart';
import 'widgets/upload_listener_status_change.dart';

@RoutePage()
class HomeShell_Page extends StatelessWidget implements AutoRouteWrapper {
  const HomeShell_Page({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (_) => MemeFeed_Bloc(
            memeRepository: context.read<Meme_Repository>(),
            initialState: const MemeFeed_State(),
          )..add(const MemeFeed_Event_FetchMemes()),
        ),
        BlocProvider(
          lazy: false,
          create: (_) => MemeUpload_Bloc(
            memeRepository: context.read<Meme_Repository>(),
            initialState: const MemeUpload_State(),
          ),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => UserProfile_Cubit(
            profileRepository: context.read<Profile_Repository>(),
          )..fetchProfile(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => NewMemesNotification_Cubit(
            memeRepository: context.read<Meme_Repository>(),
            initialState: NewMemesNotification_State.initial(),
          ),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MemeUpload_Listener_StatusChange(
      child: AutoTabsRouter.pageView(
        homeIndex: 0,
        routes: const [
          HomeFeed_Route(),
          UploadMeme_Route(),
          UserProfile_Route(),
        ],
        builder: (context, child, controller) {
          final tabsRouter = AutoTabsRouter.of(context);
          return FScaffold(
            content: child,
            footer: SafeArea(
              top: false,
              bottom: true,
              child: FBottomNavigationBar(
                index: tabsRouter.activeIndex,
                onChange: (value) {
                  if (value == 1) {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (modalContext) {
                        return BlocProvider.value(
                          value: context.read<MemeUpload_Bloc>(),
                          child: SafeArea(
                            child: AnimatedPadding(
                              duration: const Duration(milliseconds: 150),
                              curve: Curves.easeOut,
                              padding: EdgeInsets.only(
                                bottom: MediaQuery.of(modalContext)
                                    .viewInsets
                                    .bottom,
                              ),
                              child: Material(
                                color: Colors.white,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(8),
                                ),
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.all(16),
                                  child: MemeUpload_Widget_Form(
                                    onSubmit: (title, imageFile) {
                                      context.read<MemeUpload_Bloc>().add(
                                            MemeUpload_Event_SubmitMeme(
                                              title: title,
                                              imageFile: imageFile,
                                            ),
                                          );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    tabsRouter.setActiveIndex(value);
                  }
                },
                children: [
                  FBottomNavigationBarItem(
                    icon: FIcon(FAssets.icons.house),
                    label: Text(context.t.homeShell.navigationBar.home.label),
                  ),
                  FBottomNavigationBarItem(
                    icon: CircleAvatar(
                      backgroundColor: context.theme.colorScheme.primary,
                      radius: 35,
                      child: FIcon(
                        FAssets.icons.plus,
                        color: context.theme.colorScheme.primaryForeground,
                      ),
                    ),
                    label: const SizedBox.shrink(),
                    style: FBottomNavigationBarItemStyle(
                      iconSize: 40,
                      activeIconColor: Colors.black,
                      activeTextStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      inactiveIconColor: Colors.black,
                      inactiveTextStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  FBottomNavigationBarItem(
                    icon: FIcon(FAssets.icons.user),
                    label:
                        Text(context.t.homeShell.navigationBar.profile.label),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
