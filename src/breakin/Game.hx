package breakin;

import edge.World;
import edge.Engine;

import breakin.components.*;
import breakin.interaction.*;
import breakin.phys.*;
import breakin.render.*;

import pixi.display.Stage;
import pixi.renderers.IRenderer;

class Game {
  var world : World;
  var engine : Engine;
  var stage : Stage;
  public function new(stage : Stage, renderer : IRenderer) {
    this.stage = stage;

    world = new World(30);
    engine = world.engine;

    var ball = Structure.ball(Config.width / 2, Config.height / 4, 38);
    ball.body.velocity.setxy(200, 20);

    engine.create([ball, new Display("sprites/ball.png", 48, 48)]);
    engine.create([
        Structure.perimeter(0, 0, Config.width, Config.height, Config.wallSize)
      ]);

    // interaction
    world.physics.add(new KeyboardSystem());

    // physics
    world.physics.add(new PhysicsSpace());

    // rendering
    //world.render.add(new PixiStageUpdate(stage));
    world.render.add(new PixiDebugRenderer(stage));
    world.render.add(new PixiRenderer(stage, renderer));
  }

  public function start()
    world.start();
}