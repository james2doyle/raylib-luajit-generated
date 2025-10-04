-- victorfisac/physac/Physac-587b63926010593eedf29ef74e3aa22c1a507925/src/physac.h
return {
  defines = {
    -- Constants
    { name = "PHYSAC_MAX_BODIES", type = "INT", value = 64, description = "Maximum number of physics bodies" },
    { name = "PHYSAC_MAX_MANIFOLDS", type = "INT", value = 4096, description = "Maximum number of collision manifolds" },
    { name = "PHYSAC_MAX_VERTICES", type = "INT", value = 24, description = "Maximum number of vertices per polygon" },
    { name = "PHYSAC_CIRCLE_VERTICES", type = "INT", value = 24, description = "Number of vertices for a circle shape debug draw" },
    { name = "PHYSAC_FIXED_TIME", type = "FLOAT", value = 1.0/60.0, description = "Fixed delta time in seconds" },
    { name = "PHYSAC_COLLISION_ITERATIONS", type = "INT", value = 20, description = "Number of physics collision iterations" },
    { name = "PHYSAC_PENETRATION_ALLOWANCE", type = "FLOAT", value = 0.05, description = "Allowed penetration overlap" },
    { name = "PHYSAC_PENETRATION_CORRECTION", type = "FLOAT", value = 0.4, description = "Penetration correction percentage" },
    { name = "PHYSAC_PI", type = "FLOAT", value = 3.14159265358979323846, description = "Pi constant" },
    { name = "PHYSAC_DEG2RAD", type = "FLOAT_MATH", value = "(PHYSAC_PI/180.0f)", description = "Degree to radians conversion factor" },
  },
  structs = {
    {
      name = "Mat2",
      description = "Matrix 2x2 type for rotations",
      fields = {
        { type = "float", name = "m00", description = "" },
        { type = "float", name = "m01", description = "" },
        { type = "float", name = "m10", description = "" },
        { type = "float", name = "m11", description = "" },
      }
    },
    {
      name = "PolygonData",
      description = "Polygon shape data",
      fields = {
        { type = "unsigned int", name = "vertexCount", description = "Current used vertex and normals count" },
        { type = "Vector2[24]", name = "positions", description = "Polygon vertex positions vectors" },
        { type = "Vector2[24]", name = "normals", description = "Polygon vertex normals vectors" },
      }
    },
    {
      name = "PhysicsShape",
      description = "Physics shape data",
      fields = {
        { type = "int", name = "type", description = "Physics shape type (PHYSICS_CIRCLE or PHYSICS_POLYGON)" },
        { type = "PhysicsBody *", name = "body", description = "Shape physics body reference" },
        { type = "float", name = "radius", description = "Circle shape radius (used for circle shapes)" },
        { type = "Mat2", name = "transform", description = "Vertices transform matrix 2x2" },
        { type = "PolygonData", name = "vertexData", description = "Polygon shape vertices position and normals data" },
      }
    },
    {
      name = "PhysicsBodyData",
      description = "Physics body data structure",
      fields = {
        { type = "unsigned int", name = "id", description = "Reference unique identifier" },
        { type = "bool", name = "enabled", description = "Enabled dynamics state" },
        { type = "Vector2", name = "position", description = "Physics body shape pivot" },
        { type = "Vector2", name = "velocity", description = "Current linear velocity" },
        { type = "Vector2", name = "force", description = "Current linear force (reset to 0 every step)" },
        { type = "float", name = "angularVelocity", description = "Current angular velocity" },
        { type = "float", name = "torque", description = "Current angular force (reset to 0 every step)" },
        { type = "float", name = "orient", description = "Rotation in radians" },
        { type = "float", name = "inertia", description = "Moment of inertia" },
        { type = "float", name = "inverseInertia", description = "Inverse value of inertia" },
        { type = "float", name = "mass", description = "Physics body mass" },
        { type = "float", name = "inverseMass", description = "Inverse value of mass" },
        { type = "float", name = "staticFriction", description = "Friction when the body has no movement" },
        { type = "float", name = "dynamicFriction", description = "Friction when the body has movement" },
        { type = "float", name = "restitution", description = "Restitution coefficient" },
        { type = "bool", name = "useGravity", description = "Apply gravity force to dynamics" },
        { type = "bool", name = "isGrounded", description = "Physics grounded on other body state" },
        { type = "bool", name = "freezeOrient", description = "Physics rotation constraint" },
        { type = "PhysicsShape", name = "shape", description = "Physics body shape information" },
      }
    },
  },
  aliases = {
    { type = "PhysicsBodyData *", name = "PhysicsBody", description = "Physics body data pointer" },
  },
  enums = {
    {
      name = "PhysicsShapeType",
      description = "Physics shape types",
      values = {
        { name = "PHYSICS_CIRCLE", value = 0, description = "Circle shape type" },
        { name = "PHYSICS_POLYGON", value = 1, description = "Polygon shape type" },
      }
    },
  },
  functions = {
    { name = "InitPhysics", description = "Initializes physics values, pointers and creates physics loop thread", returnType = "void", params = {} },
    { name = "RunPhysicsStep", description = "Run physics step, to be used if PHYSICS_NO_THREADS is set in your main loop", returnType = "void", params = {} },
    { name = "SetPhysicsTimeStep", description = "Sets physics fixed time step in milliseconds. 1.666666 by default", returnType = "void", params = { { type = "double", name = "delta" } } },
    { name = "IsPhysicsEnabled", description = "Returns true if physics thread is currently enabled", returnType = "bool", params = {} },
    { name = "SetPhysicsGravity", description = "Sets physics global gravity force", returnType = "void", params = { { type = "float", name = "x" }, { type = "float", name = "y" } } },
    { name = "CreatePhysicsBodyCircle", description = "Creates a new circle physics body with generic parameters", returnType = "PhysicsBody", params = { { type = "Vector2", name = "pos" }, { type = "float", name = "radius" }, { type = "float", name = "density" } } },
    { name = "CreatePhysicsBodyRectangle", description = "Creates a new rectangle physics body with generic parameters", returnType = "PhysicsBody", params = { { type = "Vector2", name = "pos" }, { type = "float", name = "width" }, { type = "float", name = "height" }, { type = "float", name = "density" } } },
    { name = "CreatePhysicsBodyPolygon", description = "Creates a new polygon physics body with generic parameters", returnType = "PhysicsBody", params = { { type = "Vector2", name = "pos" }, { type = "float", name = "radius" }, { type = "int", name = "sides" }, { type = "float", name = "density" } } },
    { name = "PhysicsAddForce", description = "Adds a force to a physics body", returnType = "void", params = { { type = "PhysicsBody", name = "body" }, { type = "Vector2", name = "force" } } },
    { name = "PhysicsAddTorque", description = "Adds an angular force to a physics body", returnType = "void", params = { { type = "PhysicsBody", name = "body" }, { type = "float", name = "amount" } } },
    { name = "PhysicsShatter", description = "Shatters a polygon shape physics body to little physics bodies with explosion force", returnType = "void", params = { { type = "PhysicsBody", name = "body" }, { type = "Vector2", name = "position" }, { type = "float", name = "force" } } },
    { name = "GetPhysicsBodiesCount", description = "Returns the current amount of created physics bodies", returnType = "int", params = {} },
    { name = "GetPhysicsBody", description = "Returns a physics body of the bodies pool at a specific index", returnType = "PhysicsBody", params = { { type = "int", name = "index" } } },
    { name = "GetPhysicsShapeType", description = "Returns the physics body shape type (PHYSICS_CIRCLE or PHYSICS_POLYGON)", returnType = "int", params = { { type = "int", name = "index" } } },
    { name = "GetPhysicsShapeVerticesCount", description = "Returns the amount of vertices of a physics body shape", returnType = "int", params = { { type = "int", name = "index" } } },
    { name = "GetPhysicsShapeVertex", description = "Returns transformed position of a body shape (body position + vertex transformed position)", returnType = "Vector2", params = { { type = "PhysicsBody", name = "body" }, { type = "int", name = "vertex" } } },
    { name = "SetPhysicsBodyRotation", description = "Sets physics body shape transform based on radians parameter", returnType = "void", params = { { type = "PhysicsBody", name = "body" }, { type = "float", name = "radians" } } },
    { name = "DestroyPhysicsBody", description = "Unitializes and destroy a physics body", returnType = "void", params = { { type = "PhysicsBody", name = "body" } } },
    { name = "ClosePhysics", description = "Unitializes physics pointers and closes physics loop thread", returnType = "void", params = {} },
  },
}