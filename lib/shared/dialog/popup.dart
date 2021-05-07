class Popup {
  String title;
  String message;
  PopupButton buttonType;

  Popup(this.title, this.message, this.buttonType);
}

enum PopupButton {
  close,
  save,
}

extension ParseToString on PopupButton {
  String toShortString() {
    return this.toString().split('.').last;
  }
}