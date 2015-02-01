package breakin.render;

import openfl.display.Sprite;
import edge.ISystem;
import nape.space.*;
import nape.util.ShapeDebug;

class DebugPhysicsRender implements ISystem {
  var debug : ShapeDebug;
  var space : Space;
  public function new(container : Sprite, space : Space) {
    debug = new ShapeDebug(container.stage.stageWidth, container.stage.stageHeight);
    container.addChild(debug.display);
    this.space = space;
  }

  public function update() {
    debug.clear();
    debug.draw(space);
    debug.flush();
  }
}