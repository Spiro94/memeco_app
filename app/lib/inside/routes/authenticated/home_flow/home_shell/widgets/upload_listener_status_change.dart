import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../../blocs/meme_upload/bloc.dart';
import '../../../../../blocs/meme_upload/state.dart';
import '../../../../../blocs/memes/bloc.dart';
import '../../../../../blocs/memes/events.dart';

class MemeUpload_Listener_StatusChange extends StatelessWidget {
  final Widget child;
  const MemeUpload_Listener_StatusChange({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<MemeUpload_Bloc, MemeUpload_State>(
      child: child,
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        switch (state.status) {
          case MemeUpload_Status.failure:
            {
              final scaffoldBackgroundColor =
                  context.theme.scaffoldStyle.backgroundColor;
              if (state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: scaffoldBackgroundColor,
                    content: FAlert(
                      title: Text(state.errorMessage!),
                      style: FAlertStyle.destructive,
                    ),
                  ),
                );
              }
            }

          case MemeUpload_Status.success:
            {
              final scaffoldBackgroundColor =
                  context.theme.scaffoldStyle.backgroundColor;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: scaffoldBackgroundColor,
                  content: FAlert(
                    title: const Text('Meme uploaded successfully'),
                    style: FAlertStyle.primary,
                  ),
                ),
              );

              context
                  .read<MemeFeed_Bloc>()
                  .add(const MemeFeed_Event_FetchMemes());
            }

          case MemeUpload_Status.loading:
          case MemeUpload_Status.idle:
            break;
        }
      },
    );
  }
}
