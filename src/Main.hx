import breakin.Game;

import pixi.core.display.Container;
import pixi.core.renderers.Detector;
import pixi.core.renderers.SystemRenderer;

class Main {
  public static function main() {
    var options : RenderingOptions = {};
    options.antialias = true;
    options.resolution = 1;
    options.transparent = false;
    var stage = new Container();

    var renderer : SystemRenderer = Detector.autoDetectRenderer(Config.width, Config.height, options);
    js.Browser.document.body.appendChild(renderer.view);

    new Main(stage, renderer);
  }

  public function new(stage : Container, renderer : SystemRenderer) {
    var game = new Game(stage, renderer);
    game.start();
  }
}
