import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../blocs/memes/bloc.dart';
import '../../../../../blocs/memes/state.dart';

class MemeFeed_Listener_StatusChange extends StatelessWidget {
  final Widget child;
  const MemeFeed_Listener_StatusChange({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MemeFeed_Bloc, MemeFeed_State>(
      listener: (_, state) {
        if (state.status == MemeFeed_Status.loadError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      child: child,
    );
  }
}
