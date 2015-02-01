package breakin;

import nape.space.Space;
import edge.World;
import openfl.display.Sprite;

import nape.phys.*;
import nape.geom.Vec2;

import breakin.components.*;
import breakin.phys.*;
import breakin.render.*;

class Game {
  var space : Space;
  var world : World;
  var container : Sprite;
  public function new(container : Sprite) {
    this.container = container;

    space = new Space(new Vec2(0, 0));
    world = new World(50);

    var wallsize = 10;

    var walls = [
        Body.rect(
          0,
          container.stage.stageHeight - wallsize,
          container.stage.stageWidth,
          wallsize,
          BodyType.STATIC
        ),
        Body.rect(
          0,
          0,
          container.stage.stageWidth,
          wallsize,
          BodyType.STATIC
        ),
        Body.rect(
          0,
          wallsize,
          wallsize,
          container.stage.stageHeight - wallsize * 2,
          BodyType.STATIC
        ),
        Body.rect(
          container.stage.stageWidth - wallsize,
          wallsize,
          wallsize,
          container.stage.stageHeight - wallsize * 2,
          BodyType.STATIC
        )
      ];

    var ball = Body.ball(10);

    ball.body.position.setxy(wallsize * 2, wallsize * 2);
    ball.body.velocity.setxy(50, 250);

    for(wall in walls)
      space.bodies.add(wall.body);

    space.bodies.add(ball.body);

    world.physics.add(new Physics(space));

    world.render.add(new DebugPhysicsRender(container, space));
  }

  public function start()
    world.start();
}