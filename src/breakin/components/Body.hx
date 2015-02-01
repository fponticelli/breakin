package breakin.components;

import nape.shape.*;
import nape.phys.*;
using thx.core.Nulls;

class Body {
  public var shape : Shape;

  public function new(shape : Shape, ?type : BodyType, ?material : Material) {
    this.shape = shape;
    shape.body = new nape.phys.Body(type.or(BodyType.DYNAMIC));
    shape.material = material.or(Material.rubber());
  }

  public static function ball(radius : Float, ?type : BodyType, ?material : Material)
    return new Body(new Circle(radius), material);

  public static function rect(x : Float, y : Float, width : Float, height : Float, ?type : BodyType, ?material : Material)
    return new Body(new Polygon(Polygon.rect(x, y, width, height)), material);
}