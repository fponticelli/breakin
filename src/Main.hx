import breakin.Game;

import pixi.display.Stage;
import pixi.utils.Detector;
import pixi.renderers.IRenderer;

class Main {
  public static function main() {
    var stage = new Stage(Config.backgroundColor),
        options : RenderingOptions = {};
    options.antialias = true;
    options.resolution = 1;
    options.transparent = false;

    var renderer = Detector.autoDetectRenderer(Config.width, Config.height, options);
    js.Browser.document.body.appendChild(renderer.view);

    new Main(stage, renderer);
  }

  public function new(stage : Stage, renderer : IRenderer) {
    var game = new Game(stage, renderer);
    game.start();
  }
}