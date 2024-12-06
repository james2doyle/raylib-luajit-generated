return {
  defines = {
    {
      name = "CONFIG_H",
      type = "GUARD",
      value = "",
      description = ""
    },
    {
      name = "SUPPORT_MODULE_RSHAPES",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_MODULE_RTEXTURES",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_MODULE_RTEXT",
      type = "INT",
      value = 1,
      description = "WARNING: It requires SUPPORT_MODULE_RTEXTURES to load sprite font textures"
    },
    {
      name = "SUPPORT_MODULE_RMODELS",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_MODULE_RAUDIO",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_CAMERA_SYSTEM",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_GESTURES_SYSTEM",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_RPRAND_GENERATOR",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_MOUSE_GESTURES",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_SSH_KEYBOARD_RPI",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_WINMM_HIGHRES_TIMER",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_PARTIALBUSY_WAIT_LOOP",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_SCREEN_CAPTURE",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_GIF_RECORDING",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_COMPRESSION_API",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_AUTOMATION_EVENTS",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "MAX_FILEPATH_CAPACITY",
      type = "INT",
      value = 8192,
      description = "Maximum file paths capacity"
    },
    {
      name = "MAX_FILEPATH_LENGTH",
      type = "INT",
      value = 4096,
      description = "Maximum length for filepaths (Linux PATH_MAX default value)"
    },
    {
      name = "MAX_KEYBOARD_KEYS",
      type = "INT",
      value = 512,
      description = "Maximum number of keyboard keys supported"
    },
    {
      name = "MAX_MOUSE_BUTTONS",
      type = "INT",
      value = 8,
      description = "Maximum number of mouse buttons supported"
    },
    {
      name = "MAX_GAMEPADS",
      type = "INT",
      value = 4,
      description = "Maximum number of gamepads supported"
    },
    {
      name = "MAX_GAMEPAD_AXIS",
      type = "INT",
      value = 8,
      description = "Maximum number of axis supported (per gamepad)"
    },
    {
      name = "MAX_GAMEPAD_BUTTONS",
      type = "INT",
      value = 32,
      description = "Maximum number of buttons supported (per gamepad)"
    },
    {
      name = "MAX_GAMEPAD_VIBRATION_TIME",
      type = "FLOAT",
      value = 2.0,
      description = "Maximum vibration time in seconds"
    },
    {
      name = "MAX_TOUCH_POINTS",
      type = "INT",
      value = 8,
      description = "Maximum number of touch points supported"
    },
    {
      name = "MAX_KEY_PRESSED_QUEUE",
      type = "INT",
      value = 16,
      description = "Maximum number of keys in the key input queue"
    },
    {
      name = "MAX_CHAR_PRESSED_QUEUE",
      type = "INT",
      value = 16,
      description = "Maximum number of characters in the char input queue"
    },
    {
      name = "MAX_DECOMPRESSION_SIZE",
      type = "INT",
      value = 64,
      description = "Max size allocated for decompression in MB"
    },
    {
      name = "MAX_AUTOMATION_EVENTS",
      type = "INT",
      value = 16384,
      description = "Maximum number of automation events to record"
    },
    {
      name = "RL_SUPPORT_MESH_GPU_SKINNING",
      type = "INT",
      value = 1,
      description = "GPU skinning, comment if your GPU does not support more than 8 VBOs"
    },
    {
      name = "RL_DEFAULT_BATCH_BUFFERS",
      type = "INT",
      value = 1,
      description = "Default number of batch buffers (multi-buffering)"
    },
    {
      name = "RL_DEFAULT_BATCH_DRAWCALLS",
      type = "INT",
      value = 256,
      description = "Default number of batch draw calls (by state changes: mode, texture)"
    },
    {
      name = "RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS",
      type = "INT",
      value = 4,
      description = "Maximum number of textures units that can be activated on batch drawing (SetShaderValueTexture())"
    },
    {
      name = "RL_MAX_MATRIX_STACK_SIZE",
      type = "INT",
      value = 32,
      description = "Maximum size of internal Matrix stack"
    },
    {
      name = "RL_MAX_SHADER_LOCATIONS",
      type = "INT",
      value = 32,
      description = "Maximum number of shader locations supported"
    },
    {
      name = "RL_CULL_DISTANCE_NEAR",
      type = "DOUBLE",
      value = 0.01,
      description = "Default projection matrix near cull distance"
    },
    {
      name = "RL_CULL_DISTANCE_FAR",
      type = "DOUBLE",
      value = 1000.0,
      description = "Default projection matrix far cull distance"
    },
    {
      name = "RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION",
      type = "INT",
      value = 0,
      description = ""
    },
    {
      name = "RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL",
      type = "INT",
      value = 2,
      description = ""
    },
    {
      name = "RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR",
      type = "INT",
      value = 3,
      description = ""
    },
    {
      name = "RL_DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT",
      type = "INT",
      value = 4,
      description = ""
    },
    {
      name = "RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2",
      type = "INT",
      value = 5,
      description = ""
    },
    {
      name = "RL_DEFAULT_SHADER_ATTRIB_LOCATION_INDICES",
      type = "INT",
      value = 6,
      description = ""
    },
    {
      name = "RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEIDS",
      type = "INT",
      value = 7,
      description = ""
    },
    {
      name = "RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEWEIGHTS",
      type = "INT",
      value = 8,
      description = ""
    },
    {
      name = "RL_DEFAULT_SHADER_ATTRIB_NAME_POSITION",
      type = "STRING",
      value = "vertexPosition",
      description = "Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION"
    },
    {
      name = "RL_DEFAULT_SHADER_ATTRIB_NAME_TEXCOORD",
      type = "STRING",
      value = "vertexTexCoord",
      description = "Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD"
    },
    {
      name = "RL_DEFAULT_SHADER_ATTRIB_NAME_NORMAL",
      type = "STRING",
      value = "vertexNormal",
      description = "Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL"
    },
    {
      name = "RL_DEFAULT_SHADER_ATTRIB_NAME_COLOR",
      type = "STRING",
      value = "vertexColor",
      description = "Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR"
    },
    {
      name = "RL_DEFAULT_SHADER_ATTRIB_NAME_TANGENT",
      type = "STRING",
      value = "vertexTangent",
      description = "Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT"
    },
    {
      name = "RL_DEFAULT_SHADER_ATTRIB_NAME_TEXCOORD2",
      type = "STRING",
      value = "vertexTexCoord2",
      description = "Bound by default to shader location: RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2"
    },
    {
      name = "RL_DEFAULT_SHADER_UNIFORM_NAME_MVP",
      type = "STRING",
      value = "mvp",
      description = "model-view-projection matrix"
    },
    {
      name = "RL_DEFAULT_SHADER_UNIFORM_NAME_VIEW",
      type = "STRING",
      value = "matView",
      description = "view matrix"
    },
    {
      name = "RL_DEFAULT_SHADER_UNIFORM_NAME_PROJECTION",
      type = "STRING",
      value = "matProjection",
      description = "projection matrix"
    },
    {
      name = "RL_DEFAULT_SHADER_UNIFORM_NAME_MODEL",
      type = "STRING",
      value = "matModel",
      description = "model matrix"
    },
    {
      name = "RL_DEFAULT_SHADER_UNIFORM_NAME_NORMAL",
      type = "STRING",
      value = "matNormal",
      description = "normal matrix (transpose(inverse(matModelView))"
    },
    {
      name = "RL_DEFAULT_SHADER_UNIFORM_NAME_COLOR",
      type = "STRING",
      value = "colDiffuse",
      description = "color diffuse (base tint color, multiplied by texture color)"
    },
    {
      name = "RL_DEFAULT_SHADER_SAMPLER2D_NAME_TEXTURE0",
      type = "STRING",
      value = "texture0",
      description = "texture0 (texture slot active 0)"
    },
    {
      name = "RL_DEFAULT_SHADER_SAMPLER2D_NAME_TEXTURE1",
      type = "STRING",
      value = "texture1",
      description = "texture1 (texture slot active 1)"
    },
    {
      name = "RL_DEFAULT_SHADER_SAMPLER2D_NAME_TEXTURE2",
      type = "STRING",
      value = "texture2",
      description = "texture2 (texture slot active 2)"
    },
    {
      name = "SUPPORT_QUADS_DRAW_MODE",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SPLINE_SEGMENT_DIVISIONS",
      type = "INT",
      value = 24,
      description = "Spline segments subdivisions"
    },
    {
      name = "SUPPORT_FILEFORMAT_PNG",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_FILEFORMAT_GIF",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_FILEFORMAT_QOI",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_FILEFORMAT_DDS",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_IMAGE_EXPORT",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_IMAGE_GENERATION",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_IMAGE_MANIPULATION",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_DEFAULT_FONT",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_FILEFORMAT_TTF",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_FILEFORMAT_FNT",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_TEXT_MANIPULATION",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_FONT_ATLAS_WHITE_REC",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "MAX_TEXT_BUFFER_LENGTH",
      type = "INT",
      value = 1024,
      description = "Size of internal static buffers used on some functions:"
    },
    {
      name = "MAX_TEXTSPLIT_COUNT",
      type = "INT",
      value = 128,
      description = "Maximum number of substrings to split: TextSplit()"
    },
    {
      name = "SUPPORT_FILEFORMAT_OBJ",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_FILEFORMAT_MTL",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_FILEFORMAT_IQM",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_FILEFORMAT_GLTF",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_FILEFORMAT_VOX",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_FILEFORMAT_M3D",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_MESH_GENERATION",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "MAX_MATERIAL_MAPS",
      type = "INT",
      value = 12,
      description = "Maximum number of shader maps supported"
    },
    {
      name = "MAX_MESH_VERTEX_BUFFERS",
      type = "INT",
      value = 9,
      description = "Maximum vertex buffers (VBO) per mesh"
    },
    {
      name = "SUPPORT_FILEFORMAT_WAV",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_FILEFORMAT_OGG",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_FILEFORMAT_MP3",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_FILEFORMAT_QOA",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_FILEFORMAT_XM",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_FILEFORMAT_MOD",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "AUDIO_DEVICE_FORMAT",
      type = "UNKNOWN",
      value = "ma_format_f32",
      description = "Device output format (miniaudio: float-32bit)"
    },
    {
      name = "AUDIO_DEVICE_CHANNELS",
      type = "INT",
      value = 2,
      description = "Device output channels: stereo"
    },
    {
      name = "AUDIO_DEVICE_SAMPLE_RATE",
      type = "INT",
      value = 0,
      description = "Device sample rate (device default)"
    },
    {
      name = "MAX_AUDIO_BUFFER_POOL_CHANNELS",
      type = "INT",
      value = 16,
      description = "Maximum number of audio pool channels"
    },
    {
      name = "SUPPORT_STANDARD_FILEIO",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_TRACELOG",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "MAX_TRACELOG_MSG_LENGTH",
      type = "INT",
      value = 256,
      description = "Max length of one trace-log message"
    },
    {
      name = "SUPPORT_CLIPBOARD_IMAGE",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "STBI_REQUIRED",
      type = "GUARD",
      value = "",
      description = ""
    },
    {
      name = "SUPPORT_FILEFORMAT_BMP",
      type = "INT",
      value = 1,
      description = ""
    },
    {
      name = "SUPPORT_FILEFORMAT_JPG",
      type = "INT",
      value = 1,
      description = ""
    }
  },
  structs = {
  },
  aliases = {
  },
  enums = {
  },
  callbacks = {
  },
  functions = {
  }
}
