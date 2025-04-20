sealed class MemeFeed_Event {
  const MemeFeed_Event();
}

final class MemeFeed_Event_FetchInitialPage extends MemeFeed_Event {
  const MemeFeed_Event_FetchInitialPage();
}

final class MemeFeed_Event_FetchNextPage extends MemeFeed_Event {
  const MemeFeed_Event_FetchNextPage();
}

final class MemeFeed_Event_RefreshPage extends MemeFeed_Event {
  const MemeFeed_Event_RefreshPage();
}

final class MemeFeed_Event_FetchMemes extends MemeFeed_Event {
  const MemeFeed_Event_FetchMemes();
}

final class MemeFeed_Event_RefreshMemes extends MemeFeed_Event {
  const MemeFeed_Event_RefreshMemes();
}
