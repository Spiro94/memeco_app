import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../../outside/repositories/posts/repository.dart';
import '../../../../blocs/meme_upload/bloc.dart';
import '../../../../blocs/meme_upload/events.dart';
import '../../../../blocs/memes/bloc.dart';
import '../../../../blocs/memes/events.dart';
import '../../../router.dart';
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
          create: (_) => MemeFeed_Bloc(
            memeRepository: context.read<Meme_Repository>(),
          )..add(const MemeFeed_Event_FetchMemes()),
        ),
        BlocProvider(
          create: (_) => MemeUpload_Bloc(
            memeRepository: context.read<Meme_Repository>(),
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
        routes: const [
          HomeFeed_Route(),
          // MemeUpload_Route(),
          // ProfileRoute(),
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
                children: const [
                  FBottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  FBottomNavigationBarItem(
                    icon: Icon(Icons.upload),
                    label: Text('Upload'),
                  ),
                  FBottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: Text('Settings'),
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
