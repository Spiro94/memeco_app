import '../../inside/blocs/meme_vote/bloc.dart';
import '../../inside/blocs/meme_vote/state.dart';
import '../../shared/models/meme_with_votes.dart';
import '../repositories/memes/repository.dart';

class MemeVoteBlocManager {
  // Singleton instance
  static final MemeVoteBlocManager _instance = MemeVoteBlocManager._internal();

  // Factory constructor to return the same instance
  factory MemeVoteBlocManager() => _instance;

  // Private constructor
  MemeVoteBlocManager._internal();

  // Map to store MemeVote_Bloc instances by meme ID
  final Map<String, MemeVote_Bloc> _blocMap = {};

  // Method to retrieve or create a MemeVote_Bloc for a given meme ID
  MemeVote_Bloc getBloc(
    Model_Meme_WithVotes memeWithVotes,
    Meme_Repository memeRepository,
  ) {
    return _blocMap.putIfAbsent(
      memeWithVotes.meme.id,
      () => MemeVote_Bloc(
        initialState: MemeVote_State.initial(
          memeId: memeWithVotes.meme.id,
          likes: memeWithVotes.likes,
          dislikes: memeWithVotes.dislikes,
          isLiked: memeWithVotes.myVote ?? false,
          isDisliked: memeWithVotes.myVote == false,
        ),
        memeRepository: memeRepository,
      ),
    );
  }

  // Optional: Method to dispose of a specific bloc
  void disposeBloc(String memeId) {
    _blocMap[memeId]?.close();
    _blocMap.remove(memeId);
  }

  // Optional: Dispose all blocs
  void disposeAll() {
    _blocMap.forEach((key, bloc) => bloc.close());
    _blocMap.clear();
  }
}
