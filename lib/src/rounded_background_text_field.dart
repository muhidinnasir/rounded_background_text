import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'rounded_background_text.dart';

/// A wrapper around [RoundedBackgroundText] and [TextField]
class RoundedBackgroundTextField extends StatefulWidget {
  const RoundedBackgroundTextField({
    Key? key,
    required this.controller,
    this.style,
    this.backgroundColor,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.textScaleFactor,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines,
    this.cursorWidth = 2.0,
    this.cursorColor,
    this.cursorHeight,
    this.cursorRadius,
    this.keyboardType,
    this.hint,
    this.hintStyle,
    this.innerRadius = kDefaultInnerFactor,
    this.outerRadius = kDefaultOuterFactor,
    this.autofocus = false,
    this.focusNode,
    this.keyboardAppearance = Brightness.light,
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.autocorrect = true,
    this.autofillClient,
    this.autofillHints,
    this.clipBehavior = Clip.hardEdge,
    this.enableIMEPersonalizedLearning = true,
    this.enableSuggestions = true,
    this.forceLine = true,
    this.inputFormatters,
    this.mouseCursor,
    this.obscureText = false,
    this.obscuringCharacter = '*',
    this.readOnly = false,
    this.rendererIgnoresPointer = false,
    this.restorationId,
    this.showCursor = true,
    this.showSelectionHandles = true,
    this.smartDashesType = SmartDashesType.enabled,
    this.smartQuotesType = SmartQuotesType.enabled,
    this.textInputAction,
    this.toolbarOptions = const ToolbarOptions(),
    this.onSelectionChanged,
  }) : super(key: key);

  final TextEditingController controller;

  /// The final text style
  ///
  /// The font size will be reduced if there isn't enough space for the text
  final TextStyle? style;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// {@macro flutter.widgets.editableText.textDirection}
  final TextDirection? textDirection;

  /// {@macro flutter.widgets.editableText.textCapitalization}
  final TextCapitalization textCapitalization;

  /// {@macro flutter.widgets.editableText.textScaleFactor}
  final double? textScaleFactor;

  /// {@macro rounded_background_text.background_color}
  final Color? backgroundColor;

  final int? maxLines;

  /// {@macro flutter.widgets.editableText.cursorWidth}
  final double cursorWidth;

  /// {@macro flutter.widgets.editableText.cursorHeight}
  final double? cursorHeight;

  /// {@macro flutter.widgets.editableText.cursorRadius}
  final Radius? cursorRadius;

  /// The color of the cursor.
  ///
  /// The cursor indicates the current location of text insertion point in
  /// the field.
  ///
  /// If this is null it will default to the ambient
  /// [TextSelectionThemeData.cursorColor]. If that is null, and the
  /// [ThemeData.platform] is [TargetPlatform.iOS] or [TargetPlatform.macOS]
  /// it will use [CupertinoThemeData.primaryColor]. Otherwise it will use
  /// the value of [ColorScheme.primary] of [ThemeData.colorScheme].
  final Color? cursorColor;

  /// {@macro flutter.widgets.editableText.keyboardType}
  final TextInputType? keyboardType;

  /// The type of action button to use with the soft keyboard.
  final TextInputAction? textInputAction;

  /// The text hint
  final String? hint;

  /// The text style for [hint]
  final TextStyle? hintStyle;

  /// {@macro rounded_background_text.innerRadius}
  final double innerRadius;

  /// {@macro rounded_background_text.outerRadius}
  final double outerRadius;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.editableText.autofocus}
  final bool autofocus;

  /// The appearance of the keyboard.
  ///
  /// This setting is only honored on iOS devices.
  ///
  /// Defaults to [Brightness.light].
  final Brightness keyboardAppearance;

  /// {@macro flutter.widgets.editableText.enableInteractiveSelection}
  final bool enableInteractiveSelection;

  /// {@macro flutter.widgets.editableText.selectionControls}
  final TextSelectionControls? selectionControls;

  /// {@macro flutter.widgets.editableText.selectionEnabled}
  bool get selectionEnabled => enableInteractiveSelection;

  /// {@macro flutter.widgets.editableText.readOnly}
  final bool readOnly;

  /// Whether the text will take the full width regardless of the text width.
  ///
  /// When this is set to false, the width will be based on text width, which
  /// will also be affected by [textWidthBasis].
  ///
  /// Defaults to true. Must not be null.
  ///
  /// See also:
  ///
  ///  * [textWidthBasis], which controls the calculation of text width.
  final bool forceLine;

  /// Configuration of toolbar options.
  ///
  /// By default, all options are enabled. If [readOnly] is true,
  /// paste and cut will be disabled regardless.
  final ToolbarOptions toolbarOptions;

  /// Whether to show selection handles.
  ///
  /// When a selection is active, there will be two handles at each side of
  /// boundary, or one handle if the selection is collapsed. The handles can be
  /// dragged to adjust the selection.
  ///
  /// See also:
  ///
  ///  * [showCursor], which controls the visibility of the cursor.
  final bool showSelectionHandles;

  /// {@macro flutter.widgets.editableText.showCursor}
  ///
  /// See also:
  ///
  ///  * [showSelectionHandles], which controls the visibility of the selection handles.
  final bool showCursor;

  /// {@macro flutter.widgets.editableText.autocorrect}
  final bool autocorrect;

  /// {@macro flutter.services.TextInputConfiguration.smartDashesType}
  final SmartDashesType smartDashesType;

  /// {@macro flutter.services.TextInputConfiguration.smartQuotesType}
  final SmartQuotesType smartQuotesType;

  /// {@macro flutter.services.TextInputConfiguration.enableSuggestions}
  final bool enableSuggestions;

  /// {@macro flutter.widgets.editableText.autofillHints}
  /// {@macro flutter.services.AutofillConfiguration.autofillHints}
  final Iterable<String>? autofillHints;

  /// The [AutofillClient] that controls this input field's autofill behavior.
  ///
  /// When null, this widget's [EditableTextState] will be used as the
  /// [AutofillClient]. This property may override [autofillHints].
  final AutofillClient? autofillClient;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.hardEdge].
  final Clip clipBehavior;

  /// Restoration ID to save and restore the scroll offset of the
  /// [EditableText].
  ///
  /// If a restoration id is provided, the [EditableText] will persist its
  /// current scroll offset and restore it during state restoration.
  ///
  /// The scroll offset is persisted in a [RestorationBucket] claimed from
  /// the surrounding [RestorationScope] using the provided restoration ID.
  ///
  /// Persisting and restoring the content of the [EditableText] is the
  /// responsibility of the owner of the [controller], who may use a
  /// [RestorableTextEditingController] for that purpose.
  ///
  /// See also:
  ///
  ///  * [RestorationManager], which explains how state restoration works in
  ///    Flutter.
  final String? restorationId;

  /// {@macro flutter.services.TextInputConfiguration.enableIMEPersonalizedLearning}
  final bool enableIMEPersonalizedLearning;

  final List<TextInputFormatter>? inputFormatters;

  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// widget.
  ///
  /// If this property is null, [SystemMouseCursors.text] will be used.
  ///
  /// The [mouseCursor] is the only property of [EditableText] that controls the
  /// appearance of the mouse pointer. All other properties related to "cursor"
  /// stands for the text cursor, which is usually a blinking vertical line at
  /// the editing position.
  final MouseCursor? mouseCursor;

  /// If true, the [RenderEditable] created by this widget will not handle
  /// pointer events, see [RenderEditable] and [RenderEditable.ignorePointer].
  ///
  /// This property is false by default.
  final bool rendererIgnoresPointer;

  /// {@macro flutter.widgets.editableText.obscuringCharacter}
  final String obscuringCharacter;

  /// {@macro flutter.widgets.editableText.obscureText}
  final bool obscureText;

  /// {@macro flutter.widgets.editableText.onSelectionChanged}
  final SelectionChangedCallback? onSelectionChanged;

  @override
  _RoundedBackgroundTextFieldState createState() =>
      _RoundedBackgroundTextFieldState();
}

class _RoundedBackgroundTextFieldState
    extends State<RoundedBackgroundTextField> {
  double finalScale = 1.0;

  FocusNode? _focusNode;
  FocusNode get _effectiveFocusNode =>
      widget.focusNode ?? (_focusNode ??= FocusNode());

  final fieldKey = GlobalKey<EditableTextState>();

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleTextChange);
    scrollController.addListener(() => setState(() {}));
  }

  void _handleTextChange() {
    // scale();
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleTextChange);
    scrollController.dispose();
    super.dispose();
  }

  Size getSize() {
    RenderBox box = context.findRenderObject() as RenderBox;
    return box.size;
  }

  double scale() {
    final size = getSize();

    final painter = TextPainter(
      text: TextSpan(
          text: widget.controller.text,
          style: widget.style?.copyWith(
            height: calculateHeight(
              (widget.style?.fontSize ?? 16) * finalScale,
            ),
          )),
      textDirection: widget.textDirection ?? TextDirection.ltr,
      maxLines: widget.maxLines,
      textAlign: widget.textAlign,
      // textWidthBasis: widget.textWidthBasis ?? TextWidthBasis.parent,
      // textScaleFactor: widget.textScaleFactor,
      // strutStyle: widget.strutStyle,
      // locale: widget.locale,
      // textHeightBehavior: widget.textHeightBehavior,
      // ellipsis: widget.ellipsis,
    )..layout(maxWidth: size.width);

    final scale = (size.height / painter.size.height).clamp(0.0, 1.0);
    // debugPrint('${size.height}/${painter.size.height} - $scale');

    if (finalScale != scale && mounted) {
      setState(() => finalScale = scale);
    }

    return finalScale;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextSelectionThemeData selectionTheme =
        TextSelectionTheme.of(context);
    final defaultTextStyle = DefaultTextStyle.of(context);

    final fontSize =
        (widget.style?.fontSize ?? defaultTextStyle.style.fontSize ?? 16) *
            finalScale;

    TextSelectionControls? textSelectionControls = widget.selectionControls;
    final bool paintCursorAboveText;
    final bool cursorOpacityAnimates;
    Offset? cursorOffset;
    Color? cursorColor = widget.cursorColor;
    final Color selectionColor;
    Color? autocorrectionTextRectColor;
    Radius? cursorRadius = widget.cursorRadius;

    switch (theme.platform) {
      case TargetPlatform.iOS:
        final CupertinoThemeData cupertinoTheme = CupertinoTheme.of(context);
        textSelectionControls ??= cupertinoTextSelectionControls;
        paintCursorAboveText = true;
        cursorOpacityAnimates = true;
        cursorColor ??=
            selectionTheme.cursorColor ?? cupertinoTheme.primaryColor;
        selectionColor = selectionTheme.selectionColor ??
            cupertinoTheme.primaryColor.withOpacity(0.40);
        cursorRadius ??= const Radius.circular(2.0);
        cursorOffset = Offset(
            iOSHorizontalOffset / MediaQuery.of(context).devicePixelRatio, 0);
        autocorrectionTextRectColor = selectionColor;
        break;

      case TargetPlatform.macOS:
        final CupertinoThemeData cupertinoTheme = CupertinoTheme.of(context);
        textSelectionControls ??= cupertinoDesktopTextSelectionControls;
        paintCursorAboveText = true;
        cursorOpacityAnimates = true;
        cursorColor ??=
            selectionTheme.cursorColor ?? cupertinoTheme.primaryColor;
        selectionColor = selectionTheme.selectionColor ??
            cupertinoTheme.primaryColor.withOpacity(0.40);
        cursorRadius ??= const Radius.circular(2.0);
        cursorOffset = Offset(
            iOSHorizontalOffset / MediaQuery.of(context).devicePixelRatio, 0);
        break;

      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        textSelectionControls ??= materialTextSelectionControls;
        paintCursorAboveText = false;
        cursorOpacityAnimates = false;
        cursorColor ??= selectionTheme.cursorColor ?? theme.colorScheme.primary;
        selectionColor = selectionTheme.selectionColor ??
            theme.colorScheme.primary.withOpacity(0.40);
        break;

      case TargetPlatform.linux:
      case TargetPlatform.windows:
        textSelectionControls ??= desktopTextSelectionControls;
        paintCursorAboveText = false;
        cursorOpacityAnimates = false;
        cursorColor ??= selectionTheme.cursorColor ?? theme.colorScheme.primary;
        selectionColor = selectionTheme.selectionColor ??
            theme.colorScheme.primary.withOpacity(0.40);
        break;
    }

    Alignment alignment = () {
      switch (widget.textAlign) {
        case TextAlign.justify:
        case TextAlign.center:
          return Alignment.center;
        case TextAlign.left:
        case TextAlign.start:
          return Alignment.centerLeft;
        case TextAlign.right:
        case TextAlign.end:
          return Alignment.centerRight;
      }
    }();

    // if (scrollController.hasClients) print(scrollController.position.pixels);

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      children: [
        const Positioned.fill(child: SizedBox.expand()),
        if (widget.controller.text.isNotEmpty)
          Positioned.fill(
            top: scrollController.hasClients
                ? -scrollController.position.pixels
                : null,
            child: IgnorePointer(
              child: Container(
                alignment: alignment,
                padding: const EdgeInsets.only(
                  right: 2.0,
                  left: 1.0,
                  bottom: 3.0,
                ),
                child: RoundedBackgroundText.rich(
                  // widget.controller.text,
                  // style: (widget.style ?? const TextStyle())
                  //     .copyWith(fontSize: fontSize),
                  text: widget.controller.buildTextSpan(
                    context: context,
                    withComposing: !widget.readOnly,
                    style: widget.style,
                  ),
                  textAlign: widget.textAlign,
                  backgroundColor: widget.backgroundColor,
                  innerRadius: widget.innerRadius,
                  outerRadius: widget.outerRadius,
                  textDirection: widget.textDirection,
                  textScaleFactor: widget.textScaleFactor ?? 1.0,
                ),
              ),
            ),
          )
        else if (widget.hint != null)
          Text(
            widget.hint!,
            style: (widget.hintStyle ?? TextStyle(color: theme.hintColor))
                .copyWith(
              fontSize: fontSize,
              height: calculateHeight(fontSize),
            ),
            textAlign: widget.textAlign,
            maxLines: widget.maxLines,
          ),
        Positioned.fill(
          child: EditableText(
            key: fieldKey,
            autofocus: widget.autofocus,
            controller: widget.controller,
            focusNode: _effectiveFocusNode,
            // The text field can't be scrollable because
            // [RoundedBackgroundText] can't follow the scroll
            // scrollPhysics: const NeverScrollableScrollPhysics(),
            // scrollBehavior: const ScrollBehavior(),
            scrollController: scrollController,

            style: (widget.style ?? const TextStyle()).copyWith(
              // color: Colors.transparent,
              color: Colors.amber,
              fontSize: fontSize,
              height: calculateHeight(fontSize),
              leadingDistribution: TextLeadingDistribution.proportional,
            ),
            textAlign: widget.textAlign,
            maxLines: widget.maxLines,
            keyboardType: widget.keyboardType,
            backgroundCursorColor: CupertinoColors.inactiveGray,
            cursorColor: widget.cursorColor ??
                widget.style?.color ??
                foregroundColor(widget.backgroundColor) ??
                selectionTheme.cursorColor ??
                Colors.black,
            cursorWidth: widget.cursorWidth,
            cursorHeight: widget.cursorHeight,
            cursorRadius: widget.cursorRadius,
            paintCursorAboveText: paintCursorAboveText,
            cursorOpacityAnimates: cursorOpacityAnimates,
            cursorOffset: cursorOffset,
            autocorrectionTextRectColor: autocorrectionTextRectColor,
            scrollPadding: EdgeInsets.zero,
            textCapitalization: widget.textCapitalization,
            keyboardAppearance: widget.keyboardAppearance,
            textScaleFactor: widget.textScaleFactor,
            enableInteractiveSelection: widget.enableInteractiveSelection,
            selectionColor: selectionColor,
            selectionControls:
                widget.selectionEnabled ? textSelectionControls : null,
            textDirection: widget.textDirection,
            showSelectionHandles: widget.showSelectionHandles,
            showCursor: widget.showCursor,
            textWidthBasis: TextWidthBasis.parent,
            autocorrect: widget.autocorrect,
            forceLine: widget.forceLine,
            readOnly: widget.readOnly,
            toolbarOptions: widget.toolbarOptions,
            smartDashesType: widget.smartDashesType,
            smartQuotesType: widget.smartQuotesType,
            enableSuggestions: widget.enableSuggestions,
            autofillHints: widget.autofillHints,
            autofillClient: widget.autofillClient,
            clipBehavior: widget.clipBehavior,
            restorationId: widget.restorationId,
            enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
            inputFormatters: widget.inputFormatters,
            mouseCursor: widget.mouseCursor,
            rendererIgnoresPointer: widget.rendererIgnoresPointer,
            obscureText: widget.obscureText,
            obscuringCharacter: widget.obscuringCharacter,
            textInputAction: widget.textInputAction,
            onSelectionChanged: widget.onSelectionChanged,
          ),
        ),
      ],
    );
  }
}
