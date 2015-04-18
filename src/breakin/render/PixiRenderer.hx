package breakin.render;

import breakin.components.Structure;
import breakin.components.Display;
import edge.Entity;
import edge.ISystem;
import pixi.core.display.Container;
import pixi.core.renderers.SystemRenderer;

class PixiRenderer implements ISystem {
  var stage : Container;
  var renderer : SystemRenderer;
  public function new(stage : Container, renderer : SystemRenderer) {
    this.stage = stage;
    this.renderer = renderer;
  }

  public function update(structure : Structure, display : Display)
    renderer.render(stage);
}
