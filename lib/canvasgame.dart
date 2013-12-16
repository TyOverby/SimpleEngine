part of simple_engine;

abstract class CanvasGame extends SimpleGame<CanvasRenderingContext2D> {
  CanvasElement _ele;
  
  CanvasGame(CanvasElement ele) {
    _ele = ele;
    this._context = ele.getContext("2d");
  }
  
  /*
   *  Width / Height
   */
  int get width => _ele.width;
  int get height => _ele.height;

  void set width(int nw) {
    _ele.width = nw;
  }
  void set height(int nh) {
    _ele.height = nh;
  }
}