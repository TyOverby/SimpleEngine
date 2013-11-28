part of simplegame;

class TouchEvents {
  HtmlElement ele_;
  TouchEvents(HtmlElement ele) {
    ele_ = ele;
  }

  ElementStream<TouchEvent> get onTouchCancel => ele_.onTouchCancel;
  ElementStream<TouchEvent> get onTouchEnd => ele_.onTouchEnd;
  ElementStream<TouchEvent> get onTouchEnter => ele_.onTouchEnter;
  ElementStream<TouchEvent> get onTouchLeave => ele_.onTouchLeave;
  ElementStream<TouchEvent> get onTouchMove => ele_.onTouchMove;
  ElementStream<TouchEvent> get onTouchStart => ele_.onTouchStart;
}
