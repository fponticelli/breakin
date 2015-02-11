package breakin.phys;

import edge.*;
import breakin.components.*;
import nape.space.Space;
import nape.phys.*;
import nape.geom.Vec2;

class PhysicsSpace implements ISystem {
  var timeDelta : Float;
  var space : Space;

  var bodies : View<{ structure : Structure }>;

  public function new()
    this.space = new Space(Vec2.weak(0, 600));

  public function bodiesAdded(entity : Entity, data : { structure : Structure })
    space.bodies.add(data.structure.body);

  public function bodiesRemoved(entity : Entity, data : { structure : Structure })
    space.bodies.remove(data.structure.body);

  public function update()
    space.step(timeDelta / 1000);
}