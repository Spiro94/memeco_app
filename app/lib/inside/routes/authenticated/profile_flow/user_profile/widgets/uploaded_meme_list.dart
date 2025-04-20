import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../outside/theme/theme.dart';
import '../../../../../cubits/user_uploaded_memes/cubit.dart';
import '../../../../../cubits/user_uploaded_memes/state.dart';
import '../../../../router.dart';

class UserProfile_UploadedMemeList extends StatelessWidget {
  const UserProfile_UploadedMemeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserUploadedMemes_Cubit, UserUploadedMemes_State>(
      builder: (context, state) {
        if (state.status == UserUploadedMemes_Status.loading) {
          return const CircularProgressIndicator();
        } else if (state.status == UserUploadedMemes_Status.error) {
          return const Text('Error loading your memes');
        } else if (state.status == UserUploadedMemes_Status.loaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Uploaded Memes',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  vertical: context.tokens.spacing.medium,
                ),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                ),
                itemCount: state.memes.length,
                itemBuilder: (context, index) {
                  final meme = state.memes[index];
                  return GestureDetector(
                    onTap: () {
                      context.router.push(MemeDetails_Route(memeId: meme.id));
                    },
                    child: CachedNetworkImage(
                      imageUrl: meme.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  );
                },
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
