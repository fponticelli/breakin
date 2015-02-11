package breakin.render;

import breakin.components.Structure;
import breakin.components.Display;
import edge.Entity;
import edge.ISystem;
import pixi.display.Sprite;
import pixi.display.Stage;
import pixi.renderers.IRenderer;

class PixiRenderer implements ISystem {
  var stage : Stage;
  var renderer : IRenderer;
  public function new(stage : Stage, renderer : IRenderer) {
    this.stage = stage;
    this.renderer = renderer;
  }

  public function updateAdded(entity : Entity, data : { structure : Structure, display : Display }) {
    stage.addChild(data.display.sprite);
  }

  public function updateRemoved(entity : Entity, data : { structure : Structure, display : Display }) {
    stage.removeChild(data.display.sprite);
  }

  public function before()
    renderer.render(stage);

  public function update(structure : Structure, display : Display) {
    var pos = structure.body.position;
    display.sprite.pivot.x = display.x;
    display.sprite.pivot.y = display.y;
    display.sprite.rotation = structure.body.rotation;
    display.sprite.x = pos.x;
    display.sprite.y = pos.y;
  }
}