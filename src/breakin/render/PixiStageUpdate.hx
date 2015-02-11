package breakin.render;

import breakin.components.Structure;
import breakin.components.Display;
import edge.Entity;
import edge.ISystem;
import pixi.display.Sprite;
import pixi.display.Stage;

class PixiStageUpdate implements ISystem {
  var stage : Stage;
  public function new(stage : Stage) {
    this.stage = stage;
  }

  public function updateAdded(entity : Entity, data : { structure : Structure, display : Display }) {
    stage.addChild(data.display.sprite);
  }

  public function updateRemoved(entity : Entity, data : { structure : Structure, display : Display }) {
    stage.removeChild(data.display.sprite);
  }

  public function update(structure : Structure, display : Display) {
    var pos = structure.body.position;
    display.sprite.pivot.x = display.x;
    display.sprite.pivot.y = display.y;
    display.sprite.rotation = structure.body.rotation;
    display.sprite.x = pos.x;
    display.sprite.y = pos.y;
  }
}