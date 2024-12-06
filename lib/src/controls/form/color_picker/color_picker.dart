import 'dart:math' as math;

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

import 'color_spectrum.dart';
import 'color_state.dart';

/// Defines the shape of the color spectrum in the [ColorPicker].
enum ColorSpectrumShape {
  /// A ring-shaped color spectrum.
  ring,

  /// A box-shaped color spectrum.
  box,
}

/// Defines the color mode used in the [ColorPicker].
enum ColorMode {
  /// RGB (Red, Green, Blue) color mode.
  rgb,

  /// HSV (Hue, Saturation, Value) color mode.
  hsv,
}

/// Color picker spacing constants
class ColorPickerSpacing {
  /// Small spacing between widgets
  static const double small = 12.0;

  /// Large spacing between widgets
  static const double large = 24.0;
}

/// Color picker component sizing constants
class ColorPickerSizes {
  /// The size of the color spectrum widget
  static const double spectrum = 336.0;

  /// The width of the color preview box
  static const double preview = 44.0;

  /// The height of the sliders
  static const double slider = 12.0;

  /// The width of the input boxes
  static const double inputBox = 120.0;

  /// The maximum width of the color spectrum and preview box
  static double maxWidth = spectrum + ColorPickerSpacing.small + preview; // 392
}

/// Color Picker
///
/// A comprehensive color picker implementation that supports both RGB and HSV color models,
/// with wheel and box spectrum shapes. Integrates with Fluent UI's theming system for
/// consistent look and feel.
///
/// Features:
/// - Color wheel and box spectrum modes
/// - RGB and HSV color input modes
/// - Alpha channel support
/// - Hex color input
/// - Real-time color name display
/// - Theme-aware tooltips and UI elements
/// - Value and alpha sliders
///
/// Example usage:
/// ```dart
/// ColorPicker(
///   value: Colors.blue,
///   onChanged: (Color color) {
///     setState(() {
///       _selectedColor = color;
///     });
///   },
///   colorSpectrumShape: ColorSpectrumShape.ring,
/// )
/// ```
class ColorPicker extends StatefulWidget {
  /// The current color value
  final Color color;

  /// Callback when the color value changes
  final ValueChanged<Color> onChanged;

  /// The orientation of the color picker layout
  final Axis orientation;

  /// Whether the color preview is visible
  final bool isColorPreviewVisible;

  /// Whether the "More" button is visible
  final bool isMoreButtonVisible;

  /// Whether the color slider is visible
  final bool isColorSliderVisible;

  /// Whether the color channel text input is visible
  final bool isColorChannelTextInputVisible;

  /// Whether the hex input is visible
  final bool isHexInputVisible;

  /// Whether the alpha channel is enabled
  final bool isAlphaEnabled;

  /// Whether the alpha slider is visible
  final bool isAlphaSliderVisible;

  /// Whether the alpha text input is visible
  final bool isAlphaTextInputVisible;

  /// The shape of the color spectrum (ring or box)
  final ColorSpectrumShape colorSpectrumShape;

  /// The minimum allowed hue value (0-359)
  final int minHue;

  /// The maximum allowed hue value (0-359)
  final int maxHue;

  /// The minimum allowed saturation value (0-100)
  final int minSaturation;

  /// The maximum allowed saturation value (0-100)
  final int maxSaturation;

  /// The minimum allowed value/brightness (0-100)
  final int minValue;

  /// The maximum allowed value/brightness (0-100)
  final int maxValue;

  /// Creates a new instance of [ColorPicker].
  ///
  /// - [color]: The current color value.
  /// - [onChanged]: Callback when the color value changes.
  /// - [orientation]: The orientation of the color picker layout. Defaults to [Axis.vertical].
  /// - [colorSpectrumShape]: The shape of the color spectrum (ring or box). Defaults to [ColorSpectrumShape.ring].
  /// - [isColorPreviewVisible]: Whether the color preview is visible. Defaults to true.
  /// - [isColorSliderVisible]: Whether the color slider is visible. Defaults to true.
  /// - [isMoreButtonVisible]: Whether the "More" button is visible. Defaults to true.
  /// - [isHexInputVisible]: Whether the hex input is visible. Defaults to true.
  /// - [isColorChannelTextInputVisible]: Whether the color channel text input is visible. Defaults to true.
  /// - [isAlphaEnabled]: Whether the alpha channel is enabled. Defaults to true.
  /// - [isAlphaSliderVisible]: Whether the alpha slider is visible. Defaults to true.
  /// - [isAlphaTextInputVisible]: Whether the alpha text input is visible. Defaults to true.
  /// - [minHue]: The minimum allowed hue value (0-359). Defaults to 0.
  /// - [maxHue]: The maximum allowed hue value (0-359). Defaults to 359.
  /// - [minSaturation]: The minimum allowed saturation value (0-100). Defaults to 0.
  /// - [maxSaturation]: The maximum allowed saturation value (0-100). Defaults to 100.
  /// - [minValue]: The minimum allowed value/brightness (0-100). Defaults to 0.
  /// - [maxValue]: The maximum allowed value/brightness (0-100). Defaults to 100.
  const ColorPicker({
    super.key,
    required this.color,
    required this.onChanged,
    this.orientation = Axis.vertical,
    this.colorSpectrumShape = ColorSpectrumShape.ring,
    this.isColorPreviewVisible = true,
    this.isColorSliderVisible = true,
    this.isMoreButtonVisible = true,
    this.isHexInputVisible = true,
    this.isColorChannelTextInputVisible = true,
    this.isAlphaEnabled = true,
    this.isAlphaSliderVisible = true,
    this.isAlphaTextInputVisible = true,
    this.minHue = 0,
    this.maxHue = 359,
    this.minSaturation = 0,
    this.maxSaturation = 100,
    this.minValue = 0,
    this.maxValue = 100,
  })  : assert(minHue >= 0 && minHue <= maxHue && maxHue <= 359,
            'Hue values must be between 0 and 359'),
        assert(
            minSaturation >= 0 &&
                minSaturation <= maxSaturation &&
                maxSaturation <= 100,
            'Saturation values must be between 0 and 100'),
        assert(minValue >= 0 && minValue <= maxValue && maxValue <= 100,
            'Value/brightness values must be between 0 and 100');

  @override
  State<ColorPicker> createState() => _ColorPickerState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('color', color));
    properties.add(EnumProperty<Axis>('orientation', orientation));
    properties.add(EnumProperty<ColorSpectrumShape>(
        'colorSpectrumShape', colorSpectrumShape));
    properties.add(FlagProperty(
      'isColorPreviewVisible',
      value: isColorPreviewVisible,
      defaultValue: true,
      ifFalse: 'color preview hidden',
    ));
    properties.add(FlagProperty(
      'isColorSliderVisible',
      value: isColorSliderVisible,
      defaultValue: true,
      ifFalse: 'color slider hidden',
    ));
    properties.add(FlagProperty(
      'isMoreButtonVisible',
      value: isMoreButtonVisible,
      defaultValue: true,
      ifFalse: 'more button hidden',
    ));
    properties.add(FlagProperty(
      'isHexInputVisible',
      value: isHexInputVisible,
      defaultValue: true,
      ifFalse: 'hex input hidden',
    ));
    properties.add(FlagProperty(
      'isColorChannelTextInputVisible',
      value: isColorChannelTextInputVisible,
      defaultValue: true,
      ifFalse: 'color channel text input hidden',
    ));
    properties.add(FlagProperty(
      'isAlphaEnabled',
      value: isAlphaEnabled,
      defaultValue: true,
      ifFalse: 'alpha disabled',
    ));
    properties.add(FlagProperty(
      'isAlphaSliderVisible',
      value: isAlphaSliderVisible,
      defaultValue: true,
      ifFalse: 'alpha slider hidden',
    ));
    properties.add(FlagProperty(
      'isAlphaTextInputVisible',
      value: isAlphaTextInputVisible,
      defaultValue: true,
      ifFalse: 'alpha text input hidden',
    ));
    properties.add(IntProperty('minHue', minHue, defaultValue: 0));
    properties.add(IntProperty('maxHue', maxHue, defaultValue: 359));
    properties
        .add(IntProperty('minSaturation', minSaturation, defaultValue: 0));
    properties
        .add(IntProperty('maxSaturation', maxSaturation, defaultValue: 100));
    properties.add(IntProperty('minValue', minValue, defaultValue: 0));
    properties.add(IntProperty('maxValue', maxValue, defaultValue: 100));
  }
}

class _ColorPickerState extends State<ColorPicker> {
  late TextEditingController _hexController;
  late FocusNode _hexFocusNode;

  late ColorState _colorState;

  bool _isMoreExpanded = false;

  @override
  void initState() {
    super.initState();
    _colorState = ColorState.fromColor(widget.color);
    _colorState.clampToBounds(
      minHue: widget.minHue,
      maxHue: widget.maxHue,
      minSaturation: widget.minSaturation,
      maxSaturation: widget.maxSaturation,
      minValue: widget.minValue,
      maxValue: widget.maxValue,
    );
    _initControllers();
    _updateControllers();
  }

  @override
  void didUpdateWidget(ColorPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.color != widget.color) {
      _updateControllers();
    }
  }

  @override
  void dispose() {
    _hexFocusNode.removeListener(_onFocusChange);
    _hexFocusNode.dispose();
    _hexController.dispose();
    _colorState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasVisibleInputs = widget.isHexInputVisible ||
        widget.isColorChannelTextInputVisible ||
        (widget.isAlphaEnabled && widget.isAlphaTextInputVisible);

    // Build the color picker layout based on orientation
    return widget.orientation == Axis.vertical
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSpectrumAndPreview(),
              if (widget.isColorSliderVisible ||
                  (widget.isAlphaEnabled && widget.isAlphaSliderVisible)) ...[
                const SizedBox(height: ColorPickerSpacing.large),
                _buildSliders(),
              ],
              if (widget.isMoreButtonVisible && hasVisibleInputs) ...[
                const SizedBox(height: ColorPickerSpacing.large),
                _buildMoreButton(),
              ],
              if (!widget.isMoreButtonVisible || _isMoreExpanded) ...[
                if (hasVisibleInputs) ...[
                  const SizedBox(height: ColorPickerSpacing.large),
                  _buildInputs(),
                ],
              ],
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSpectrumAndPreview(),
              if (widget.isColorSliderVisible ||
                  (widget.isAlphaEnabled && widget.isAlphaSliderVisible)) ...[
                const SizedBox(width: ColorPickerSpacing.large),
                _buildSliders(),
              ],
              if (hasVisibleInputs) ...[
                const SizedBox(width: ColorPickerSpacing.large),
                _buildInputs(),
              ],
            ],
          );
  }

  /// Initializes the text controllers and focus nodes.
  void _initControllers() {
    _hexController = TextEditingController();
    _hexFocusNode = FocusNode();
    _hexFocusNode.addListener(_onFocusChange);
  }

  /// Updates the text controllers with the current color state.
  void _updateControllers() {
    final oldText = _hexController.text;
    final newText = _colorState.toHexString(widget.isAlphaEnabled);
    if (oldText != newText) {
      _hexController.text = newText;
    }
  }

  /// Builds the color spectrum and color preview box.
  Widget _buildSpectrumAndPreview() {
    return _ColorSpectrumAndPreview(
      colorState: _colorState,
      orientation: widget.orientation,
      colorSpectrumShape: widget.colorSpectrumShape,
      isColorPreviewVisible: widget.isColorPreviewVisible,
      onColorChanged: _handleColorChanged,
      minHue: widget.minHue,
      maxHue: widget.maxHue,
      minSaturation: widget.minSaturation,
      maxSaturation: widget.maxSaturation,
    );
  }

  /// Builds the color sliders.
  Widget _buildSliders() {
    return _ColorSliders(
      colorState: _colorState,
      orientation: widget.orientation,
      isColorSliderVisible: widget.isColorSliderVisible,
      isAlphaSliderVisible: widget.isAlphaSliderVisible,
      isAlphaEnabled: widget.isAlphaEnabled,
      onColorChanged: _handleColorChanged,
      minValue: widget.minValue,
      maxValue: widget.maxValue,
    );
  }

  /// Builds the "More" button to expand the color picker inputs.
  Widget _buildMoreButton() {
    final moreButton = SizedBox(
        width: ColorPickerSizes.inputBox,
        child: Button(
          onPressed: () => setState(() => _isMoreExpanded = !_isMoreExpanded),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_isMoreExpanded ? 'Less' : 'More'),
              Icon(
                _isMoreExpanded
                    ? FluentIcons.chevron_up
                    : FluentIcons.chevron_down,
                size: 12,
              ),
            ],
          ),
        ));

    return SizedBox(
      width: ColorPickerSizes.maxWidth,
      child: Align(
        alignment: Alignment.centerRight,
        child: moreButton,
      ),
    );
  }

  /// Builds the color inputs.
  Widget _buildInputs() {
    return _ColorInputs(
      colorState: _colorState,
      orientation: widget.orientation,
      isMoreExpanded: _isMoreExpanded,
      isMoreButtonVisible: widget.isMoreButtonVisible,
      isHexInputVisible: widget.isHexInputVisible,
      isColorChannelTextInputVisible: widget.isColorChannelTextInputVisible,
      isAlphaEnabled: widget.isAlphaEnabled,
      isAlphaTextInputVisible: widget.isAlphaTextInputVisible,
      hexController: _hexController,
      onColorChanged: _handleColorChanged,
      minHue: widget.minHue,
      maxHue: widget.maxHue,
      minSaturation: widget.minSaturation,
      maxSaturation: widget.maxSaturation,
      minValue: widget.minValue,
      maxValue: widget.maxValue,
    );
  }

  /// Handles color changes from the color spectrum, sliders, and inputs.
  void _handleColorChanged(ColorState newState) {
    newState.clampToBounds(
      minHue: widget.minHue,
      maxHue: widget.maxHue,
      minSaturation: widget.minSaturation,
      maxSaturation: widget.maxSaturation,
      minValue: widget.minValue,
      maxValue: widget.maxValue,
    );

    setState(() => _colorState = newState);
    widget.onChanged(newState.toColor());
  }

  /// Callback when the hex input field loses focus.
  void _onFocusChange() {
    if (!_hexFocusNode.hasFocus) {
      _updateHexColor(_hexController.text);
    }
  }

  /// Updates the color state based on the hex color value.
  void _updateHexColor(String text) {
    if (text.length == 7 || (widget.isAlphaEnabled && text.length == 9)) {
      try {
        _colorState.setHex(text);
        widget.onChanged(_colorState.toColor());
      } catch (_) {
        _updateControllers();
      }
    }
  }
}

/// A widget that displays the color spectrum and color preview box.
class _ColorSpectrumAndPreview extends StatelessWidget {
  /// The current color state
  final ColorState colorState;

  /// Callback when the color changes
  final ValueChanged<ColorState> onColorChanged;

  /// The orientation of the color picker layout
  final Axis orientation;

  /// The shape of the color spectrum
  final ColorSpectrumShape colorSpectrumShape;

  /// Whether the color preview is visible
  final bool isColorPreviewVisible;

  /// The minimum allowed hue value (0-359)
  final int minHue;

  /// The maximum allowed hue value (0-359)
  final int maxHue;

  /// The minimum allowed saturation value (0-100)
  final int minSaturation;

  /// The maximum allowed saturation value (0-100)
  final int maxSaturation;

  /// Creates a new instance of [_ColorSpectrumAndPreview].
  const _ColorSpectrumAndPreview({
    required this.colorState,
    required this.colorSpectrumShape,
    required this.onColorChanged,
    required this.orientation,
    required this.isColorPreviewVisible,
    required this.minHue,
    required this.maxHue,
    required this.minSaturation,
    required this.maxSaturation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (orientation == Axis.horizontal) && !isColorPreviewVisible
          ? ColorPickerSizes.spectrum
          : ColorPickerSizes.maxWidth,
      height: ColorPickerSizes.spectrum,
      child: isColorPreviewVisible
          ? Row(
              children: [
                _buildSpectrum(),
                const SizedBox(width: ColorPickerSpacing.small),
                _buildPreviewBox(context),
              ],
            )
          : Center(child: _buildSpectrum()),
    );
  }

  Widget _buildSpectrum() {
    return SizedBox(
      width: ColorPickerSizes.spectrum,
      height: ColorPickerSizes.spectrum,
      child: colorSpectrumShape == ColorSpectrumShape.ring
          ? ColorRingSpectrum(
              colorState: colorState,
              onColorChanged: onColorChanged,
              minHue: minHue,
              maxHue: maxHue,
              minSaturation: minSaturation,
              maxSaturation: maxSaturation,
            )
          : ColorBoxSpectrum(
              colorState: colorState,
              onColorChanged: onColorChanged,
              minHue: minHue,
              maxHue: maxHue,
              minSaturation: minSaturation,
              maxSaturation: maxSaturation,
            ),
    );
  }

  Widget _buildPreviewBox(BuildContext context) {
    const double width = ColorPickerSizes.preview;
    const double height = ColorPickerSizes.spectrum;
    const double borderRadius = 4.0;

    final theme = FluentTheme.of(context);
    final color = colorState.toColor();

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.resources.dividerStrokeColorDefault,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius - 1),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: CheckerboardPainter(),
              ),
            ),
            Positioned.fill(
              child: Container(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A widget that displays the color sliders.
class _ColorSliders extends StatelessWidget {
  /// The current color state
  final ColorState colorState;

  /// Callback when the color changes
  final ValueChanged<ColorState> onColorChanged;

  /// The orientation of the color picker layout
  final Axis orientation;

  /// Whether the color slider is visible
  final bool isColorSliderVisible;

  /// Whether the alpha slider is visible
  final bool isAlphaSliderVisible;

  /// Whether the alpha channel is enabled
  final bool isAlphaEnabled;

  /// The minimum allowed HSV value (0-100)
  final int minValue;

  /// The maximum allowed HSV value (0-100)
  final int maxValue;

  /// Creates a new instance of [_ColorSliders].
  const _ColorSliders({
    required this.colorState,
    required this.onColorChanged,
    required this.orientation,
    required this.isColorSliderVisible,
    required this.isAlphaSliderVisible,
    required this.isAlphaEnabled,
    required this.minValue,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    final thumbColor = FluentTheme.of(context).resources.focusStrokeColorOuter;
    // Determine if the sliders should be displayed horizontally or vertically
    final bool isVertical = orientation != Axis.vertical;

    final sliders = [
      if (isColorSliderVisible) _buildValueSlider(thumbColor, isVertical),
      if (isColorSliderVisible && isAlphaSliderVisible && isAlphaEnabled)
        orientation == Axis.vertical
            ? const SizedBox(height: ColorPickerSpacing.large)
            : const SizedBox(
                width: ColorPickerSpacing.large,
              ),
      if (isAlphaSliderVisible && isAlphaEnabled)
        _buildAlphaSlider(thumbColor, isVertical),
    ];

    return orientation == Axis.horizontal
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: sliders,
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: sliders,
          );
  }

  /// Builds the value slider for the color picker.
  Widget _buildValueSlider(Color thumbColor, bool isVertical) {
    final colorName = colorState.guessColorName();
    final valueText =
        '${(colorState.value * 100).round()}% ${colorName.isNotEmpty ? "($colorName)" : ""}';

    return SizedBox(
      width: isVertical ? ColorPickerSizes.slider : ColorPickerSizes.maxWidth,
      height: isVertical ? ColorPickerSizes.spectrum : ColorPickerSizes.slider,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: isVertical
                      ? Alignment.bottomCenter
                      : Alignment.centerLeft,
                  end: isVertical ? Alignment.topCenter : Alignment.centerRight,
                  colors: [
                    const Color(0xFF000000),
                    HSVColor.fromAHSV(1, math.max(0, colorState.hue),
                            math.max(0, colorState.saturation), 1.0)
                        .toColor(),
                  ],
                ),
              ),
            ),
            SliderTheme(
              data: SliderThemeData(
                activeColor: WidgetStatePropertyAll(thumbColor),
                trackHeight: const WidgetStatePropertyAll(0.0),
              ),
              child: Slider(
                label: valueText,
                vertical: isVertical,
                value: colorState.value,
                min: minValue / 100,
                max: maxValue / 100,
                onChanged: (value) =>
                    onColorChanged(colorState.copyWith(value: value)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the alpha slider for the color picker.
  Widget _buildAlphaSlider(Color thumbColor, bool isVertical) {
    final opacityText = '${(colorState.alpha * 100).round()}% opacity';

    return SizedBox(
      width: isVertical
          ? ColorPickerSizes.slider
          : ColorPickerSizes.spectrum +
              ColorPickerSpacing.small +
              ColorPickerSizes.preview,
      height: isVertical ? ColorPickerSizes.spectrum : ColorPickerSizes.slider,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(painter: CheckerboardPainter()),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: isVertical
                      ? Alignment.bottomCenter
                      : Alignment.centerLeft,
                  end: isVertical ? Alignment.topCenter : Alignment.centerRight,
                  colors: [
                    colorState.toColor().withAlpha(0),
                    colorState.toColor().withAlpha(255),
                  ],
                ),
              ),
            ),
            SliderTheme(
              data: SliderThemeData(
                activeColor: WidgetStatePropertyAll(thumbColor),
                trackHeight: const WidgetStatePropertyAll(0.0),
              ),
              child: Slider(
                label: opacityText,
                vertical: isVertical,
                value: colorState.alpha,
                min: 0,
                max: 1,
                onChanged: (value) =>
                    onColorChanged(colorState.copyWith(alpha: value)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A widget that displays the color inputs.
class _ColorInputs extends StatelessWidget {
  /// Map of color modes (RGB and HSV)
  static const Map<String, ColorMode> colorModes = {
    'RGB': ColorMode.rgb,
    'HSV': ColorMode.hsv,
  };

  /// Internal ValueNotifier for color mode management
  static final _colorModeNotifier = ValueNotifier<ColorMode>(ColorMode.rgb);

  /// The current color state
  final ColorState colorState;

  /// Callback when the color changes
  final ValueChanged<ColorState> onColorChanged;

  /// The orientation of the color picker layout
  final Axis orientation;

  /// Whether the "More" button is expanded
  final bool isMoreExpanded;

  /// Whether the "More" button is visible
  final bool isMoreButtonVisible;

  /// Whether the hex input is visible
  final bool isHexInputVisible;

  /// Whether the color channel text input is visible
  final bool isColorChannelTextInputVisible;

  /// Whether the alpha channel is enabled
  final bool isAlphaEnabled;

  /// Whether the alpha text input is visible
  final bool isAlphaTextInputVisible;

  /// Controller for the hex input
  final TextEditingController hexController;

  /// The minimum allowed hue value (0-359)
  final int minHue;

  /// The maximum allowed hue value (0-359)
  final int maxHue;

  /// The minimum allowed saturation value (0-100)
  final int minSaturation;

  /// The maximum allowed saturation value (0-100)
  final int maxSaturation;

  /// The minimum allowed value/brightness (0-100)
  final int minValue;

  /// The maximum allowed value/brightness (0-100)
  final int maxValue;

  /// Creates a new instance of [ColorInputs].
  const _ColorInputs({
    required this.colorState,
    required this.onColorChanged,
    required this.orientation,
    required this.isMoreExpanded,
    required this.isMoreButtonVisible,
    required this.isHexInputVisible,
    required this.isColorChannelTextInputVisible,
    required this.isAlphaEnabled,
    required this.isAlphaTextInputVisible,
    required this.minHue,
    required this.maxHue,
    required this.minSaturation,
    required this.maxSaturation,
    required this.minValue,
    required this.maxValue,
    required this.hexController,
  });

  @override
  Widget build(BuildContext context) {
    // Update hex input whenever colorState changes
    _updateHexControllerText();

    return ValueListenableBuilder<ColorMode>(
      valueListenable: _colorModeNotifier,
      builder: (context, colorMode, _) {
        final inputsContent = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (orientation != Axis.vertical ||
                !isMoreButtonVisible ||
                isMoreExpanded) ...[
              _buildColorModeAndHexInput(colorMode),
              colorMode == ColorMode.rgb
                  ? _buildRGBInputs()
                  : _buildHSVInputs(),
            ],
          ],
        );

        return orientation == Axis.vertical
            ? SizedBox(
                width: ColorPickerSizes.maxWidth,
                child: inputsContent,
              )
            : SizedBox(
                height: ColorPickerSizes.spectrum,
                width: 200, // arbitrary width, but more than enough
                child: inputsContent,
              );
      },
    );
  }

  /// Updates the hex controller text based on current color state
  void _updateHexControllerText() {
    final currentHex = colorState.toHexString(isAlphaEnabled);
    if (hexController.text != currentHex) {
      // Use text setter instead of direct assignment to handle text selection
      final selection = hexController.selection;
      hexController.text = currentHex;
      // Maintain cursor position if it was in a valid range
      if (selection.isValid && selection.start <= currentHex.length) {
        hexController.selection = selection;
      }
    }
  }

  /// Builds the color mode selector and hex input.
  Widget _buildColorModeAndHexInput(ColorMode colorMode) {
    final modeSelector = SizedBox(
      width: ColorPickerSizes.inputBox,
      child: ComboBox<ColorMode>(
        value: colorMode,
        items: colorModes.entries
            .map((e) => ComboBoxItem(value: e.value, child: Text(e.key)))
            .toList(),
        onChanged: (value) {
          if (value != null) _colorModeNotifier.value = value;
        },
      ),
    );

    final hexInput = SizedBox(
        width: ColorPickerSizes.inputBox,
        child: TextBox(
          controller: hexController,
          placeholder: isAlphaEnabled ? '#AARRGGBB' : '#RRGGBB',
          onSubmitted: _updateHexColor,
        ));

    return orientation == Axis.vertical
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (isColorChannelTextInputVisible) ...[
                modeSelector,
              ],
              if (isHexInputVisible) ...[
                hexInput,
              ],
            ],
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isHexInputVisible) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: hexInput,
                ),
                const SizedBox(height: ColorPickerSpacing.small),
              ],
              if (isColorChannelTextInputVisible) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: modeSelector,
                ),
              ],
            ],
          );
  }

  /// Builds the RGB input fields.
  Widget _buildRGBInputs() {
    // TODO: localize color channel labels
    return Column(
      children: [
        if (isColorChannelTextInputVisible) ...{
          _buildNumberInput(
            'Red',
            colorState.red * 255,
            (v) {
              final newState = colorState.copyWith(red: v / 255);
              onColorChanged(newState);
            },
            min: 0,
            max: 255,
          ),
          _buildNumberInput(
            'Green',
            colorState.green * 255,
            (v) {
              final newState = colorState.copyWith(green: v / 255);
              onColorChanged(newState);
            },
            min: 0,
            max: 255,
          ),
          _buildNumberInput(
            'Blue',
            colorState.blue * 255,
            (v) {
              final newState = colorState.copyWith(blue: v / 255);
              onColorChanged(newState);
            },
            min: 0,
            max: 255,
          ),
        },
        if (isAlphaEnabled && isAlphaTextInputVisible) ...[
          _buildNumberInput(
            'Opacity',
            colorState.alpha * 100,
            (v) {
              final newState = colorState.copyWith(alpha: v / 100);
              onColorChanged(newState);
            },
            min: 0,
            max: 100,
          ),
        ],
      ],
    );
  }

  /// Builds the HSV input fields.
  Widget _buildHSVInputs() {
    return Column(
      children: [
        if (isColorChannelTextInputVisible) ...{
          _buildNumberInput(
            'Hue',
            colorState.hue,
            (v) {
              final newState = colorState.copyWith(hue: v);
              onColorChanged(newState);
            },
            min: minHue.toDouble(),
            max: maxHue.toDouble(),
          ),
          _buildNumberInput(
            'Saturation',
            colorState.saturation * 100,
            (v) {
              final newState = colorState.copyWith(saturation: v / 100);
              onColorChanged(newState);
            },
            min: minSaturation.toDouble(),
            max: maxSaturation.toDouble(),
          ),
          _buildNumberInput(
            'Value',
            colorState.value * 100,
            (v) {
              final newState = colorState.copyWith(value: v / 100);
              onColorChanged(newState);
            },
            min: minValue.toDouble(),
            max: maxValue.toDouble(),
          ),
        },
        if (isAlphaEnabled && isAlphaTextInputVisible) ...[
          _buildNumberInput(
            'Opacity',
            colorState.alpha * 100,
            (v) {
              final newState = colorState.copyWith(alpha: v / 100);
              onColorChanged(newState);
            },
            min: 0,
            max: 100,
          ),
        ],
      ],
    );
  }

  /// Builds a number input field.
  Widget _buildNumberInput(
    String label,
    double value,
    Function(double) onChanged, {
    required double min,
    required double max,
  }) {
    // TODO: initial format issue of NumberBox not being applied.
    return Column(children: [
      const SizedBox(height: ColorPickerSpacing.small),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: ColorPickerSizes.inputBox,
            child: NumberBox<double>(
              value: value,
              min: min,
              max: max,
              mode: SpinButtonPlacementMode.none,
              clearButton: false,
              onChanged: (v) {
                if (v == null || v.isNaN || v.isInfinite) return;
                onChanged(v);
              },
              format: (v) => v?.round().toString(),
            ),
          ),
          const SizedBox(width: 5),
          Text(label),
        ],
      ),
    ]);
  }

  /// Updates the hex color value.
  void _updateHexColor(String text) {
    // Skip if the text is not a valid hex color length
    final expectedLength = isAlphaEnabled ? 9 : 7;
    if (text.length != expectedLength) {
      // Revert to current valid hex
      _updateHexControllerText();
      return;
    }

    try {
      final cleanText = text.startsWith('#') ? text.substring(1) : text;

      // Parse hex string with or without alpha
      int colorValue;
      double a = colorState.alpha; // Preserve existing alpha

      if (cleanText.length == 6) {
        // RGB format: Parse RGB and keep existing alpha
        colorValue = int.parse(cleanText, radix: 16);
      } else {
        // ARGB format: Parse both alpha and RGB
        colorValue = int.parse(cleanText, radix: 16);
        a = ((colorValue >> 24) & 0xFF) / 255.0;
      }

      // Extract color components
      final r = ((colorValue >> 16) & 0xFF) / 255.0;
      final g = ((colorValue >> 8) & 0xFF) / 255.0;
      final b = (colorValue & 0xFF) / 255.0;

      // Convert RGB to HSV
      final (h, s, v) = ColorState.rgbToHsv(r, g, b);

      // Create new ColorState
      final newState = ColorState(r, g, b, a, h, s, v);
      onColorChanged(newState);
    } catch (e) {
      debugPrint('Error parsing hex color: $e');
      // Revert to the current color's hex value
      final currentHex = colorState.toHexString(isAlphaEnabled);
      if (hexController.text != currentHex) {
        hexController.text = currentHex;
      }
    }
  }
}
