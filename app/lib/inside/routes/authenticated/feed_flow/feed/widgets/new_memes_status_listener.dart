import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../../blocs/memes/bloc.dart';
import '../../../../../blocs/memes/events.dart';
import '../../../../../cubits/new_memes_notification/cubit.dart';
import '../../../../../cubits/new_memes_notification/state.dart';

class HomeFeed_Listener_NewMemesStatus extends StatelessWidget {
  const HomeFeed_Listener_NewMemesStatus({
    required this.child,
    super.key,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<NewMemesNotification_Cubit, NewMemesNotification_State>(
      listener: (context, state) {
        if (state.hasNewMemes) {
          final overlay = Overlay.of(context);
          final overlayEntry = OverlayEntry(
            builder: (context) => Positioned(
              top: 50,
              left: 16,
              right: 16,
              child: GestureDetector(
                onTap: () {
                  context
                      .read<MemeFeed_Bloc>()
                      .add(const MemeFeed_Event_FetchMemes());
                },
                child: FAlert(
                  title: const Text('New memes available!'),
                  subtitle: const Text('Tap to refresh your feed.'),
                  style: FAlertStyle.primary,
                  icon: const Icon(Icons.refresh),
                ),
              ),
            ),
          );

          overlay.insert(overlayEntry);
          // Remove the banner after a few seconds if needed.
          Future.delayed(const Duration(seconds: 5), overlayEntry.remove);
        }
      },
      child: child,
    );
  }
}
