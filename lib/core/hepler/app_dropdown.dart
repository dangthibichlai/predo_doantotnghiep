import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/resources/app_color.dart';

class AppropDownButton<T> extends StatefulWidget {
  const AppropDownButton({
    Key? key,
    this.hint = "",
    this.onChanged,
    this.data,
    this.width,
    this.height,
    required this.value,
    this.label,
    this.labelStyle,
    required this.isRequired,
    this.isEnable = true,
    this.isSort = true,
    this.padding,
    this.margin,
    this.textStyleValue,
    this.borderRadius,
    this.colorBorder,
    this.backgroundColor,
    this.iconDropdown,
    this.textStyleHintText,
    this.selectedItemBuilder,
    this.prefixWidget,
    this.alignmentText,
    this.style,
  }) : super(key: key);

  final String? hint;
  final double? width, height;
  final Function(T? value)? onChanged;

  final String? label;
  final TextStyle? labelStyle;
  final bool? isRequired;
  final List<T>? data;
  final T? value;
  final Icon? iconDropdown;
  final bool? isEnable;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool? isSort;
  final TextStyle? textStyleValue;
  final TextStyle? textStyleHintText;
  final double? borderRadius;
  final Color? colorBorder;
  final Color? backgroundColor;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final Widget Function(T value)? prefixWidget;
  final Alignment? alignmentText;
  final TextStyle? style;
  @override
  State<AppropDownButton<T>> createState() => _AppIDropDownButtonState<T>();
}

class _AppIDropDownButtonState<T> extends State<AppropDownButton<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? SizeApp.getMaxWidth(),
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        children: [
          if (widget.label != null)
            Container(
              padding: SizeApp.setEdgeInsetsOnly(bottom: 5),
              // alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: widget.label,
                  style: widget.labelStyle ??
                      Theme.of(context).textTheme.labelMedium,
                  children: [
                    if (widget.isRequired!)
                      TextSpan(
                          text: ' *',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: ColorResources.RED))
                    else
                      const TextSpan(),
                  ],
                ),
              ),
            ),
          SizedBox(
            height: widget.height,
            child: FormField(
              enabled: widget.isEnable!,
              builder: (field) {
                return InputDecorator(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: widget.margin ?? EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: SizeApp.setBorderRadiusAll(
                          radius: widget.borderRadius ?? SizeApp.RADIUS_MEDIUM),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.colorBorder ??
                            ColorResources.WHITE.withOpacity(.3),
                      ),
                      borderRadius: SizeApp.setBorderRadiusAll(
                          radius: widget.borderRadius ?? SizeApp.RADIUS_MEDIUM),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.colorBorder ??
                            ColorResources.WHITE.withOpacity(.3),
                      ),
                      borderRadius: SizeApp.setBorderRadiusAll(
                          radius: widget.borderRadius ?? SizeApp.RADIUS_MEDIUM),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.colorBorder ??
                            ColorResources.WHITE.withOpacity(.3),
                      ),
                      borderRadius: SizeApp.setBorderRadiusAll(
                          radius: widget.borderRadius ?? SizeApp.RADIUS_MEDIUM),
                    ),
                    isDense: true,
                    filled: true,
                    fillColor:
                        widget.backgroundColor ?? ColorResources.PRIMARY_1,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<T>(
                      iconStyleData: IconStyleData(
                        icon: widget.iconDropdown ??
                            const Icon(
                              Icons.arrow_drop_down_outlined,
                            ),
                        iconEnabledColor: ColorResources.BLACK,
                        iconDisabledColor: ColorResources.BLACK,
                      ),
                      autofocus: true,
                      hint: Text(
                        widget.hint!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: widget.textStyleHintText,
                      ),
                      isDense: true,
                      isExpanded: true,
                      value: widget.value,
                      selectedItemBuilder: (context) {
                        return widget.data!
                            .map(
                              (e) => DropdownMenuItem<T>(
                                value: e,
                                child: Center(
                                  child: Text(
                                    e.toString(),
                                    style: widget.style ??
                                        Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: ColorResources.BLACK,
                                            ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            )
                            .toList();
                      },
                      style: widget.textStyleValue ??
                          Theme.of(context).textTheme.displayLarge,
                      alignment: Alignment.center,
                      onChanged: widget.isEnable!
                          ? (val) {
                              widget.onChanged?.call(val);
                            }
                          : null,
                      items: widget.data
                          ?.map(
                            (e) => DropdownMenuItem<T>(
                              alignment:
                                  widget.alignmentText ?? Alignment.centerLeft,
                              value: e,
                              child: widget.prefixWidget != null
                                  ? widget.prefixWidget!(e)
                                  : Center(
                                      child: Text(
                                        e.toString(),
                                        textAlign: TextAlign.center,
                                        maxLines: 3,
                                        style: widget.textStyleValue ??
                                            Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  color: widget
                                                              .value.hashCode ==
                                                          e.hashCode
                                                      ? ColorResources.PRIMARY_1
                                                      : ColorResources
                                                          .OUTER_SPACE,
                                                  fontWeight:
                                                      widget.value.hashCode ==
                                                              e.hashCode
                                                          ? FontWeight.w600
                                                          : FontWeight.w400,
                                                ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
