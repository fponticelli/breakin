package breakin.phys;

import edge.*;
import breaking.components.*;
import nape.space.Space;

class Physics implements ISystem {
  var timeDelta : Float;
  var space : Space;

  public function new(space : Space)
    this.space = space;

  public function update()
    space.step(timeDelta / 1000);
}