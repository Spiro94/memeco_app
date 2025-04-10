import 'meme.dart';

class Model_Meme_WithVotes {
  final Model_Meme meme;
  final int likes;
  final int dislikes;
  final bool? myVote;
  final String? creatorUsername;
  final String? creatorProfilePicture;
  final String? creatorId;

  Model_Meme_WithVotes({
    required this.meme,
    required this.likes,
    required this.dislikes,
    this.creatorUsername,
    this.creatorProfilePicture,
    this.creatorId,
    this.myVote,
  });

  factory Model_Meme_WithVotes.fromJson(Map<String, dynamic> json) {
    // Note: The JSON contains fields that match Model_Meme
    // (id, title, image_url, created_at)
    // plus aggregated fields likes and dislikes.
    return Model_Meme_WithVotes(
      meme: Model_Meme.fromJson(json),
      likes: json['likes'] as int,
      dislikes: json['dislikes'] as int,
      myVote: json['my_vote'] as bool?,
      creatorUsername: json['creator_username'] as String?,
      creatorProfilePicture: json['creator_profile_picture'] as String?,
      creatorId: json['creator_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meme': meme.toJson(),
      'likes': likes,
      'dislikes': dislikes,
      'my_vote': myVote,
    };
  }
}
