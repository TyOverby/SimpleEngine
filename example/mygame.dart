import '../web/simplegame.dart';
import 'dart:html';

class MyGame extends SimpleGame {
  MyGame(): super(query("canvas") as CanvasElement) {
    this.limit(0);
    this.width = 500;
    this.height = 500;
  }

  var x = 25;
  var y = 25;

  var vx = 0;
  var vy = 0;

  bindEvents(KeyboardEvents kev, MouseEvents mev, TouchEvents tev) {
    move({int rx, int ry}) {
      return (_){
        if(rx != null){
          vx = rx;
        }
        if(ry != null) {
          vy = ry;
        }
      };
    }
    kev.key(KeyCode.UP).onKeyDown.listen(move(ry: -5));
    kev.key(KeyCode.UP).onKeyUp.listen(move(ry:0));

    kev.key(KeyCode.DOWN).onKeyDown.listen(move(ry: 5));
    kev.key(KeyCode.DOWN).onKeyUp.listen(move(ry:0));

    kev.key(KeyCode.LEFT).onKeyDown.listen(move(rx: -5));
    kev.key(KeyCode.LEFT).onKeyUp.listen(move(rx:0));

    kev.key(KeyCode.RIGHT).onKeyDown.listen(move(rx: 5));
    kev.key(KeyCode.RIGHT).onKeyUp.listen(move(rx:0));

    mev.onMouseMove.listen((MouseEvent event){
      x = event.offset.x;
      y = event.offset.y;
    });
  }

  update(int dt){
    //print(dt);
    var wouldX = x + vx;
    var wouldY = y + vy;
    if(wouldX < (width - 50) && wouldX > 0) {
      x = wouldX;
    }
    if(wouldY < (height - 50) && wouldY > 0) {
      y = wouldY;
    }
  }

  draw(CanvasRenderingContext2D ctx, int dt) {
    ctx.clearRect(x-vx,y-vy,50,50);

    ctx.fillStyle = "red";
    ctx.fillRect(x,y,50,50);
  }
}

void main(){
  var game = new MyGame();
  game.start();
}
