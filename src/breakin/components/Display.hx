package breakin.components;

import edge.IComponent;
import pixi.textures.Texture;
import pixi.display.Sprite;

class Display implements IComponent {
  var sprite : Sprite;
  var x : Float;
  var y : Float;

  public function new(image : String, x : Float = 0, y : Float = 0) {
    this.sprite = new Sprite(Texture.fromImage(image));
    this.x = x;
    this.y = y;
  }
}