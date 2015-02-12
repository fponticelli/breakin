package breakin;

import edge.World;
import edge.Engine;

import breakin.components.*;
import breakin.interaction.*;
import breakin.phys.*;
import breakin.render.*;

import nape.phys.BodyType;

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

    var ball = Structure.ball(
      Config.width / 2,
      Config.height - Config.paddle.fromBottom - Config.paddle.height - Config.ball.radius,
      Config.ball.radius,
      Config.ball.material);

    engine.create([ball, new Display("sprites/ball.png", 48, 48)]);
    engine.create([
        Structure.perimeter(
          0,
          0,
          Config.width,
          Config.height,
          Config.wall.size,
          Config.wall.material)
      ]);

    var paddle = Structure.rect(
          -Config.paddle.width / 2,
          -Config.paddle.height,
           Config.paddle.width,
           Config.paddle.height,
           Config.paddle.material,
           BodyType.KINEMATIC
        );
    paddle.body.position.setxy(
      Config.width / 2,
      Config.height - Config.paddle.fromBottom
    );

    engine.create([paddle, new PaddleDirection(0, false)]);

    // interaction
    world.physics.add(new KeyboardSystem());

    // physics
    world.physics.add(new UpdatePaddleX(
        Config.paddle.maxVelocity
      ));
    world.physics.add(new UpdatePaddleY(
        Config.height - Config.paddle.fromBottom,
        Config.paddle.delta,
        Config.paddle.accelleration,
        Config.paddle.decelleration
      ));
    world.physics.add(new PhysicsSpace());
    world.physics.add(new ConstrainPaddle(
        Config.paddle.width / 2 + Config.wall.size,
        Config.width - Config.paddle.width / 2 - Config.wall.size
      ));

    // rendering
    //world.render.add(new PixiStageUpdate(stage));
    world.render.add(new PixiDebugRenderer(stage));
    world.render.add(new PixiRenderer(stage, renderer));
  }

  public function start()
    world.start();
}