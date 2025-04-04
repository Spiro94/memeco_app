import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

//Placeholder page to avoid index error on tab change
@RoutePage()
class UploadMeme_Page extends StatelessWidget {
  const UploadMeme_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const FScaffold(
      content: Center(
        child: Text('Upload Meme Page'),
      ),
    );
  }
}
