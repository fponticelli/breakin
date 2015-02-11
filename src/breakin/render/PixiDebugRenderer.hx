package breakin.render;

import breakin.components.Structure;
import edge.Entity;
import edge.ISystem;
import pixi.display.Stage;
import pixi.primitives.Graphics;
import nape.shape.Shape;
using thx.core.Arrays;
import thx.color.HSL;

class PixiDebugRenderer implements ISystem {
  var stage : Stage;
  var map : Map<Entity, Graphics>;
  public function new(stage : Stage) {
    this.stage = stage;
    map = new Map();
  }

  public function updateAdded(entity : Entity, data : { structure : Structure }) {
    var g = new Graphics();
    map.set(entity, g);
    stage.addChild(g);
    var color = HSL.create(Math.random() * 360, 0.6, 0.5).toRGB();
    g.lineStyle(1, color, 0.75);
    data.structure.shapes.pluck(render(g, _));
  }

  public function updateRemoved(entity : Entity, data : { structure : Structure }) {
    var g = map.get(entity);
    map.remove(entity);
    stage.removeChild(g);
  }

  var entity : Entity;
  public function update(structure : Structure) {
    var g = map.get(entity);
    g.rotation = structure.body.rotation;
    g.x = structure.body.position.x;
    g.y = structure.body.position.y;
  }

  function render(g : Graphics, shape : Shape) {
    if(shape.isCircle()) {
      var c = shape.castCircle,
          x = c.localCOM.x,
          y = c.localCOM.y;
      g.drawCircle(x, y, c.radius);
      g.moveTo(x, y);
      g.lineTo(x + c.radius, y);
    } else {
      var p = shape.castPolygon;
      g.moveTo(shape.localCOM.x,shape.localCOM.y);
      for(i in 0...p.worldVerts.length) {
        var px = p.localVerts.at(i);
        g.lineTo(px.x, px.y);
      }
      var px = p.localVerts.at(0);
      g.lineTo(px.x, px.y);
    }
  }
}