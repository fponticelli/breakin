package breakin.phys;

import edge.*;
import breakin.components.*;

class UpdatePaddlePosition implements ISystem {
  var minx : Float;
  var maxx : Float;
  var delta : Float;
  var accelleration : Float;
  var decelleration : Float;
  var cur : Float;
  var base : Float;
  var status : Int;
  public function new(minx : Float, maxx : Float, base : Float) {
    this.minx = minx;
    this.maxx = maxx;
    delta = 50;
    accelleration = 50;
    decelleration = 10;
    this.base = base;
    status = 0;
  }

  public function update(paddle : Structure, direction : PaddleDirection) {
    //direction.x = 0;
    paddle.body.velocity.x += direction.x * 4;
    if(paddle.body.position.x <= minx && paddle.body.velocity.x < 0) {
      paddle.body.position.x = minx;
      paddle.body.velocity.x = 0;
      direction.x = 0;
    } else if(paddle.body.position.x >= maxx && paddle.body.velocity.x > 0) {
      paddle.body.position.x = maxx;
      paddle.body.velocity.x = 0;
      direction.x = 0;
    } else if(Math.abs(direction.x) < 0.1) {
      direction.x = 0;
      paddle.body.velocity.x *= 0.9;
    } else {
      direction.x *= 0.8;
      //paddle.body.velocity.x *= 0.15;
    }
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