part of simplegame;

class KeyboardEvents {
  HtmlElement ele_;
  KeyboardEvents(HtmlElement ele) {
    ele_ = ele;
  }

  ElementStream<KeyboardEvent> get onKeyDown => ele_.onKeyDown;
  ElementStream<KeyboardEvent> get onKeyUp => ele_.onKeyUp;
  ElementStream<KeyboardEvent> get onKeyPress => ele_.onKeyPress;

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

  ElementStream<KeyboardEvent> get onKeyDown => ele_.onKeyDown.where(filter);
  ElementStream<KeyboardEvent> get onKeyUp => ele_.onKeyUp.where(filter);
  ElementStream<KeyboardEvent> get onKeyPress => ele_.onKeyPress.where(filter);
}
