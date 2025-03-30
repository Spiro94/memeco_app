import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../blocs/memes/bloc.dart';
import '../../../../blocs/memes/events.dart';
import '../../../../blocs/memes/state.dart';
import '../../../../util/breakpoints.dart';
import '../../../widgets/scaffold.dart';
import 'widgets/header.dart';
import 'widgets/listener_status_change.dart';
import 'widgets/meme_list.dart';

@RoutePage()
class HomeFeed_Page extends StatelessWidget {
  const HomeFeed_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Routes_Scaffold(
      breakpointType: InsideUtil_BreakpointType.constrained,
      scaffold: FScaffold(
        header: const Home_Header(),
        content: RefreshIndicator(
          onRefresh: () async {
            context
                .read<MemeFeed_Bloc>()
                .add(const MemeFeed_Event_FetchMemes());
          },
          child: MemeFeed_Listener_StatusChange(
            child: BlocBuilder<MemeFeed_Bloc, MemeFeed_State>(
              builder: (_, state) {
                return MemeFeed_Widget_List(memes: state.memes);
              },
            ),
          ),
        ),
      ),
    );
  }
}
