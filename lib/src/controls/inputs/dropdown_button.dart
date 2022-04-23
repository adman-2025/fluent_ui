import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';

const double _kVerticalOffset = 20.0;
const Widget _kDefaultDropdownButtonTrailing = Icon(
  FluentIcons.chevron_down,
  size: 10,
);

/// A DropDownButton is a button that shows a chevron as a visual indicator that
/// it has an attached flyout that contains more options. It has the same
/// behavior as a standard Button control with a flyout; only the appearance is
/// different.
///
/// ![DropDownButton Showcase](https://docs.microsoft.com/en-us/windows/apps/design/controls/images/drop-down-button-align.png)
///
/// See also:
///
///   * [Flyout], a light dismiss container that can show arbitrary UI as its
///  content. Used to back this button
///   * [Combobox], a list of items that a user can select from
///   * <https://docs.microsoft.com/en-us/windows/apps/design/controls/buttons#create-a-drop-down-button>
class DropDownButton extends StatefulWidget {
  /// Creates a dropdown button.
  const DropDownButton({
    Key? key,
    required this.items,
    this.leading,
    this.title,
    this.trailing,
    this.verticalOffset = _kVerticalOffset,
    this.closeAfterClick = true,
    this.disabled = false,
    this.focusNode,
    this.autofocus = false,
    this.buttonStyle,
    this.placement = FlyoutPlacement.center,
    this.menuShape,
    this.menuColor,
  })  : assert(items.length > 0, 'You must provide at least one item'),
        super(key: key);

  /// The content at the start of this widget.
  ///
  /// Usually an [Icon]
  final Widget? leading;

  /// Title show a content at the center of this widget.
  ///
  /// Usually a [Text]
  final Widget? title;

  /// Trailing show a content at the right of this widget.
  ///
  /// If null, a chevron_down is displayed.
  final Widget? trailing;

  /// The space between the button and the flyout.
  ///
  /// 20.0 is used by default
  final double verticalOffset;

  /// The items in the flyout. Must not be empty
  final List<MenuFlyoutItem> items;

  /// Whether the flyout will be closed after an item is tapped
  final bool closeAfterClick;

  /// If `true`, the button won't be clickable.
  final bool disabled;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Customizes the button's appearance.
  final ButtonStyle? buttonStyle;

  /// The placement of the overlay. Centered by default
  final FlyoutPlacement placement;

  /// The menu shape
  final ShapeBorder? menuShape;

  /// The menu color. If null, [ThemeData.menuColor] is used
  final Color? menuColor;

  @override
  State<DropDownButton> createState() => _DropDownButtonState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<MenuFlyoutItemInterface>('items', items))
      ..add(DoubleProperty(
        'verticalOffset',
        verticalOffset,
        defaultValue: _kVerticalOffset,
      ))
      ..add(FlagProperty(
        'close after click',
        value: closeAfterClick,
        defaultValue: false,
        ifFalse: 'do not close after click',
      ))
      ..add(EnumProperty<FlyoutPlacement>('placement', placement))
      ..add(DiagnosticsProperty<ShapeBorder>('menu shape', menuShape))
      ..add(ColorProperty('menu color', menuColor));
  }
}

class _DropDownButtonState extends State<DropDownButton> {
  final flyoutController = FlyoutController();

  @override
  void dispose() {
    flyoutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasFluentTheme(context));
    assert(debugCheckHasDirectionality(context));

    final buttonChildren = <Widget>[
      if (widget.leading != null)
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 8.0),
          child: IconTheme.merge(
            data: const IconThemeData(size: 20.0),
            child: widget.leading!,
          ),
        ),
      if (widget.title != null) widget.title!,
      Padding(
        padding: const EdgeInsetsDirectional.only(start: 8.0),
        child: widget.trailing ?? _kDefaultDropdownButtonTrailing,
      ),
    ];

    return Flyout(
      placement: widget.placement,
      position: FlyoutPosition.below,
      controller: flyoutController,
      verticalOffset: widget.verticalOffset,
      child: Button(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: buttonChildren,
        ),
        onPressed: widget.disabled ? null : flyoutController.open,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        style: widget.buttonStyle,
      ),
      content: (context) {
        return MenuFlyout(
          color: widget.menuColor,
          shape: widget.menuShape,
          items: widget.items.map((item) {
            if (widget.closeAfterClick) {
              return MenuFlyoutItem(
                onPressed: () {
                  item.onPressed?.call();
                  flyoutController.close();
                },
                key: item.key,
                leading: item.leading,
                text: item.text,
                trailing: item.trailing,
              );
            }
            return item;
          }).toList(),
        );
      },
    );
  }
}
