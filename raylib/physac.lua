------------------------------------------------------------------------------------
-- Physac definitions
-- NOTE: These are manually converted from victorfisac/physac/Physac-587b63926010593eedf29ef74e3aa22c1a507925/src/physac.h
------------------------------------------------------------------------------------

local ffi = require("ffi")
local lib = ffi.load("libphysac")

return function(rl)
  -- Physac - Global gui state control functions

  --- Maximum number of physics bodies
  rl.PHYSAC_MAX_BODIES = 64

  --- Maximum number of collision manifolds
  rl.PHYSAC_MAX_MANIFOLDS = 4096

  --- Maximum number of vertices per polygon
  rl.PHYSAC_MAX_VERTICES = 24

  --- Number of vertices for a circle shape debug draw
  rl.PHYSAC_CIRCLE_VERTICES = 24

  --- Fixed delta time in seconds
  rl.PHYSAC_FIXED_TIME = 0.016666666666667

  --- Number of physics collision iterations
  rl.PHYSAC_COLLISION_ITERATIONS = 20

  --- Allowed penetration overlap
  rl.PHYSAC_PENETRATION_ALLOWANCE = 0.05

  --- Penetration correction percentage
  rl.PHYSAC_PENETRATION_CORRECTION = 0.4

  --- Pi constant
  rl.PHYSAC_PI = 3.1415926535898

  --- Degree to radians conversion factor
  rl.PHYSAC_DEG2RAD = (rl.PHYSAC_PI / 180)

  --- Circle shape type
  rl.PHYSICS_CIRCLE = 0

  --- Polygon shape type
  rl.PHYSICS_POLYGON = 1

  ---@class Mat2
  ---@field m00 number
  ---@field m01 number
  ---@field m10 number
  ---@field m11 number

  --- Matrix 2x2 type for rotations
  ---@param m00 number
  ---@param m01 number
  ---@param m10 number
  ---@param m11 number
  ---@return Mat2
  function rl.Mat2(m00, m01, m10, m11)
    return ffi.new("Mat2", m00, m01, m10, m11)
  end

  ---@class PolygonData
  ---@field vertexCount number
  ---@field positions Vector2[] {Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2}
  ---@field normals Vector2[] {Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2}

  --- Polygon shape data
  ---@param vertexCount number
  ---@param positions Vector2[] {Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2}
  ---@param normals Vector2[] {Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2, Vector2}
  ---@return PolygonData
  function rl.PolygonData(vertexCount, positions, normals)
    return ffi.new("PolygonData", vertexCount, positions, normals)
  end

  ---@class PhysicsShape
  ---@field type number
  ---@field body PhysicsBody
  ---@field radius number
  ---@field transform Mat2
  ---@field vertexData PolygonData

  --- Physics shape data
  ---@param type number
  ---@param body PhysicsBody
  ---@param radius number
  ---@param transform Mat2
  ---@param vertexData PolygonData
  ---@return PhysicsShape
  function rl.PhysicsShape(type, body, radius, transform, vertexData)
    return ffi.new("PhysicsShape", type, body, radius, transform, vertexData)
  end

  ---@class PhysicsBodyData
  ---@field id number
  ---@field enabled boolean
  ---@field position Vector2
  ---@field velocity Vector2
  ---@field force Vector2
  ---@field angularVelocity number
  ---@field torque number
  ---@field orient number
  ---@field inertia number
  ---@field inverseInertia number
  ---@field mass number
  ---@field inverseMass number
  ---@field staticFriction number
  ---@field dynamicFriction number
  ---@field restitution number
  ---@field useGravity boolean
  ---@field isGrounded boolean
  ---@field freezeOrient boolean
  ---@field shape PhysicsShape

  --- Physics body data structure
  ---@param id number
  ---@param enabled boolean
  ---@param position Vector2
  ---@param velocity Vector2
  ---@param force Vector2
  ---@param angularVelocity number
  ---@param torque number
  ---@param orient number
  ---@param inertia number
  ---@param inverseInertia number
  ---@param mass number
  ---@param inverseMass number
  ---@param staticFriction number
  ---@param dynamicFriction number
  ---@param restitution number
  ---@param useGravity boolean
  ---@param isGrounded boolean
  ---@param freezeOrient boolean
  ---@param shape PhysicsShape
  ---@return PhysicsBodyData
  function rl.PhysicsBodyData(
    id,
    enabled,
    position,
    velocity,
    force,
    angularVelocity,
    torque,
    orient,
    inertia,
    inverseInertia,
    mass,
    inverseMass,
    staticFriction,
    dynamicFriction,
    restitution,
    useGravity,
    isGrounded,
    freezeOrient,
    shape
  )
    return ffi.new(
      "PhysicsBodyData",
      id,
      enabled,
      position,
      velocity,
      force,
      angularVelocity,
      torque,
      orient,
      inertia,
      inverseInertia,
      mass,
      inverseMass,
      staticFriction,
      dynamicFriction,
      restitution,
      useGravity,
      isGrounded,
      freezeOrient,
      shape
    )
  end

  ---@alias Quaternion Vector4
  ---@alias Texture2D Texture
  ---@alias TextureCubemap Texture
  ---@alias RenderTexture2D RenderTexture
  ---@alias Camera Camera3D

  ---@alias Quaternion Vector4

  ---@alias PhysicsBody PhysicsBodyData *

  --- Initializes physics values, pointers and creates physics loop thread
  ---@return void
  function rl.InitPhysics()
    return lib.InitPhysics()
  end

  --- Run physics step, to be used if PHYSICS_NO_THREADS is set in your main loop
  ---@return void
  function rl.RunPhysicsStep()
    return lib.RunPhysicsStep()
  end

  --- Alias of RunPhysicsStep
  ---@return void
  function rl.UpdatePhysics()
    -- try to call the raysan5 functions first
    local status = pcall(lib, "UpdatePhysics")
    if status == false then
      return lib.RunPhysicsStep()
    end
  end

  --- Destroys all the physics bodies and manifolds and restarts
  ---@return void
  function rl.ResetPhysics()
    -- try to call the raysan5 functions first
    local status = pcall(lib, "ResetPhysics")
    if status == false then
      lib.ClosePhysics()
      return lib.InitPhysics()
    end
  end

  --- Sets physics fixed time step in milliseconds. 1.666666 by default
  ---@param delta number
  ---@return void
  function rl.SetPhysicsTimeStep(delta)
    return lib.SetPhysicsTimeStep(delta)
  end

  --- Returns true if physics thread is currently enabled
  ---@return boolean
  function rl.IsPhysicsEnabled()
    return lib.IsPhysicsEnabled()
  end

  --- Sets physics global gravity force
  ---@param x number
  ---@param y number
  ---@return void
  function rl.SetPhysicsGravity(x, y)
    return lib.SetPhysicsGravity(x, y)
  end

  --- Creates a new circle physics body with generic parameters
  ---@param pos Vector2
  ---@param radius number
  ---@param density number
  ---@return PhysicsBody
  function rl.CreatePhysicsBodyCircle(pos, radius, density)
    return lib.CreatePhysicsBodyCircle(pos, radius, density)
  end

  --- Creates a new rectangle physics body with generic parameters
  ---@param pos Vector2
  ---@param width number
  ---@param height number
  ---@param density number
  ---@return PhysicsBody
  function rl.CreatePhysicsBodyRectangle(pos, width, height, density)
    return lib.CreatePhysicsBodyRectangle(pos, width, height, density)
  end

  --- Creates a new polygon physics body with generic parameters
  ---@param pos Vector2
  ---@param radius number
  ---@param sides number
  ---@param density number
  ---@return PhysicsBody
  function rl.CreatePhysicsBodyPolygon(pos, radius, sides, density)
    return lib.CreatePhysicsBodyPolygon(pos, radius, sides, density)
  end

  --- Adds a force to a physics body
  ---@param body PhysicsBody
  ---@param force Vector2
  ---@return void
  function rl.PhysicsAddForce(body, force)
    return lib.PhysicsAddForce(body, force)
  end

  --- Adds an angular force to a physics body
  ---@param body PhysicsBody
  ---@param amount number
  ---@return void
  function rl.PhysicsAddTorque(body, amount)
    return lib.PhysicsAddTorque(body, amount)
  end

  --- Shatters a polygon shape physics body to little physics bodies with explosion force
  ---@param body PhysicsBody
  ---@param position Vector2
  ---@param force number
  ---@return void
  function rl.PhysicsShatter(body, position, force)
    return lib.PhysicsShatter(body, position, force)
  end

  --- Returns the current amount of created physics bodies
  ---@return number
  function rl.GetPhysicsBodiesCount()
    return lib.GetPhysicsBodiesCount()
  end

  --- Returns a physics body of the bodies pool at a specific index
  ---@param index number
  ---@return PhysicsBody|nil
  function rl.GetPhysicsBody(index)
    return lib.GetPhysicsBody(index)
  end

  --- Returns the physics body shape type (PHYSICS_CIRCLE or PHYSICS_POLYGON)
  ---@param index number
  ---@return number
  function rl.GetPhysicsShapeType(index)
    return lib.GetPhysicsShapeType(index)
  end

  --- Returns the amount of vertices of a physics body shape
  ---@param index number
  ---@return number
  function rl.GetPhysicsShapeVerticesCount(index)
    return lib.GetPhysicsShapeVerticesCount(index)
  end

  --- Returns transformed position of a body shape (body position + vertex transformed position)
  ---@param body PhysicsBody
  ---@param vertex number
  ---@return Vector2
  function rl.GetPhysicsShapeVertex(body, vertex)
    return lib.GetPhysicsShapeVertex(body, vertex)
  end

  --- Sets physics body shape transform based on radians parameter
  ---@param body PhysicsBody
  ---@param radians number
  ---@return void
  function rl.SetPhysicsBodyRotation(body, radians)
    return lib.SetPhysicsBodyRotation(body, radians)
  end

  --- Unitializes and destroy a physics body
  ---@param body PhysicsBody
  ---@return void
  function rl.DestroyPhysicsBody(body)
    return lib.DestroyPhysicsBody(body)
  end

  --- Unitializes physics pointers and closes physics loop thread
  ---@return void
  function rl.ClosePhysics()
    return lib.ClosePhysics()
  end

  return rl
end
