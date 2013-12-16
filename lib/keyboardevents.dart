part of simple_engine;

class KeyboardEvents {
  HtmlElement ele_;
  KeyboardEvents(HtmlElement ele) {
    ele_ = ele;
  }

  Stream<KeyboardEvent> get onKeyDown => ele_.onKeyDown;
  Stream<KeyboardEvent> get onKeyUp => ele_.onKeyUp;
  Stream<KeyboardEvent> get onKeyPress => ele_.onKeyPress;

  KeyEvents key(int code) {
    return new KeyEvents(ele_, code);
  }

  KeyEvents keys(List<int> codes) {
    return new KeyEvents.fromMultiple(ele_, codes);
  }
}

class KeyEvents {
  HtmlElement ele_;
  List<int> codes_;

  KeyEvents(HtmlElement ele, int code) {
    ele_ = ele;
    codes_ = [code];
  }

  KeyEvents.fromMultiple(HtmlElement ele, List<int> codes) {
    ele_ = ele;
    codes_ = codes;
  }

  bool filter(KeyboardEvent e) => codes_.contains(e.keyCode);

  Stream<KeyboardEvent> get onKeyDown => ele_.onKeyDown.where(filter);
  Stream<KeyboardEvent> get onKeyUp => ele_.onKeyUp.where(filter);
  Stream<KeyboardEvent> get onKeyPress => ele_.onKeyPress.where(filter);
}
