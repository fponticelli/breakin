import thx.color.Hsl;

import nape.phys.Material;

class Config {
  public static var backgroundColor = Hsl.create(0, 0.0, 0.98);
  public static var wallSize = 2;
  public static var width = 800;
  public static var height = 600;
  public static var paddle = {
    width : 100.0,
    height : 20.0,
    fromBottom : 20.0,
    delta : 30,
    maxVelocity: 1200, // px/sec
    accelleration : 4000,
    decelleration : 1000,
    material : new Material(0.8, 1.0, 1.4, 1.5, 0.01)
  };
  public static var ball = {
    radius : 8,
    spriteRadius : 10,
    material : new Material(0.7, 1.0, 1.4, 1.5, 0.01)
  };
  public static var wall = {
    size : 2,
    material : new Material(0.2, 1.0, 1.4, 1.5, 0.01)
  }
}

/*
Materials:
                     dynamic   static   density rolling
          elasticity friction  friction (g/p/p) friction
  default:    0.0,      1.0,     2.0,     1.0,    0.001
  wood:       0.4,      0.2,     0.38,    0.7,    0.005
  steel:      0.2,      0.57,    0.74,    7.8,    0.001
  ice:        0.3,      0.03,    0.1 ,    0.9,    0.0001
  rubber:     0.8,      1.0,     1.4,     1.5,    0.01
  glass:      0.4,      0.4,     0.94,    2.6,    0.002
  sand:      -1.0,      0.45,    0.6,     1.6,   16.0

  Elasticity of material.

  This property may take any value. Coeffecients of elasticity are combined
  by taking their average, and then clamping to the range [0,1]. In this way
  you may give very large values (even infinites) to this property to bias
  the result of combining elasticities.
  A combined, clamped value of 0 results in no bouncing whatsoever.
  A combine, clamped value of 1 results in complete elasticity where if
  possible, the objects will not lose any energy at all.

  Coeffecient of dynamic friction for material.
  This property may take any zero or positive value. Coeffecients of
  dynamicFriction are combined by taking the square root of their product.
  The higher this value the more quickly objects will slow down from speed
  when sliding.

  Coeffecient of static friction for material.
  This property may take any zero or positive value. Coeffecients of
  staticFriction are combined by taking the square root of their product.
  The higher this value the more quickly objects will come to rest once moving
  very slowly, and the harder it will be to cause the objcet to begin to slide.

  Density of Shape's using this Material.
  This property has units of g/pixel/pixel, not Kg/pixel/pixel for the
  simple reason that we get more reasonable values like 1 instead of 0.001
  to attain reasonable mass values for Bodys.

  Coeffecient of rolling friction for circle interactions.
  This property may take any zero or positive value. Coeffecients of
  staticFriction are combined by taking the square root of their product.
  The higher this value, the more quickly a rolling circle - which would
  otherwise roll forever ignoring drag and numerical issues - will come to
  rest.
*/
