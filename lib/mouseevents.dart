part of simple_engine;

class MouseEvents {
  HtmlElement ele_;
  MouseEvents(HtmlElement ele) {
    ele_ = ele;
    ele_.onMouseDown;
    ele_.onMouseEnter;
  }

  ElementStream<MouseEvent> get onMouseDown => ele_.onMouseDown;
  ElementStream<MouseEvent> get onMouseEnter => ele_.onMouseEnter;
  ElementStream<MouseEvent> get onMouseLeave => ele_.onMouseLeave;
  ElementStream<MouseEvent> get onMouseMove => ele_.onMouseMove;
  ElementStream<MouseEvent> get onMouseOut => ele_.onMouseOut;
  ElementStream<MouseEvent> get onMouseOver => ele_.onMouseOver;
  ElementStream<MouseEvent> get onMouseUp => ele_.onMouseUp;
  ElementStream<WheelEvent> get onMouseWheel => ele_.onMouseWheel;

}
