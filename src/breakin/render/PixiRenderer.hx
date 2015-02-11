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

  public function update(structure : Structure, display : Display) {
    renderer.render(stage);
  }
}