package breakin.components;

import nape.shape.*;
import nape.phys.*;
using thx.core.Nulls;
using thx.core.Arrays;

class Body {
  public var shapes : Array<Shape>;
  public var body : nape.phys.Body;


  public function new(shapes : Array<Shape>, ?type : BodyType, ?material : Material) {
    this.shapes = shapes;
    this.body = new nape.phys.Body(type.or(BodyType.DYNAMIC));
    shapes.map(function(shape) {
      //body.shapes.add(shape);
      shape.body = body;
      shape.material = material.or(new Material(0.5));
    });
  }

  public static function ball(x : Float, y : Float, radius : Float, ?type : BodyType, ?material : Material) {
    var body = new Body([new Circle(radius)], type, material);
    body.body.position.setxy(x, y);
    return body;
  }

  public static function rect(x : Float, y : Float, width : Float, height : Float, ?type : BodyType, ?material : Material)
    return new Body([new Polygon(Polygon.rect(x, y, width, height))], type, material);

  public static function perimeter(x : Float, y : Float, width : Float, height : Float, size : Float, ?material : Material) {
    return new Body([
      new Polygon(Polygon.rect(x, y, width, size)),
      new Polygon(Polygon.rect(x + width - size, y + size, width, height - size * 2)),
      new Polygon(Polygon.rect(x, y + height - size, width, size)),
      new Polygon(Polygon.rect(x, size, size, height - size * 2))
    ], BodyType.STATIC, material);
  }
}