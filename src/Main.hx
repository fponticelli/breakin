import breakin.Game;
import openfl.display.Sprite;

class Main extends Sprite {
  public function new() {
    super();
    var game = new Game(this);
    game.start();
  }
}