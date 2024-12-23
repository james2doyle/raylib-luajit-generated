--- copied and modified from ReiLua_API
---@see https://github.com/nullstare/ReiLua

return function (rl)
  -- Gui - Global gui state control functions

  ---Enable gui controls (global state)
  ---@return GuiEnable
  function rl.GuiEnable() end

  ---Disable gui controls (global state)
  ---@return GuiDisable
  function rl.GuiDisable() end

  ---Lock gui controls (global state)
  ---@return GuiLock
  function rl.GuiLock() end

  ---Unlock gui controls (global state)
  ---@return GuiUnlock
  function rl.GuiUnlock() end

  ---Check if gui is locked (global state)
  ---- Success return bool
  ---@return any locked
  function rl.GuiIsLocked() end

  ---Set gui controls alpha (global state), alpha goes from 0.0f to 1.0f
  ---@param alpha number
  ---@return GuiSetAlpha
  function rl.GuiSetAlpha( alpha ) end

  ---Set gui state (global state)
  ---@param state integer
  ---@return GuiSetState
  function rl.GuiSetState( state ) end

  ---Get gui state (global state)
  ---- Success return int
  ---@return any state
  function rl.GuiGetState() end

  ---Set guiSliderDragging
  ---@param dragging boolean
  ---@return GuiSetSliderDragging
  function rl.GuiSetSliderDragging( dragging ) end

  ---Get guiSliderDragging
  ---- Success return bool
  ---@return any isSliderDragging
  function rl.GuiGetSliderDragging() end

  ---Set guiSliderActive
  ---@param rect any
  ---@return GuiSetSliderActive
  function rl.GuiSetSliderActive( rect ) end

  ---Get guiSliderActive
  ---- Success return Rectangle
  ---@return any isSliderDragging
  function rl.GuiGetSliderActive() end

  -- Gui - Font set/get functions

  ---Set gui custom font (global state)
  ---@param font any
  ---@return GuiSetFont
  function rl.GuiSetFont( font ) end

  ---Get gui font (global state). Return as lightuserdata
  ---- Success return Font
  ---@return any font
  function rl.GuiGetFont() end

  -- Gui - Style set/get functions

  ---Set one style property
  ---@param control integer
  ---@param property integer
  ---@param value integer
  ---@return GuiSetStyle
  function rl.GuiSetStyle( control, property, value ) end

  ---Get one style property
  ---- Success return int
  ---@param control integer
  ---@param property integer
  ---@return any value
  function rl.GuiGetStyle( control, property ) end

  -- Gui - Styles loading functions

  ---Load style file over global style variable (.rgs)
  ---- Failure return nil
  ---- Success return true
  ---@param fileName string
  ---@return any success
  function rl.GuiLoadStyle( fileName ) end

  ---Load style default over global style
  ---@return GuiLoadStyleDefault
  function rl.GuiLoadStyleDefault() end

  -- Gui - Tooltips management functions

  ---Enable gui tooltips (global state)
  ---@return GuiEnableTooltip
  function rl.GuiEnableTooltip() end

  ---Disable gui tooltips (global state)
  ---@return GuiDisableTooltip
  function rl.GuiDisableTooltip() end

  ---Set tooltip string
  ---@param tooltip string
  ---@return GuiSetTooltip
  function rl.GuiSetTooltip( tooltip ) end

  -- Gui - Icons functionality

  ---Get text with icon id prepended (if supported)
  ---- Success return string
  ---@param iconId integer
  ---@param text string|nil
  ---@return any text
  function rl.GuiIconText( iconId, text ) end

  ---Set icon scale (1 by default)
  ---@param scale integer
  ---@return GuiSetIconScale
  function rl.GuiSetIconScale( scale ) end

  ---Get raygui icons data in buffer. guiIcons size is by default: 256*(16*16/32) = 2048*4 = 8192 bytes = 8 KB
  ---- Success return Buffer
  ---@return any iconsBuffer
  function rl.GuiGetIcons() end

  ---Set raygui icons data in buffer. guiIcons size is by default: 256*(16*16/32) = 2048*4 = 8192 bytes = 8 KB
  ---- Failure return false
  ---- Success return true
  ---@param iconBuffer any
  ---@return any success
  function rl.GuiSetIcons( iconBuffer ) end

  ---Load raygui icons file (.rgi) into internal icons data
  ---- Failure return nil
  ---- Success return strings{}
  ---@param fileName string
  ---@param loadIconsName boolean
  ---@return any iconNames
  function rl.GuiLoadIcons( fileName, loadIconsName ) end

  ---Draw icon
  ---@param iconId integer
  ---@param pos table
  ---@param pixelSize integer
  ---@param color table
  ---@return GuiDrawIcon
  function rl.GuiDrawIcon( iconId, pos, pixelSize, color ) end

  -- Gui - Container/separator controls, useful for controls organization

  ---Window Box control, shows a window that can be closed
  ---- Success return int
  ---@param bounds table
  ---@param title string|nil
  ---@return any result
  function rl.GuiWindowBox( bounds, title ) end

  ---Group Box control with text name
  ---- Success return int
  ---@param bounds table
  ---@param text string|nil
  ---@return any result
  function rl.GuiGroupBox( bounds, text ) end

  ---Line separator control, could contain text
  ---- Success return int
  ---@param bounds table
  ---@param text string|nil
  ---@return any result
  function rl.GuiLine( bounds, text ) end

  ---Panel control, useful to group controls
  ---- Success return int
  ---@param bounds table
  ---@param text string|nil
  ---@return any result
  function rl.GuiPanel( bounds, text ) end

  ---Tab Bar control, returns TAB to be closed or -1
  ---- Success return int, int
  ---@param bounds table
  ---@param text string
  ---@param active integer
  ---@return any result
  ---@return any active
  function rl.GuiTabBar( bounds, text, active ) end

  ---Scroll Panel control
  ---- Success return int, Vector2, Rectangle
  ---@param bounds table
  ---@param text string|nil
  ---@param content table
  ---@param scroll table
  ---@param view table
  ---@return any result
  ---@return any scroll
  ---@return any view
  function rl.GuiScrollPanel( bounds, text, content, scroll, view ) end

  -- Gui - Basic controls set

  ---Label control, shows text
  ---- Success return int
  ---@param bounds table
  ---@param text string|nil
  ---@return any result
  function rl.GuiLabel( bounds, text ) end

  ---Button control, returns true when clicked
  ---- Success return int
  ---@param bounds table
  ---@param text string|nil
  ---@return any result
  function rl.GuiButton( bounds, text ) end

  ---Label button control, show true when clicked
  ---- Success return int
  ---@param bounds table
  ---@param text string|nil
  ---@return any result
  function rl.GuiLabelButton( bounds, text ) end

  ---Toggle Button control, returns true when active
  ---- Success return int, bool
  ---@param bounds table
  ---@param text string|nil
  ---@param active boolean
  ---@return any result
  ---@return any active
  function rl.GuiToggle( bounds, text, active ) end

  ---Toggle Group control, returns active toggle index
  ---- Success return int, int
  ---@param bounds table
  ---@param text string|nil
  ---@param active integer
  ---@return any result
  ---@return any active
  function rl.GuiToggleGroup( bounds, text, active ) end

  ---Toggle Slider control, returns true when clicked
  ---- Success return int, int
  ---@param bounds table
  ---@param text string|nil
  ---@param active integer
  ---@return any result
  ---@return any active
  function rl.GuiToggleSlider( bounds, text, active ) end

  ---Check Box control, returns true when active
  ---- Success return bool, Rectangle
  ---@param bounds table
  ---@param text string|nil
  ---@param checked boolean
  ---@return any result
  ---@return any checked
  ---@return any textBounds
  function rl.GuiCheckBox( bounds, text, checked ) end

  ---Combo Box control, returns selected item index
  ---- Success return int, int
  ---@param bounds table
  ---@param text string|nil
  ---@param active integer
  ---@return any result
  ---@return any active
  function rl.GuiComboBox( bounds, text, active ) end

  ---Dropdown Box control, returns selected item
  ---- Success return int, int
  ---@param bounds table
  ---@param text string
  ---@param active integer
  ---@param editMode boolean
  ---@return any result
  ---@return any active
  function rl.GuiDropdownBox( bounds, text, active, editMode ) end

  ---Spinner control, returns selected value
  ---- Success return int, int, Rectangle
  ---@param bounds table
  ---@param text string|nil
  ---@param value integer
  ---@param minValue integer
  ---@param maxValue integer
  ---@param editMode boolean
  ---@return any result
  ---@return any value
  ---@return any textBounds
  function rl.GuiSpinner( bounds, text, value, minValue, maxValue, editMode ) end

  ---Value Box control, updates input text with numbers
  ---- Success return int, int, Rectangle
  ---@param bounds table
  ---@param text string|nil
  ---@param value integer
  ---@param minValue integer
  ---@param maxValue integer
  ---@param editMode boolean
  ---@return any result
  ---@return any value
  ---@return any textBounds
  function rl.GuiValueBox( bounds, text, value, minValue, maxValue, editMode ) end

  ---Text Box control, updates input text
  ---- Success return int, string
  ---@param bounds table
  ---@param text string
  ---@param bufferSize integer
  ---@param editMode boolean
  ---@return any result
  ---@return any text
  function rl.GuiTextBox( bounds, text, bufferSize, editMode ) end

  ---Slider control, returns selected value
  ---- Success return int, float, Rectangle, Rectangle
  ---@param bounds table
  ---@param textLeft string|nil
  ---@param textRight string|nil
  ---@param value number
  ---@param minValue number
  ---@param maxValue number
  ---@return any result
  ---@return any value
  ---@return any textLeftBounds
  ---@return any textRightBounds
  function rl.GuiSlider( bounds, textLeft, textRight, value, minValue, maxValue ) end

  ---Slider Bar control, returns selected value
  ---- Success return int, float, Rectangle, Rectangle
  ---@param bounds table
  ---@param textLeft string|nil
  ---@param textRight string|nil
  ---@param value number
  ---@param minValue number
  ---@param maxValue number
  ---@return any result
  ---@return any value
  ---@return any textLeftBounds
  ---@return any textRightBounds
  function rl.GuiSliderBar( bounds, textLeft, textRight, value, minValue, maxValue ) end

  ---Progress Bar control, shows current progress value
  ---- Success return int, float, Rectangle, Rectangle
  ---@param bounds table
  ---@param textLeft string|nil
  ---@param textRight string|nil
  ---@param value number
  ---@param minValue number
  ---@param maxValue number
  ---@return any result
  ---@return any value
  ---@return any textLeftBounds
  ---@return any textRightBounds
  function rl.GuiProgressBar( bounds, textLeft, textRight, value, minValue, maxValue ) end

  ---Status Bar control, shows info text
  ---- Success return int
  ---@param bounds table
  ---@param text string|nil
  ---@return any result
  function rl.GuiStatusBar( bounds, text ) end

  ---Dummy control for placeholders
  ---- Success return int
  ---@param bounds table
  ---@param text string|nil
  ---@return any result
  function rl.GuiDummyRec( bounds, text ) end

  ---Grid control, returns mouse cell position
  ---- Success return int, Vector2
  ---@param bounds table
  ---@param text string|nil
  ---@param spacing number
  ---@param subdivs integer
  ---@param mouseCell table
  ---@return any result
  ---@return any mouseCell
  function rl.GuiGrid( bounds, text, spacing, subdivs, mouseCell ) end

  ---Scroll bar control
  ---- Success return int
  ---@param bounds table
  ---@param value integer
  ---@param minValue integer
  ---@param maxValue integer
  ---@return any value
  function rl.GuiScrollBar( bounds, value, minValue, maxValue ) end

  -- Gui - Advance controls set

  ---List View control, returns selected list item index
  ---- Success return int, int, int
  ---@param bounds table
  ---@param text string|nil
  ---@param scrollIndex integer
  ---@param active integer
  ---@return any result
  ---@return any scrollIndex
  ---@return any active
  function rl.GuiListView( bounds, text, scrollIndex, active ) end

  ---List View with extended parameters
  ---- Success return int, int, int, int
  ---@param bounds table
  ---@param text string
  ---@param scrollIndex integer
  ---@param active integer
  ---@param focus integer
  ---@return any result
  ---@return any scrollIndex
  ---@return any active
  ---@return any focus
  function rl.GuiListViewEx( bounds, text, scrollIndex, active, focus ) end

  ---Message Box control, displays a message
  ---- Success return int
  ---@param bounds table
  ---@param title string|nil
  ---@param message string
  ---@param buttons string
  ---@return any result
  function rl.GuiMessageBox( bounds, title, message, buttons ) end

  ---Text Input Box control, ask for text, supports secret
  ---- Success return int, string, bool
  ---@param bounds table
  ---@param title string
  ---@param message string
  ---@param buttons string
  ---@param text string
  ---@param textMaxSize integer
  ---@param secretViewActive boolean
  ---@return any result
  ---@return any text
  ---@return any secretViewActive
  function rl.GuiTextInputBox( bounds, title, message, buttons, text, textMaxSize, secretViewActive ) end

  ---Color Picker control (multiple color controls)
  ---- Success return int, Color
  ---@param bounds table
  ---@param text string|nil
  ---@param color table
  ---@return any result
  ---@return any color
  function rl.GuiColorPicker( bounds, text, color ) end

  ---Color Panel control
  ---- Success return int, Color
  ---@param bounds table
  ---@param text string|nil
  ---@param color table
  ---@return any result
  ---@return any color
  function rl.GuiColorPanel( bounds, text, color ) end

  ---Color Bar Alpha control
  ---- Success return int, float
  ---@param bounds table
  ---@param text string|nil
  ---@param alpha number
  ---@return any result
  ---@return any alpha
  function rl.GuiColorBarAlpha( bounds, text, alpha ) end

  ---Color Bar Hue control
  ---- Success return int, float
  ---@param bounds table
  ---@param text string|nil
  ---@param value number
  ---@return any result
  ---@return any value
  function rl.GuiColorBarHue( bounds, text, value ) end

  ---Color Picker control that avoids conversion to RGB on each call (multiple color controls)
  ---- Success return int, Vector3
  ---@param bounds table
  ---@param text string|nil
  ---@param colorHsv table
  ---@return any result
  ---@return any colorHsv
  function rl.GuiColorPickerHSV( bounds, text, colorHsv ) end

  ---Color Panel control that returns HSV color value, used by GuiColorPickerHSV()
  ---- Success return int, Vector3
  ---@param bounds table
  ---@param text string|nil
  ---@param colorHsv table
  ---@return any result
  ---@return any colorHsv
  function rl.GuiColorPanelHSV( bounds, text, colorHsv ) end

  return rl
end