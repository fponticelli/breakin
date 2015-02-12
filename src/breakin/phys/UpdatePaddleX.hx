package breakin.phys;

import edge.*;
import breakin.components.*;

class UpdatePaddleX implements ISystem {
  var maxVelocity : Float;
  public function new(maxVelocity : Float) {
    this.maxVelocity = maxVelocity;
  }

  var timeDelta : Float;
  public function update(paddle : Structure, direction : PaddleDirection) {
    if(direction.x == 0) {
      paddle.body.velocity.x *= 0.92;
    } else {
      paddle.body.velocity.x += timeDelta / 1000 * direction.x * maxVelocity;
    }
    direction.x = 0;
  }
}