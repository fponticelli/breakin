package breakin.components;

import nape.shape.Circle;
import nape.phys.*;

class Ball {
  public var shape : Circle;

  public function new(radius : Float) {
    shape = new Circle(radius);
    shape.body = new Body();
    shape.body.position.setxy(radius, radius);
    shape.body.velocity.setxy(10, 10);
    shape.material = Material.rubber();
  }
}