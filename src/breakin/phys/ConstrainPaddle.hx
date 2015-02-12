package breakin.phys;

import edge.*;
import breakin.components.*;

class ConstrainPaddle implements ISystem {
  var minx : Float;
  var maxx : Float;
  public function new(minx : Float, maxx : Float) {
    this.minx = minx;
    this.maxx = maxx;
  }

  public function update(paddle : Structure, direction : PaddleDirection) {
    if(paddle.body.position.x <= minx) {
      paddle.body.position.x = minx;
      paddle.body.velocity.x = 0;
    } else if(paddle.body.position.x >= maxx) {
      paddle.body.position.x = maxx;
      paddle.body.velocity.x = 0;
    }
  }
}