package breakin.render;

import openfl.display.Sprite;
import edge.ISystem;
import nape.space.*;
import nape.util.ShapeDebug;

class DebugPhysicsRender implements ISystem {
  var debug : ShapeDebug;
  var space : Space;
  public function new(container : Sprite, space : Space) {
    debug = new ShapeDebug(container.stage.stageWidth, container.stage.stageHeight, 0x000000);
    container.addChild(debug.display);
    this.space = space;
  }

  public function update() {
    debug.clear();
    // untyped debug.display.__graphics.beginFill(0x00FF00);
    // untyped debug.display.__graphics.drawRect(100, 100, 120, 100);
    // untyped debug.display.__graphics.endFill();
    debug.draw(space);
    debug.flush();
  }
}