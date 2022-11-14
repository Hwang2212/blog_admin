abstract class NavBarState {}

class ShowHome extends NavBarState {
  final int itemIndex = 0;
}

class ShowUser extends NavBarState {
  final int itemIndex = 1;
}

class ShowPosts extends NavBarState {
  final int itemIndex = 2;
}

class ShowCategory extends NavBarState {
  final int itemIndex = 3;
}
