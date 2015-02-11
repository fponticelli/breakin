package breakin.render;

import breakin.components.Body;
import breakin.components.Display;
import edge.Entity;
import edge.ISystem;
import pixi.display.Sprite;
import pixi.display.Stage;
import pixi.renderers.IRenderer;

class PixiRenderer implements ISystem {
  var stage : Stage;
  var renderer : IRenderer;
  var map : Map<Entity, Sprite>;
  public function new(stage : Stage, renderer : IRenderer) {
    this.stage = stage;
    this.renderer = renderer;
    this.map = new Map();
  }

  public function updateAdded(entity : Entity, data : { body : Body, display : Display }) {
    map.set(entity, data.display.sprite);
    stage.addChild(data.display.sprite);
  }

  public function updateRemoved(entity : Entity) {
    var sprite = map.get(entity);
    map.remove(entity);
    stage.removeChild(sprite);
  }

  public function before()
    renderer.render(stage);

  public function update(body : Body, display : Display) {
    var pos = body.body.position;
    display.sprite.pivot.x = display.x;
    display.sprite.pivot.y = display.y;
    display.sprite.rotation = body.body.rotation;
    display.sprite.x = pos.x;
    display.sprite.y = pos.y;
  }
}