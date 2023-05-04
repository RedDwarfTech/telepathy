enum MenuType { home, sub, channels, my }

extension ResponseStatusExtension on MenuType {
  static const menuValue = {
    MenuType.my: 1,
    MenuType.home: 0,
  };

  int? get value => menuValue[this];
}
