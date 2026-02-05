enum AppRoutes {
  splash('splash', '/splash'),
  currency('currency', '/currency'),
  news('news', '/news'),
  favourites('favourites', '/favourites'),
  settings('settings', '/settings');

  final String name;
  final String path;

  const AppRoutes(this.name, this.path);
}
