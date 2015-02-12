package breakin.interaction;

import breakin.components.*;
import edge.cosystem.KeyboardInput;
import edge.ISystem;

class KeyboardSystem extends KeyboardInput implements ISystem {
  function update(direction : PaddleDirection) {
    for(k in keys) switch k.toString() {
      case "LEFT":
        direction.x -= 1;
      case "RIGHT":
        direction.x += 1;
      case "UP", "SPACE":
        direction.spring = true;
      case c:
        trace('not mapped: $c');
    }
  }
}