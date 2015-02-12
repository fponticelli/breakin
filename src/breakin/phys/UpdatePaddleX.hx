package breakin.phys;

import edge.*;
import breakin.components.*;

class UpdatePaddleX implements ISystem {
  var delta : Float;
  var accelleration : Float;
  var decelleration : Float;
  var base : Float;
  var status : Int;
  public function new(base : Float, delta : Float, accelleration : Float, decelleration : Float) {
    this.delta = delta;
    this.accelleration = accelleration;
    this.decelleration = decelleration;
    this.base = base;
    status = 0;
  }

  var timeDelta : Float;
  public function update(paddle : Structure, direction : PaddleDirection) {
    if(direction.x == 0) {
      paddle.body.velocity.x *= 0.92;
    } else {
      paddle.body.velocity.x += timeDelta / 1000 * direction.x * 1200;
    }
    direction.x = 0;

    if(status == 0 && direction.spring) {
      status = 1;
    }
    direction.spring = false;
    //trace(paddle.body.position.y + " " + base);
    if(paddle.body.position.y <= base - delta) {
      paddle.body.position.y = base - delta;
      paddle.body.velocity.y = 0;
      status = -1;
    } else if(paddle.body.position.y > base) {
      paddle.body.position.y = base;
      paddle.body.velocity.y = 0;
      status = 0;
    }
    if(status > 0) {
      paddle.body.velocity.y -= accelleration;
    } else if(status < 0) {
      paddle.body.velocity.y += decelleration;
    }
  }
}