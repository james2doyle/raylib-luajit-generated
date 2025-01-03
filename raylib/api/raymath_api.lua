return {
  defines = {
    {
      name = "RAYMATH_H",
      type = "GUARD",
      value = "",
      description = ""
    },
    {
      name = "RMAPI",
      type = "UNKNOWN",
      value = "__declspec(dllexport) extern inline",
      description = "We are building raylib as a Win32 shared library (.dll)"
    },
    {
      name = "PI",
      type = "FLOAT",
      value = 3.14159265358979323846,
      description = ""
    },
    {
      name = "EPSILON",
      type = "FLOAT",
      value = 0.000001,
      description = ""
    },
    {
      name = "DEG2RAD",
      type = "FLOAT_MATH",
      value = "(PI/180.0f)",
      description = ""
    },
    {
      name = "RAD2DEG",
      type = "FLOAT_MATH",
      value = "(180.0f/PI)",
      description = ""
    },
    {
      name = "MatrixToFloat(mat)",
      type = "MACRO",
      value = "(MatrixToFloatV(mat).v)",
      description = ""
    },
    {
      name = "Vector3ToFloat(vec)",
      type = "MACRO",
      value = "(Vector3ToFloatV(vec).v)",
      description = ""
    },
    {
      name = "RL_VECTOR2_TYPE",
      type = "GUARD",
      value = "",
      description = ""
    },
    {
      name = "RL_VECTOR3_TYPE",
      type = "GUARD",
      value = "",
      description = ""
    },
    {
      name = "RL_VECTOR4_TYPE",
      type = "GUARD",
      value = "",
      description = ""
    },
    {
      name = "RL_QUATERNION_TYPE",
      type = "GUARD",
      value = "",
      description = ""
    },
    {
      name = "RL_MATRIX_TYPE",
      type = "GUARD",
      value = "",
      description = ""
    }
  },
  structs = {
    {
      name = "Vector2",
      description = "Vector2 type",
      fields = {
        {
          type = "float",
          name = "x",
          description = ""
        },
        {
          type = "float",
          name = "y",
          description = ""
        }
      }
    },
    {
      name = "Vector3",
      description = "Vector3 type",
      fields = {
        {
          type = "float",
          name = "x",
          description = ""
        },
        {
          type = "float",
          name = "y",
          description = ""
        },
        {
          type = "float",
          name = "z",
          description = ""
        }
      }
    },
    {
      name = "Vector4",
      description = "Vector4 type",
      fields = {
        {
          type = "float",
          name = "x",
          description = ""
        },
        {
          type = "float",
          name = "y",
          description = ""
        },
        {
          type = "float",
          name = "z",
          description = ""
        },
        {
          type = "float",
          name = "w",
          description = ""
        }
      }
    },
    {
      name = "Matrix",
      description = "Matrix type (OpenGL style 4x4 - right handed, column major)",
      fields = {
        {
          type = "float",
          name = "m0",
          description = "Matrix first row (4 components)"
        },
        {
          type = "float",
          name = "m4",
          description = "Matrix first row (4 components)"
        },
        {
          type = "float",
          name = "m8",
          description = "Matrix first row (4 components)"
        },
        {
          type = "float",
          name = "m12",
          description = "Matrix first row (4 components)"
        },
        {
          type = "float",
          name = "m1",
          description = "Matrix second row (4 components)"
        },
        {
          type = "float",
          name = "m5",
          description = "Matrix second row (4 components)"
        },
        {
          type = "float",
          name = "m9",
          description = "Matrix second row (4 components)"
        },
        {
          type = "float",
          name = "m13",
          description = "Matrix second row (4 components)"
        },
        {
          type = "float",
          name = "m2",
          description = "Matrix third row (4 components)"
        },
        {
          type = "float",
          name = "m6",
          description = "Matrix third row (4 components)"
        },
        {
          type = "float",
          name = "m10",
          description = "Matrix third row (4 components)"
        },
        {
          type = "float",
          name = "m14",
          description = "Matrix third row (4 components)"
        },
        {
          type = "float",
          name = "m3",
          description = "Matrix fourth row (4 components)"
        },
        {
          type = "float",
          name = "m7",
          description = "Matrix fourth row (4 components)"
        },
        {
          type = "float",
          name = "m11",
          description = "Matrix fourth row (4 components)"
        },
        {
          type = "float",
          name = "m15",
          description = "Matrix fourth row (4 components)"
        }
      }
    },
    {
      name = "float3",
      description = "NOTE: Helper types to be used instead of array return types for *ToFloat functions",
      fields = {
        {
          type = "float[3]",
          name = "v",
          description = ""
        }
      }
    },
    {
      name = "float16",
      description = "",
      fields = {
        {
          type = "float[16]",
          name = "v",
          description = ""
        }
      }
    }
  },
  aliases = {
    {
      type = "Vector4",
      name = "Quaternion",
      description = "Quaternion type"
    }
  },
  enums = {
  },
  callbacks = {
  },
  functions = {
  }
}
