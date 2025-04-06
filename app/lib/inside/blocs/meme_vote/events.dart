sealed class MemeVote_Event {
  const MemeVote_Event();
}

class MemeVote_LikeMemeEvent extends MemeVote_Event {
  const MemeVote_LikeMemeEvent();
}

class MemeVote_DislikeMemeEvent extends MemeVote_Event {
  const MemeVote_DislikeMemeEvent();
}
