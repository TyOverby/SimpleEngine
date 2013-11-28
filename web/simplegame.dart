library simplegame;

import 'dart:html';
import 'dart:async';

part './mouseevents.dart';
part './keyboardevents.dart';
part './touchevents.dart';

abstract class SimpleGame {

  /**
   * Implement to update the internal game state.
   * [dt] is the delta-time in milliseconds since the last update.
   */
  void update(int dt);

  /**
   * Implement to draw the game.
   * [ctx] is the Graphics context for the game.
   * [dt] is the delta-time that was passed in to [update].
   */
  void draw(CanvasRenderingContext2D ctx, int dt);

  /**
   * Implement to setup event binding.
   */
  void bindEvents(KeyboardEvents kev, MouseEvents mev, TouchEvents tev);

  bool _eventsRegistered = false;
  bool _running = false;
  int _lastTime = 0;
  int _frameLimit = 0;
  CanvasRenderingContext2D _ctx;
  CanvasElement _ele;

  SimpleGame(CanvasElement ele) {
    _ele = ele;
    _ctx = ele.getContext("2d");
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



  void start() {
    if(!_eventsRegistered){
      bindEvents(new KeyboardEvents(window.document.query("body")), new MouseEvents(_ele), new TouchEvents(_ele));
      _eventsRegistered = true;
    }
    if(!_running){
      _running = true;
      _lastTime = new DateTime.now().millisecondsSinceEpoch;
      loop_();
    }
  }

  void stop(){
    _running = false;
  }

  /**
   * Limits the amount of time between calls to [update] and [draw].
   * Calling `limit(5)` means that [update] and [draw] should be called
   * every 5 milliseconds.
   *
   * Not calling [limit] and calling `limit(0)` both set the game to update as
   * much as possible using `requestAnimationFrame`.
   */
  void limit(int limit) {
    _frameLimit = limit;
  }

  void loop_(){
    if(!_running) {
      return;
    }

    int current = new DateTime.now().millisecondsSinceEpoch;
    int dt = current - _lastTime;

    if(dt <= _frameLimit){
      var timer = new Timer(new Duration(milliseconds: (_frameLimit - dt)), ()=>loop_());
      return;
    }
    _lastTime = current;

    update(dt);
    draw(_ctx, dt);

    window.animationFrame.then((_)=>loop_());
  }
}