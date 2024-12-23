--- copied and modified from ReiLua_API
---@see https://github.com/nullstare/ReiLua

return function(rl)
  -- Gui - Global gui state control functions

  rl.RAYGUI_VERSION_MAJOR = 4

  rl.RAYGUI_VERSION_MINOR = 0

  rl.RAYGUI_VERSION_PATCH = 0

  rl.RAYGUI_VERSION = "4.0"

  rl.SCROLLBAR_LEFT_SIDE = 0

  rl.SCROLLBAR_RIGHT_SIDE = 1

  --- Size of icons in pixels (squared)
  rl.RAYGUI_ICON_SIZE = 16

  --- Maximum number of icons
  rl.RAYGUI_ICON_MAX_ICONS = 256

  --- Maximum length of icon name id
  rl.RAYGUI_ICON_MAX_NAME_LENGTH = 32

  rl.RAYGUI_ICON_DATA_ELEMENTS = (rl.RAYGUI_ICON_SIZE * rl.RAYGUI_ICON_SIZE / 32)

  --- Maximum number of controls
  rl.RAYGUI_MAX_CONTROLS = 16

  --- Maximum number of base properties
  rl.RAYGUI_MAX_PROPS_BASE = 16

  --- Maximum number of extended properties
  rl.RAYGUI_MAX_PROPS_EXTENDED = 8

  rl.KEY_RIGHT = 262

  rl.KEY_LEFT = 263

  rl.KEY_DOWN = 264

  rl.KEY_UP = 265

  rl.KEY_BACKSPACE = 259

  rl.KEY_ENTER = 257

  rl.MOUSE_LEFT_BUTTON = 0

  rl.RAYGUI_WINDOWBOX_STATUSBAR_HEIGHT = 24

  rl.RAYGUI_GROUPBOX_LINE_THICK = 1

  rl.RAYGUI_LINE_MARGIN_TEXT = 12

  rl.RAYGUI_LINE_TEXT_PADDING = 4

  rl.RAYGUI_PANEL_BORDER_WIDTH = 1

  rl.RAYGUI_TABBAR_ITEM_WIDTH = 160

  rl.RAYGUI_MIN_SCROLLBAR_WIDTH = 40

  rl.RAYGUI_MIN_SCROLLBAR_HEIGHT = 40

  rl.RAYGUI_TOGGLEGROUP_MAX_ITEMS = 32

  --- Frames to wait for autocursor movement
  rl.RAYGUI_TEXTBOX_AUTO_CURSOR_COOLDOWN = 40

  --- Frames delay for autocursor movement
  rl.RAYGUI_TEXTBOX_AUTO_CURSOR_DELAY = 1

  rl.RAYGUI_VALUEBOX_MAX_CHARS = 32

  rl.RAYGUI_COLORBARALPHA_CHECKED_SIZE = 10

  rl.RAYGUI_MESSAGEBOX_BUTTON_HEIGHT = 24

  rl.RAYGUI_MESSAGEBOX_BUTTON_PADDING = 12

  rl.RAYGUI_TEXTINPUTBOX_BUTTON_HEIGHT = 24

  rl.RAYGUI_TEXTINPUTBOX_BUTTON_PADDING = 12

  rl.RAYGUI_TEXTINPUTBOX_HEIGHT = 26

  rl.RAYGUI_GRID_ALPHA = 0.15

  rl.MAX_LINE_BUFFER_SIZE = 256

  rl.ICON_TEXT_PADDING = 4

  rl.RAYGUI_MAX_TEXT_LINES = 128

  rl.RAYGUI_TEXTSPLIT_MAX_ITEMS = 128

  rl.RAYGUI_TEXTSPLIT_MAX_TEXT_SIZE = 1024

  rl.RAYGUI_TEXTFORMAT_MAX_SIZE = 256

  ---
  rl.STATE_NORMAL = 0

  ---
  rl.STATE_FOCUSED = 1

  ---
  rl.STATE_PRESSED = 2

  ---
  rl.STATE_DISABLED = 3

  ---
  rl.TEXT_ALIGN_LEFT = 0

  ---
  rl.TEXT_ALIGN_CENTER = 1

  ---
  rl.TEXT_ALIGN_RIGHT = 2

  ---
  rl.TEXT_ALIGN_TOP = 0

  ---
  rl.TEXT_ALIGN_MIDDLE = 1

  ---
  rl.TEXT_ALIGN_BOTTOM = 2

  ---
  rl.TEXT_WRAP_NONE = 0

  ---
  rl.TEXT_WRAP_CHAR = 1

  ---
  rl.TEXT_WRAP_WORD = 2

  ---
  rl.DEFAULT = 0

  --- Used also for: LABELBUTTON
  rl.LABEL = 1

  ---
  rl.BUTTON = 2

  --- Used also for: TOGGLEGROUP
  rl.TOGGLE = 3

  --- Used also for: SLIDERBAR, TOGGLESLIDER
  rl.SLIDER = 4

  ---
  rl.PROGRESSBAR = 5

  ---
  rl.CHECKBOX = 6

  ---
  rl.COMBOBOX = 7

  ---
  rl.DROPDOWNBOX = 8

  --- Used also for: TEXTBOXMULTI
  rl.TEXTBOX = 9

  ---
  rl.VALUEBOX = 10

  --- Uses: BUTTON, VALUEBOX
  rl.SPINNER = 11

  ---
  rl.LISTVIEW = 12

  ---
  rl.COLORPICKER = 13

  ---
  rl.SCROLLBAR = 14

  ---
  rl.STATUSBAR = 15

  --- Control border color in STATE_NORMAL
  rl.BORDER_COLOR_NORMAL = 0

  --- Control base color in STATE_NORMAL
  rl.BASE_COLOR_NORMAL = 1

  --- Control text color in STATE_NORMAL
  rl.TEXT_COLOR_NORMAL = 2

  --- Control border color in STATE_FOCUSED
  rl.BORDER_COLOR_FOCUSED = 3

  --- Control base color in STATE_FOCUSED
  rl.BASE_COLOR_FOCUSED = 4

  --- Control text color in STATE_FOCUSED
  rl.TEXT_COLOR_FOCUSED = 5

  --- Control border color in STATE_PRESSED
  rl.BORDER_COLOR_PRESSED = 6

  --- Control base color in STATE_PRESSED
  rl.BASE_COLOR_PRESSED = 7

  --- Control text color in STATE_PRESSED
  rl.TEXT_COLOR_PRESSED = 8

  --- Control border color in STATE_DISABLED
  rl.BORDER_COLOR_DISABLED = 9

  --- Control base color in STATE_DISABLED
  rl.BASE_COLOR_DISABLED = 10

  --- Control text color in STATE_DISABLED
  rl.TEXT_COLOR_DISABLED = 11

  --- Control border size, 0 for no border
  rl.BORDER_WIDTH = 12

  --- Control text padding, not considering border
  rl.TEXT_PADDING = 13

  --- Control text horizontal alignment inside control text bound (after border and padding)
  rl.TEXT_ALIGNMENT = 14

  --- Text size (glyphs max height)
  rl.TEXT_SIZE = 16

  --- Text spacing between glyphs
  rl.TEXT_SPACING = 17

  --- Line control color
  rl.LINE_COLOR = 18

  --- Background color
  rl.BACKGROUND_COLOR = 19

  --- Text spacing between lines
  rl.TEXT_LINE_SPACING = 20

  --- Text vertical alignment inside text bounds (after border and padding)
  rl.TEXT_ALIGNMENT_VERTICAL = 21

  --- Text wrap-mode inside text bounds
  rl.TEXT_WRAP_MODE = 22

  --- ToggleGroup separation between toggles
  rl.GROUP_PADDING = 16

  --- Slider size of internal bar
  rl.SLIDER_WIDTH = 16

  --- Slider/SliderBar internal bar padding
  rl.SLIDER_PADDING = 17

  --- ProgressBar internal padding
  rl.PROGRESS_PADDING = 16

  --- ScrollBar arrows size
  rl.ARROWS_SIZE = 16

  --- ScrollBar arrows visible
  rl.ARROWS_VISIBLE = 17

  --- ScrollBar slider internal padding
  rl.SCROLL_SLIDER_PADDING = 18

  --- ScrollBar slider size
  rl.SCROLL_SLIDER_SIZE = 19

  --- ScrollBar scroll padding from arrows
  rl.SCROLL_PADDING = 20

  --- ScrollBar scrolling speed
  rl.SCROLL_SPEED = 21

  --- CheckBox internal check padding
  rl.CHECK_PADDING = 16

  --- ComboBox right button width
  rl.COMBO_BUTTON_WIDTH = 16

  --- ComboBox button separation
  rl.COMBO_BUTTON_SPACING = 17

  --- DropdownBox arrow separation from border and items
  rl.ARROW_PADDING = 16

  --- DropdownBox items separation
  rl.DROPDOWN_ITEMS_SPACING = 17

  --- TextBox in read-only mode: 0-text editable, 1-text no-editable
  rl.TEXT_READONLY = 16

  --- Spinner left/right buttons width
  rl.SPIN_BUTTON_WIDTH = 16

  --- Spinner buttons separation
  rl.SPIN_BUTTON_SPACING = 17

  --- ListView items height
  rl.LIST_ITEMS_HEIGHT = 16

  --- ListView items separation
  rl.LIST_ITEMS_SPACING = 17

  --- ListView scrollbar size (usually width)
  rl.SCROLLBAR_WIDTH = 18

  --- ListView scrollbar side (0-SCROLLBAR_LEFT_SIDE, 1-SCROLLBAR_RIGHT_SIDE)
  rl.SCROLLBAR_SIDE = 19

  ---
  rl.COLOR_SELECTOR_SIZE = 16

  --- ColorPicker right hue bar width
  rl.HUEBAR_WIDTH = 17

  --- ColorPicker right hue bar separation from panel
  rl.HUEBAR_PADDING = 18

  --- ColorPicker right hue bar selector height
  rl.HUEBAR_SELECTOR_HEIGHT = 19

  --- ColorPicker right hue bar selector overflow
  rl.HUEBAR_SELECTOR_OVERFLOW = 20

  ---
  rl.ICON_NONE = 0

  ---
  rl.ICON_FOLDER_FILE_OPEN = 1

  ---
  rl.ICON_FILE_SAVE_CLASSIC = 2

  ---
  rl.ICON_FOLDER_OPEN = 3

  ---
  rl.ICON_FOLDER_SAVE = 4

  ---
  rl.ICON_FILE_OPEN = 5

  ---
  rl.ICON_FILE_SAVE = 6

  ---
  rl.ICON_FILE_EXPORT = 7

  ---
  rl.ICON_FILE_ADD = 8

  ---
  rl.ICON_FILE_DELETE = 9

  ---
  rl.ICON_FILETYPE_TEXT = 10

  ---
  rl.ICON_FILETYPE_AUDIO = 11

  ---
  rl.ICON_FILETYPE_IMAGE = 12

  ---
  rl.ICON_FILETYPE_PLAY = 13

  ---
  rl.ICON_FILETYPE_VIDEO = 14

  ---
  rl.ICON_FILETYPE_INFO = 15

  ---
  rl.ICON_FILE_COPY = 16

  ---
  rl.ICON_FILE_CUT = 17

  ---
  rl.ICON_FILE_PASTE = 18

  ---
  rl.ICON_CURSOR_HAND = 19

  ---
  rl.ICON_CURSOR_POINTER = 20

  ---
  rl.ICON_CURSOR_CLASSIC = 21

  ---
  rl.ICON_PENCIL = 22

  ---
  rl.ICON_PENCIL_BIG = 23

  ---
  rl.ICON_BRUSH_CLASSIC = 24

  ---
  rl.ICON_BRUSH_PAINTER = 25

  ---
  rl.ICON_WATER_DROP = 26

  ---
  rl.ICON_COLOR_PICKER = 27

  ---
  rl.ICON_RUBBER = 28

  ---
  rl.ICON_COLOR_BUCKET = 29

  ---
  rl.ICON_TEXT_T = 30

  ---
  rl.ICON_TEXT_A = 31

  ---
  rl.ICON_SCALE = 32

  ---
  rl.ICON_RESIZE = 33

  ---
  rl.ICON_FILTER_POINT = 34

  ---
  rl.ICON_FILTER_BILINEAR = 35

  ---
  rl.ICON_CROP = 36

  ---
  rl.ICON_CROP_ALPHA = 37

  ---
  rl.ICON_SQUARE_TOGGLE = 38

  ---
  rl.ICON_SYMMETRY = 39

  ---
  rl.ICON_SYMMETRY_HORIZONTAL = 40

  ---
  rl.ICON_SYMMETRY_VERTICAL = 41

  ---
  rl.ICON_LENS = 42

  ---
  rl.ICON_LENS_BIG = 43

  ---
  rl.ICON_EYE_ON = 44

  ---
  rl.ICON_EYE_OFF = 45

  ---
  rl.ICON_FILTER_TOP = 46

  ---
  rl.ICON_FILTER = 47

  ---
  rl.ICON_TARGET_POINT = 48

  ---
  rl.ICON_TARGET_SMALL = 49

  ---
  rl.ICON_TARGET_BIG = 50

  ---
  rl.ICON_TARGET_MOVE = 51

  ---
  rl.ICON_CURSOR_MOVE = 52

  ---
  rl.ICON_CURSOR_SCALE = 53

  ---
  rl.ICON_CURSOR_SCALE_RIGHT = 54

  ---
  rl.ICON_CURSOR_SCALE_LEFT = 55

  ---
  rl.ICON_UNDO = 56

  ---
  rl.ICON_REDO = 57

  ---
  rl.ICON_REREDO = 58

  ---
  rl.ICON_MUTATE = 59

  ---
  rl.ICON_ROTATE = 60

  ---
  rl.ICON_REPEAT = 61

  ---
  rl.ICON_SHUFFLE = 62

  ---
  rl.ICON_EMPTYBOX = 63

  ---
  rl.ICON_TARGET = 64

  ---
  rl.ICON_TARGET_SMALL_FILL = 65

  ---
  rl.ICON_TARGET_BIG_FILL = 66

  ---
  rl.ICON_TARGET_MOVE_FILL = 67

  ---
  rl.ICON_CURSOR_MOVE_FILL = 68

  ---
  rl.ICON_CURSOR_SCALE_FILL = 69

  ---
  rl.ICON_CURSOR_SCALE_RIGHT_FILL = 70

  ---
  rl.ICON_CURSOR_SCALE_LEFT_FILL = 71

  ---
  rl.ICON_UNDO_FILL = 72

  ---
  rl.ICON_REDO_FILL = 73

  ---
  rl.ICON_REREDO_FILL = 74

  ---
  rl.ICON_MUTATE_FILL = 75

  ---
  rl.ICON_ROTATE_FILL = 76

  ---
  rl.ICON_REPEAT_FILL = 77

  ---
  rl.ICON_SHUFFLE_FILL = 78

  ---
  rl.ICON_EMPTYBOX_SMALL = 79

  ---
  rl.ICON_BOX = 80

  ---
  rl.ICON_BOX_TOP = 81

  ---
  rl.ICON_BOX_TOP_RIGHT = 82

  ---
  rl.ICON_BOX_RIGHT = 83

  ---
  rl.ICON_BOX_BOTTOM_RIGHT = 84

  ---
  rl.ICON_BOX_BOTTOM = 85

  ---
  rl.ICON_BOX_BOTTOM_LEFT = 86

  ---
  rl.ICON_BOX_LEFT = 87

  ---
  rl.ICON_BOX_TOP_LEFT = 88

  ---
  rl.ICON_BOX_CENTER = 89

  ---
  rl.ICON_BOX_CIRCLE_MASK = 90

  ---
  rl.ICON_POT = 91

  ---
  rl.ICON_ALPHA_MULTIPLY = 92

  ---
  rl.ICON_ALPHA_CLEAR = 93

  ---
  rl.ICON_DITHERING = 94

  ---
  rl.ICON_MIPMAPS = 95

  ---
  rl.ICON_BOX_GRID = 96

  ---
  rl.ICON_GRID = 97

  ---
  rl.ICON_BOX_CORNERS_SMALL = 98

  ---
  rl.ICON_BOX_CORNERS_BIG = 99

  ---
  rl.ICON_FOUR_BOXES = 100

  ---
  rl.ICON_GRID_FILL = 101

  ---
  rl.ICON_BOX_MULTISIZE = 102

  ---
  rl.ICON_ZOOM_SMALL = 103

  ---
  rl.ICON_ZOOM_MEDIUM = 104

  ---
  rl.ICON_ZOOM_BIG = 105

  ---
  rl.ICON_ZOOM_ALL = 106

  ---
  rl.ICON_ZOOM_CENTER = 107

  ---
  rl.ICON_BOX_DOTS_SMALL = 108

  ---
  rl.ICON_BOX_DOTS_BIG = 109

  ---
  rl.ICON_BOX_CONCENTRIC = 110

  ---
  rl.ICON_BOX_GRID_BIG = 111

  ---
  rl.ICON_OK_TICK = 112

  ---
  rl.ICON_CROSS = 113

  ---
  rl.ICON_ARROW_LEFT = 114

  ---
  rl.ICON_ARROW_RIGHT = 115

  ---
  rl.ICON_ARROW_DOWN = 116

  ---
  rl.ICON_ARROW_UP = 117

  ---
  rl.ICON_ARROW_LEFT_FILL = 118

  ---
  rl.ICON_ARROW_RIGHT_FILL = 119

  ---
  rl.ICON_ARROW_DOWN_FILL = 120

  ---
  rl.ICON_ARROW_UP_FILL = 121

  ---
  rl.ICON_AUDIO = 122

  ---
  rl.ICON_FX = 123

  ---
  rl.ICON_WAVE = 124

  ---
  rl.ICON_WAVE_SINUS = 125

  ---
  rl.ICON_WAVE_SQUARE = 126

  ---
  rl.ICON_WAVE_TRIANGULAR = 127

  ---
  rl.ICON_CROSS_SMALL = 128

  ---
  rl.ICON_PLAYER_PREVIOUS = 129

  ---
  rl.ICON_PLAYER_PLAY_BACK = 130

  ---
  rl.ICON_PLAYER_PLAY = 131

  ---
  rl.ICON_PLAYER_PAUSE = 132

  ---
  rl.ICON_PLAYER_STOP = 133

  ---
  rl.ICON_PLAYER_NEXT = 134

  ---
  rl.ICON_PLAYER_RECORD = 135

  ---
  rl.ICON_MAGNET = 136

  ---
  rl.ICON_LOCK_CLOSE = 137

  ---
  rl.ICON_LOCK_OPEN = 138

  ---
  rl.ICON_CLOCK = 139

  ---
  rl.ICON_TOOLS = 140

  ---
  rl.ICON_GEAR = 141

  ---
  rl.ICON_GEAR_BIG = 142

  ---
  rl.ICON_BIN = 143

  ---
  rl.ICON_HAND_POINTER = 144

  ---
  rl.ICON_LASER = 145

  ---
  rl.ICON_COIN = 146

  ---
  rl.ICON_EXPLOSION = 147

  ---
  rl.ICON_1UP = 148

  ---
  rl.ICON_PLAYER = 149

  ---
  rl.ICON_PLAYER_JUMP = 150

  ---
  rl.ICON_KEY = 151

  ---
  rl.ICON_DEMON = 152

  ---
  rl.ICON_TEXT_POPUP = 153

  ---
  rl.ICON_GEAR_EX = 154

  ---
  rl.ICON_CRACK = 155

  ---
  rl.ICON_CRACK_POINTS = 156

  ---
  rl.ICON_STAR = 157

  ---
  rl.ICON_DOOR = 158

  ---
  rl.ICON_EXIT = 159

  ---
  rl.ICON_MODE_2D = 160

  ---
  rl.ICON_MODE_3D = 161

  ---
  rl.ICON_CUBE = 162

  ---
  rl.ICON_CUBE_FACE_TOP = 163

  ---
  rl.ICON_CUBE_FACE_LEFT = 164

  ---
  rl.ICON_CUBE_FACE_FRONT = 165

  ---
  rl.ICON_CUBE_FACE_BOTTOM = 166

  ---
  rl.ICON_CUBE_FACE_RIGHT = 167

  ---
  rl.ICON_CUBE_FACE_BACK = 168

  ---
  rl.ICON_CAMERA = 169

  ---
  rl.ICON_SPECIAL = 170

  ---
  rl.ICON_LINK_NET = 171

  ---
  rl.ICON_LINK_BOXES = 172

  ---
  rl.ICON_LINK_MULTI = 173

  ---
  rl.ICON_LINK = 174

  ---
  rl.ICON_LINK_BROKE = 175

  ---
  rl.ICON_TEXT_NOTES = 176

  ---
  rl.ICON_NOTEBOOK = 177

  ---
  rl.ICON_SUITCASE = 178

  ---
  rl.ICON_SUITCASE_ZIP = 179

  ---
  rl.ICON_MAILBOX = 180

  ---
  rl.ICON_MONITOR = 181

  ---
  rl.ICON_PRINTER = 182

  ---
  rl.ICON_PHOTO_CAMERA = 183

  ---
  rl.ICON_PHOTO_CAMERA_FLASH = 184

  ---
  rl.ICON_HOUSE = 185

  ---
  rl.ICON_HEART = 186

  ---
  rl.ICON_CORNER = 187

  ---
  rl.ICON_VERTICAL_BARS = 188

  ---
  rl.ICON_VERTICAL_BARS_FILL = 189

  ---
  rl.ICON_LIFE_BARS = 190

  ---
  rl.ICON_INFO = 191

  ---
  rl.ICON_CROSSLINE = 192

  ---
  rl.ICON_HELP = 193

  ---
  rl.ICON_FILETYPE_ALPHA = 194

  ---
  rl.ICON_FILETYPE_HOME = 195

  ---
  rl.ICON_LAYERS_VISIBLE = 196

  ---
  rl.ICON_LAYERS = 197

  ---
  rl.ICON_WINDOW = 198

  ---
  rl.ICON_HIDPI = 199

  ---
  rl.ICON_FILETYPE_BINARY = 200

  ---
  rl.ICON_HEX = 201

  ---
  rl.ICON_SHIELD = 202

  ---
  rl.ICON_FILE_NEW = 203

  ---
  rl.ICON_FOLDER_ADD = 204

  ---
  rl.ICON_ALARM = 205

  ---
  rl.ICON_CPU = 206

  ---
  rl.ICON_ROM = 207

  ---
  rl.ICON_STEP_OVER = 208

  ---
  rl.ICON_STEP_INTO = 209

  ---
  rl.ICON_STEP_OUT = 210

  ---
  rl.ICON_RESTART = 211

  ---
  rl.ICON_BREAKPOINT_ON = 212

  ---
  rl.ICON_BREAKPOINT_OFF = 213

  ---
  rl.ICON_BURGER_MENU = 214

  ---
  rl.ICON_CASE_SENSITIVE = 215

  ---
  rl.ICON_REG_EXP = 216

  ---
  rl.ICON_FOLDER = 217

  ---
  rl.ICON_FILE = 218

  ---
  rl.ICON_SAND_TIMER = 219

  ---
  rl.ICON_220 = 220

  ---
  rl.ICON_221 = 221

  ---
  rl.ICON_222 = 222

  ---
  rl.ICON_223 = 223

  ---
  rl.ICON_224 = 224

  ---
  rl.ICON_225 = 225

  ---
  rl.ICON_226 = 226

  ---
  rl.ICON_227 = 227

  ---
  rl.ICON_228 = 228

  ---
  rl.ICON_229 = 229

  ---
  rl.ICON_230 = 230

  ---
  rl.ICON_231 = 231

  ---
  rl.ICON_232 = 232

  ---
  rl.ICON_233 = 233

  ---
  rl.ICON_234 = 234

  ---
  rl.ICON_235 = 235

  ---
  rl.ICON_236 = 236

  ---
  rl.ICON_237 = 237

  ---
  rl.ICON_238 = 238

  ---
  rl.ICON_239 = 239

  ---
  rl.ICON_240 = 240

  ---
  rl.ICON_241 = 241

  ---
  rl.ICON_242 = 242

  ---
  rl.ICON_243 = 243

  ---
  rl.ICON_244 = 244

  ---
  rl.ICON_245 = 245

  ---
  rl.ICON_246 = 246

  ---
  rl.ICON_247 = 247

  ---
  rl.ICON_248 = 248

  ---
  rl.ICON_249 = 249

  ---
  rl.ICON_250 = 250

  ---
  rl.ICON_251 = 251

  ---
  rl.ICON_252 = 252

  ---
  rl.ICON_253 = 253

  ---
  rl.ICON_254 = 254

  ---
  rl.ICON_255 = 255

  ---Enable gui controls (global state)
  ---@return void
  function rl.GuiEnable() end

  ---Disable gui controls (global state)
  ---@return void
  function rl.GuiDisable() end

  ---Lock gui controls (global state)
  ---@return void
  function rl.GuiLock() end

  ---Unlock gui controls (global state)
  ---@return void
  function rl.GuiUnlock() end

  ---Check if gui is locked (global state)
  ---@return boolean
  function rl.GuiIsLocked() end

  ---Set gui controls alpha (global state), alpha goes from 0.0f to 1.0f
  ---@param alpha number
  ---@return void
  function rl.GuiSetAlpha(alpha) end

  ---Set gui state (global state)
  ---@param state integer
  ---@return void
  function rl.GuiSetState(state) end

  ---Get gui state (global state)
  ---@return integer
  function rl.GuiGetState() end

  ---Set guiSliderDragging
  ---@param dragging boolean
  ---@return GuiSetSliderDragging
  function rl.GuiSetSliderDragging(dragging) end

  ---Get guiSliderDragging
  ---- Success return bool
  ---@return any isSliderDragging
  function rl.GuiGetSliderDragging() end

  ---Set guiSliderActive
  ---@param rect any
  ---@return GuiSetSliderActive
  function rl.GuiSetSliderActive(rect) end

  ---Get guiSliderActive
  ---- Success return Rectangle
  ---@return any isSliderDragging
  function rl.GuiGetSliderActive() end

  -- Gui - Font set/get functions

  ---Set gui custom font (global state)
  ---@param font Font
  ---@return void
  function rl.GuiSetFont(font) end

  ---Get gui font (global state). Return as lightuserdata
  ---@return Font
  function rl.GuiGetFont() end

  -- Gui - Style set/get functions

  ---Set one style property
  ---@param control integer
  ---@param property integer
  ---@param value integer
  ---@return void
  function rl.GuiSetStyle(control, property, value) end

  ---Get one style property
  ---- Success return int
  ---@param control integer
  ---@param property integer
  ---@return integer
  function rl.GuiGetStyle(control, property) end

  -- Gui - Styles loading functions

  ---Load style file over global style variable (.rgs)
  ---- Failure return nil
  ---- Success return true
  ---@param fileName string
  ---@return void
  function rl.GuiLoadStyle(fileName) end

  ---Load style default over global style
  ---@return void
  function rl.GuiLoadStyleDefault() end

  -- Gui - Tooltips management functions

  ---Enable gui tooltips (global state)
  ---@return void
  function rl.GuiEnableTooltip() end

  ---Disable gui tooltips (global state)
  ---@return void
  function rl.GuiDisableTooltip() end

  ---Set tooltip string
  ---@param tooltip string
  ---@return void
  function rl.GuiSetTooltip(tooltip) end

  -- Gui - Icons functionality

  ---Get text with icon id prepended (if supported)
  ---- Success return string
  ---@param iconId integer
  ---@param text string|nil
  ---@return string
  function rl.GuiIconText(iconId, text) end

  ---Set icon scale (1 by default)
  ---@param scale integer
  ---@return void
  function rl.GuiSetIconScale(scale) end

  ---Get raygui icons data in buffer. guiIcons size is by default: 256*(16*16/32) = 2048*4 = 8192 bytes = 8 KB
  ---- Success return Buffer
  ---@return integer
  function rl.GuiGetIcons() end

  ---Set raygui icons data in buffer. guiIcons size is by default: 256*(16*16/32) = 2048*4 = 8192 bytes = 8 KB
  ---- Failure return false
  ---- Success return true
  ---@param iconBuffer any
  ---@return any success
  function rl.GuiSetIcons(iconBuffer) end

  ---Load raygui icons file (.rgi) into internal icons data
  ---- Failure return nil
  ---- Success return strings{}
  ---@param fileName string
  ---@param loadIconsName boolean
  ---@return string
  function rl.GuiLoadIcons(fileName, loadIconsName) end

  ---Draw icon
  ---@param iconId integer
  ---@param pos table
  ---@param pixelSize integer
  ---@param color Color
  ---@return void
  function rl.GuiDrawIcon(iconId, pos, pixelSize, color) end

  -- Gui - Container/separator controls, useful for controls organization

  ---Window Box control, shows a window that can be closed
  ---- Success return int
  ---@param bounds Rectangle
  ---@param title string|nil
  ---@return integer
  function rl.GuiWindowBox(bounds, title) end

  ---Group Box control with text name
  ---- Success return int
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@return integer
  function rl.GuiGroupBox(bounds, text) end

  ---Line separator control, could contain text
  ---- Success return int
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@return integer
  function rl.GuiLine(bounds, text) end

  ---Panel control, useful to group controls
  ---- Success return int
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@return integer
  function rl.GuiPanel(bounds, text) end

  ---Tab Bar control, returns TAB to be closed or -1
  ---- Success return int, int
  ---@param bounds Rectangle
  ---@param text string
  ---@param active integer
  ---@return integer
  function rl.GuiTabBar(bounds, text, active) end

  ---Scroll Panel control
  ---- Success return int, Vector2, Rectangle
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@param content Rectangle
  ---@param scroll Vector2
  ---@param view Rectangle
  ---@return integer
  function rl.GuiScrollPanel(bounds, text, content, scroll, view) end

  -- Gui - Basic controls set

  ---Label control, shows text
  ---- Success return int
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@return integer
  function rl.GuiLabel(bounds, text) end

  ---Button control, returns true when clicked
  ---- Success return int
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@return integer
  function rl.GuiButton(bounds, text) end

  ---Label button control, show true when clicked
  ---- Success return int
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@return integer
  function rl.GuiLabelButton(bounds, text) end

  ---Toggle Button control, returns true when active
  ---- Success return int, bool
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@param active boolean
  ---@return integer
  function rl.GuiToggle(bounds, text, active) end

  ---Toggle Group control, returns active toggle index
  ---- Success return int, int
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@param active integer
  ---@return integer
  function rl.GuiToggleGroup(bounds, text, active) end

  ---Toggle Slider control, returns true when clicked
  ---- Success return int, int
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@param active integer
  ---@return integer
  function rl.GuiToggleSlider(bounds, text, active) end

  ---Check Box control, returns true when active
  ---- Success return bool, Rectangle
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@param checked boolean
  ---@return integer
  function rl.GuiCheckBox(bounds, text, checked) end

  ---Combo Box control, returns selected item index
  ---- Success return int, int
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@param active integer
  ---@return integer
  function rl.GuiComboBox(bounds, text, active) end

  ---Dropdown Box control, returns selected item
  ---- Success return int, int
  ---@param bounds Rectangle
  ---@param text string
  ---@param active integer
  ---@param editMode boolean
  ---@return integer
  function rl.GuiDropdownBox(bounds, text, active, editMode) end

  ---Spinner control, returns selected value
  ---- Success return int, int, Rectangle
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@param value integer
  ---@param minValue integer
  ---@param maxValue integer
  ---@param editMode boolean
  ---@return integer
  function rl.GuiSpinner(bounds, text, value, minValue, maxValue, editMode) end

  ---Value Box control, updates input text with numbers
  ---- Success return int, int, Rectangle
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@param value integer
  ---@param minValue integer
  ---@param maxValue integer
  ---@param editMode boolean
  ---@return integer
  function rl.GuiValueBox(bounds, text, value, minValue, maxValue, editMode) end

  ---Text Box control, updates input text
  ---- Success return int, string
  ---@param bounds Rectangle
  ---@param text string
  ---@param bufferSize integer
  ---@param editMode boolean
  ---@return integer
  function rl.GuiTextBox(bounds, text, bufferSize, editMode) end

  ---Slider control, returns selected value
  ---- Success return int, float, Rectangle, Rectangle
  ---@param bounds Rectangle
  ---@param textLeft string|nil
  ---@param textRight string|nil
  ---@param value number
  ---@param minValue number
  ---@param maxValue number
  ---@return integer
  function rl.GuiSlider(bounds, textLeft, textRight, value, minValue, maxValue) end

  ---Slider Bar control, returns selected value
  ---- Success return int, float, Rectangle, Rectangle
  ---@param bounds Rectangle
  ---@param textLeft string|nil
  ---@param textRight string|nil
  ---@param value number
  ---@param minValue number
  ---@param maxValue number
  ---@return integer
  function rl.GuiSliderBar(bounds, textLeft, textRight, value, minValue, maxValue) end

  ---Progress Bar control, shows current progress value
  ---- Success return int, float, Rectangle, Rectangle
  ---@param bounds Rectangle
  ---@param textLeft string|nil
  ---@param textRight string|nil
  ---@param value number
  ---@param minValue number
  ---@param maxValue number
  ---@return integer
  function rl.GuiProgressBar(bounds, textLeft, textRight, value, minValue, maxValue) end

  ---Status Bar control, shows info text
  ---- Success return int
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@return integer
  function rl.GuiStatusBar(bounds, text) end

  ---Dummy control for placeholders
  ---- Success return int
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@return integer
  function rl.GuiDummyRec(bounds, text) end

  ---Grid control, returns mouse cell position
  ---- Success return int, Vector2
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@param spacing number
  ---@param subdivs integer
  ---@param mouseCell Vector2
  ---@return integer
  function rl.GuiGrid(bounds, text, spacing, subdivs, mouseCell) end

  ---Scroll bar control
  ---- Success return int
  ---@param bounds Rectangle
  ---@param value integer
  ---@param minValue integer
  ---@param maxValue integer
  ---@return integer
  function rl.GuiScrollBar(bounds, value, minValue, maxValue) end

  -- Gui - Advance controls set

  ---List View control, returns selected list item index
  ---- Success return int, int, int
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@param scrollIndex integer
  ---@param active integer
  ---@return integer
  function rl.GuiListView(bounds, text, scrollIndex, active) end

  ---List View with extended parameters
  ---- Success return int, int, int, int
  ---@param bounds Rectangle
  ---@param text string
  ---@param scrollIndex integer
  ---@param active integer
  ---@param focus integer
  ---@return integer
  function rl.GuiListViewEx(bounds, text, scrollIndex, active, focus) end

  ---Message Box control, displays a message
  ---- Success return int
  ---@param bounds Rectangle
  ---@param title string|nil
  ---@param message string
  ---@param buttons string
  ---@return integer
  function rl.GuiMessageBox(bounds, title, message, buttons) end

  ---Text Input Box control, ask for text, supports secret
  ---- Success return int, string, bool
  ---@param bounds Rectangle
  ---@param title string
  ---@param message string
  ---@param buttons string
  ---@param text string
  ---@param textMaxSize integer
  ---@param secretViewActive boolean
  ---@return integer
  function rl.GuiTextInputBox(bounds, title, message, buttons, text, textMaxSize, secretViewActive) end

  ---Color Picker control (multiple color controls)
  ---- Success return int, Color
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@param color Color
  ---@return integer
  function rl.GuiColorPicker(bounds, text, color) end

  ---Color Panel control
  ---- Success return int, Color
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@param color Color
  ---@return integer
  function rl.GuiColorPanel(bounds, text, color) end

  ---Color Bar Alpha control
  ---- Success return int, float
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@param alpha number
  ---@return integer
  function rl.GuiColorBarAlpha(bounds, text, alpha) end

  ---Color Bar Hue control
  ---- Success return int, float
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@param value number
  ---@return integer
  function rl.GuiColorBarHue(bounds, text, value) end

  ---Color Picker control that avoids conversion to RGB on each call (multiple color controls)
  ---- Success return int, Vector3
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@param colorHsv Vector3
  ---@return integer
  function rl.GuiColorPickerHSV(bounds, text, colorHsv) end

  ---Color Panel control that returns HSV color value, used by GuiColorPickerHSV()
  ---- Success return int, Vector3
  ---@param bounds Rectangle
  ---@param text string|nil
  ---@param colorHsv Vector3
  ---@return integer
  function rl.GuiColorPanelHSV(bounds, text, colorHsv) end

  return rl
end
