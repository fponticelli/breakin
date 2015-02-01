package breakin.components;

import nape.phys.*;
import nape.shape.Polygon;

class Floor {
  public var shape : Polygon;

  public function new(width : Int, height : Int) {
    shape = new Polygon(Polygon.rect(0, height / 2, width, 10));
    shape.body = new Body(BodyType.STATIC);
  }
}