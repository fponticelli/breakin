package breakin.render;

import breakin.components.Structure;
import breakin.components.Display;
import edge.Entity;
import edge.ISystem;
import pixi.display.Stage;
import pixi.primitives.Graphics;
import pixi.renderers.IRenderer;
import nape.shape.Shape;
import nape.phys.*;
using thx.core.Arrays;
import thx.color.HSL;

class PixiDebugRenderer implements ISystem {
  var stage : Stage;
  var g : Graphics;
  var renderer : IRenderer;
  var color : Int;
  public function new(stage : Stage, renderer : IRenderer) {
    this.stage = stage;
    this.renderer = renderer;
    this.g = new Graphics();
    stage.addChild(g);
    color = HSL.create(200, 0.5, 0.5).toRGB();
  }

  public function before() {
    g.clear();
    g.lineStyle(1, color, 0.75);
  }

  public function update(structure : Structure) {
    structure.shapes.pluck(render(_, structure.body));
  }

  function render(shape : Shape, body : Body) {
    if(shape.isCircle()) {
      var c = shape.castCircle,
          x = c.localCOM.x + body.position.x,
          y = c.localCOM.y + body.position.y;
      g.drawCircle(x, y, c.radius);
      g.moveTo(x, y);
      g.lineTo(x + Math.cos(body.rotation) * c.radius, y + Math.sin(body.rotation) * c.radius);
    } else {
      var p = shape.castPolygon;
      g.moveTo(shape.localCOM.x,shape.localCOM.y);
      for(i in 0...p.worldVerts.length) {
        var px = p.localVerts.at(i);
        g.lineTo(px.x + body.position.x, px.y + body.position.y);
      }
      var px = p.localVerts.at(0);
      g.lineTo(px.x + body.position.x, px.y + body.position.y);
    }
  }
}