sealed class MemeDetails_Event {
  const MemeDetails_Event();
}

class MemeDetails_Event_Fetch extends MemeDetails_Event {
  const MemeDetails_Event_Fetch({
    required this.memeId,
  });

  final String memeId;
}
