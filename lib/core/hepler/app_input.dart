// ignore_for_file: must_be_immutable, invalid_use_of_protected_member, avoid_positional_boolean_parameters

import 'package:test_intern/core/hepler/app_input.dart';

import '../../resources/export/core_export.dart';
export 'package:flutter/cupertino.dart';

class AppInput extends StatefulWidget {
  AppInput({
    Key? key,
    this.label,
    this.placeHolder,
    this.allowEdit = true,
    this.maxLine = 1,
    this.isRequired = false,
    required this.type,
    this.width,
    this.fontSize,
    this.height,
    this.suffixIcon,
    this.errorText,
    this.textInputAction,
    this.onChanged,
    this.isValidate,
    this.focusNode,
    this.onSubmitted,
    this.borderRadius,
    this.hintStyle,
    this.borderSide,
    this.isBorder = false,
    this.fillColor,
    this.prefixIcon,
    this.validate,
    this.isLegend = false,
    this.borderSize,
    this.disableError = false,
    this.miniSize = false,
    this.colorDisibleBorder = ColorResources.GREY,
    this.colorBorder = ColorResources.GREEN,
    this.min = 1,
    this.max = 10,
    this.widthIncrement,
    this.appPickerDate = AppPickerDate.MATERIAL,
    this.obscureText,
    this.contentPaddingIncrement,
    this.onTap,
    this.isNotShadown = true,
    this.labelStyle,
    this.isTimePicker = false,
    this.maximumDate,
    this.minimumDate,
    this.initDate,
    this.style,
    this.cursorColor,
    this.controller,
    this.inputFormatters,
    this.autofocus,
    this.cupertinoDatePickerMode,
    this.textCapitalization,
    this.isReadOnly = false,
    this.textAlign,
    this.format,
    this.maxLength,
    this.maxLengthInput,
    this.hintText,
    this.underLine,
  }) : super(key: key);
  final String? label;
  final int? maxLength;
  final UnderlineInputBorder? underLine;
  final String? hintText;
  final String? placeHolder;
  final bool? allowEdit;
  final int? maxLine;
  final AppInputType type;
  final bool? isRequired;
  final double? width;
  final double? fontSize;
  final double? height;
  final Widget? suffixIcon;
  final String? errorText;
  final TextInputAction? textInputAction;
  final Function(String value)? onChanged;
  final Function(bool value)? isValidate;
  bool? boldHinText;
  final FocusNode? focusNode;
  final Function(dynamic)? onSubmitted;
  final double? borderRadius;
  final TextStyle? hintStyle;
  final BorderSide? borderSide;
  final bool? isBorder;
  final Color? fillColor;
  final Widget Function(FocusNode? focusNode)? prefixIcon;
  final String? Function(String)? validate;
  final bool? isLegend;
  final double? borderSize;
  final bool disableError;
  final bool miniSize;
  final Color? colorDisibleBorder;
  final Color? colorBorder;
  final double? min;
  final double? max;
  final double? widthIncrement;
  final bool? isTimePicker;
  final AppPickerDate? appPickerDate;
  final bool? obscureText;
  final EdgeInsets? contentPaddingIncrement;
  final Function? onTap;
  final bool? isNotShadown;
  final TextStyle? labelStyle;
  final DateTime? maximumDate;
  final DateTime? minimumDate;
  final DateTime? initDate;
  final TextStyle? style;
  final Color? cursorColor;

  final bool? autofocus;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final CupertinoDatePickerMode? cupertinoDatePickerMode;
  final TextCapitalization? textCapitalization;
  final bool? isReadOnly;
  final TextAlign? textAlign;
  final String? format;
  final int? maxLengthInput;

  _IZIInputState iziState = _IZIInputState();
  @override
  // ignore: no_logic_in_create_state
  _IZIInputState createState() => iziState = _IZIInputState();
}

class _IZIInputState extends State<AppInput> {
  FocusNode? focusNode;
  TextEditingController? textEditingController;

  bool isShowedError = false;
  bool isVisible = true;
  bool isDisibleIncrement = false;
  bool isDisibleReduction = false;
  String? _errorText = "";

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: '');

    focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    Future.delayed(Duration.zero, () {
      focusNode?.removeListener(() {});
      focusNode?.dispose();
      focusNode = null;
    });
    textEditingController?.dispose();
    super.dispose();
  }

  TextInputType getType(AppInputType type) {
    if (type == AppInputType.NUMBER) {
      return TextInputType.number;
    } else if (type == AppInputType.PASSWORD) {
      return TextInputType.visiblePassword;
    } else if (type == AppInputType.PRICE) {
      return TextInputType.number;
    } else if (type == AppInputType.TEXT) {
      return TextInputType.text;
    } else if (type == AppInputType.EMAIL) {
      return TextInputType.emailAddress;
    } else if (type == AppInputType.PHONE) {
      return TextInputType.phone;
    } else if (type == AppInputType.DOUBLE) {
      return const TextInputType.numberWithOptions();
    } else if (type == AppInputType.INCREMENT) {
      return TextInputType.number;
    } else if (type == AppInputType.MULTILINE) {
      return TextInputType.multiline;
    } else if (type == AppInputType.DATE) {
      return TextInputType.datetime;
    }
    return TextInputType.text;
  }

  TextEditingController getController(AppInputType type) {
    return widget.controller ?? textEditingController!;
  }

  String? Function(String)? checkValidate(
    AppInputType type,
  ) {
    if (widget.validate != null) {
      return widget.validate;
    }
    if (type == AppInputType.NUMBER) {
      return null;
    } else if (type == AppInputType.PASSWORD) {
      return AppValidate.password;
    } else if (type == AppInputType.PRICE) {
      return null;
    } else if (type == AppInputType.TEXT) {
      return null;
    } else if (type == AppInputType.EMAIL) {
      return null;
    } else if (type == AppInputType.PHONE) {
      return null;
    } else {
      return null;
    }
  }

  ///
  /// Validate.
  ///
  void validator(AppInputType type, String val) {
    if (checkValidate(widget.type) != null && isShowedError) {
      setState(() {
        _errorText = checkValidate(widget.type)!(val.toString());
        print("error: $_errorText");
      });
      if (widget.isValidate != null) {
        widget.isValidate!(AppValidate.nullOrEmpty(_errorText));
      }
    }
  }

  ///
  /// Date picker.
  ///
  void datePicker(AppPickerDate pickerType) {
    if (pickerType == AppPickerDate.CUPERTINO) {
      FocusScope.of(context).unfocus();
      _showDatePickerOfCupertino();
    } else {
      _showDatePickerOfMaterial().then(
        (value) {
          if (!AppValidate.nullOrEmpty(value)) {
            final String date = AppDate.formatDate(value!, format: widget.format ?? 'dd/MM/yyyy');

            getController(widget.type).text = date;

            if (!AppValidate.nullOrEmpty(widget.onChanged)) {
              // Data trả về hàm onChange.
              widget.onChanged!(date);
            }
          }
        },
      );
    }
  }

  Future<dynamic> _showDatePickerOfCupertino() {
    return showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: ColorResources.WHITE,
        ),
        height: SizeApp.setSize(percent: .45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                width: SizeApp.getMaxWidth(),
                height: SizeApp.setSize(percent: .4),
                child: CupertinoDatePicker(
                  mode: widget.isTimePicker!
                      ? widget.cupertinoDatePickerMode ?? CupertinoDatePickerMode.time
                      : widget.cupertinoDatePickerMode ?? CupertinoDatePickerMode.date,
                  use24hFormat: true,
                  initialDateTime: widget.initDate ?? widget.minimumDate ?? DateTime.now(),
                  maximumDate: widget.maximumDate ?? DateTime.now().add(const Duration(days: 18250)),
                  minimumDate: widget.minimumDate ?? DateTime.now().subtract(const Duration(days: 18250)),
                  onDateTimeChanged: (value) {
                    onChangeDateTime(value);
                  },
                ),
              ),
            ),
            Padding(
              padding: SizeApp.setEdgeInsetsOnly(bottom: SizeApp.SPACE_3X),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      getController(widget.type).text = '';
                      Get.back();
                    },
                    child: Container(
                      padding: SizeApp.setEdgeInsetsSymmetric(vertical: 10),
                      width: SizeApp.getMaxWidth() * .35,
                      decoration: BoxDecoration(
                        color: ColorResources.GREY,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          'Xóa',
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(color: ColorResources.WHITE),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      final now = DateTime.now();
                      // Lấy data ở controller.
                      final value = getController(widget.type).text;

                      if (AppValidate.nullOrEmpty(value)) {
                        if (widget.isTimePicker!) {
                          onChangeDateTime(now);

                          CommonHelper.primaryFocus();
                        } else {
                          onChangeDateTime(now);
                        }
                      } else {
                        try {
                          if (widget.isTimePicker!) {
                            final date = AppDate.formatDate(now, format: widget.format ?? 'dd/MM/yyyy');
                            onChangeDateTime(
                              AppDate.parseDateTime('$date $value', format: widget.format ?? 'dd/MM/yyyy hh:mm'),
                            );
                          } else {
                            onChangeDateTime(
                              AppDate.parseDateTime(value, format: widget.format ?? 'dd/MM/yyyy'),
                            );
                          }
                        } catch (e) {
                          onChangeDateTime(now);
                        }
                      }

                      Get.back();
                    },
                    child: Container(
                      padding: SizeApp.setEdgeInsetsSymmetric(vertical: 10),
                      width: SizeApp.getMaxWidth() * .35,
                      decoration: BoxDecoration(
                        color: ColorResources.PRIMARY_2,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          'Chọn',
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(color: ColorResources.WHITE),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onChangeDateTime(DateTime value) {
    // Nếu là chọn giờ
    if (widget.isTimePicker!) {
      if (widget.cupertinoDatePickerMode == CupertinoDatePickerMode.dateAndTime) {
        final String date = AppDate.formatDate(value, format: widget.format ?? 'HH:mm dd/MM/yyyy');

        // Set data cho controller
        getController(widget.type).text = date;

        // Nếu onChange ! null
        if (!AppValidate.nullOrEmpty(widget.onChanged)) {
          widget.onChanged!(date);
        }
      } else {
        getController(widget.type).text = AppDate.formatDate(value, format: widget.format ?? 'HH:mm'); //date;

        // Nếu hàm onChange != null
        if (!AppValidate.nullOrEmpty(widget.onChanged)) {
          widget.onChanged!(AppDate.formatDate(value, format: widget.format ?? 'HH:mm dd/MM/yyyy'));
        }
      }
      CommonHelper.primaryFocus();
    } else {
      final String date = AppDate.formatDate(value);

      // Set data và controller.
      getController(widget.type).text = date;

      // Nếu onChange ! null
      if (!AppValidate.nullOrEmpty(widget.onChanged)) {
        widget.onChanged!(date);
      }
    }
  }

  ///
  /// Date picker material.
  ///
  Future<DateTime?> _showDatePickerOfMaterial() {
    return showDatePicker(
      context: context,
      initialDate: widget.initDate ?? widget.minimumDate ?? DateTime.now(),
      firstDate: widget.minimumDate ?? DateTime.now().subtract(const Duration(days: 18250)),
      lastDate: widget.maximumDate ?? DateTime.now().add(const Duration(days: 18250)),
      builder: (context, child) {
        return Theme(
          data: AppTheme.light.copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorResources.PRIMARY_2,
            ),
          ),
          child: child!,
        );
      },
    );
  }

  Widget? getSuffixIcon() {
    if (widget.type == AppInputType.DATE && AppValidate.nullOrEmpty(widget.suffixIcon)) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calendar_month)
          // IZIImage(
          //   ImagesPath.pickDateIcon,
          //   width: IZIDimensions.ONE_UNIT_SIZE * 30,
          // ),
        ],
      );
      // return const Icon(
      //   Icons.calendar_today,
      //   color: ColorResources.NEUTRALS_4,
      // );
    }
    if (widget.type == AppInputType.PASSWORD) {
      return GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Icon(
          isVisible ? Icons.visibility_off : Icons.visibility,
          color: ColorResources.TEXT_BOLD.withOpacity(0.37),
        ),
      );
    }
    if (!AppValidate.nullOrEmpty(widget.suffixIcon)) {
      return widget.suffixIcon!;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (!focusNode!.hasListeners) {
      focusNode!.addListener(() {
        setState(() {});
      });
    }
    if (!AppValidate.nullOrEmpty(widget.errorText) && AppValidate.nullOrEmpty(_errorText)) {
      _errorText = widget.errorText.toString();
    }

    return SizedBox(
      width: widget.width ?? SizeApp.getMaxWidth(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.isLegend == false && widget.label != null) _labelInput(), // Label của input
          Row(
            children: [
              _formInput(), // Input
            ],
          ),

          if (!AppValidate.nullOrEmpty(_errorText) && !widget.disableError) _errorTextWidget(), // Lỗi ở input
        ],
      ),
    );
  }

  Container _labelInput() {
    return Container(
      padding: SizeApp.setEdgeInsetsOnly(bottom: 5),
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: widget.label,
          style: widget.labelStyle ??
              Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ColorResources.WHITE,
                    fontSize: 16.sp,
                  ),
          children: [
            if (widget.isRequired!)
              TextSpan(
                text: ' *',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: ColorResources.RED,
                    ),
              )
            else
              const TextSpan(),
          ],
        ),
      ),
    );
  }

  Container _errorTextWidget() {
    return Container(
      margin: SizeApp.setEdgeInsetsOnly(top: 5),
      alignment: Alignment.topLeft,
      child: Text(
        AppValidate.nullOrEmpty(_errorText.toString()) ? "" : _errorText.toString(),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(
          color: ColorResources.RED,
        ),
      ),
    );
  }

  Widget _formInput() {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          if (widget.type == AppInputType.DATE && widget.allowEdit!) {
            datePicker(widget.appPickerDate!);
          }
        },
        child: Container(
          decoration: BoxDecoration(
              boxShadow: widget.isNotShadown! ? null : CommonHelper.boxShadow,
              color: widget.fillColor ?? ColorResources.WHITE.withOpacity(.1),
              borderRadius: SizeApp.setBorderRadiusAll(
                radius: widget.borderRadius ?? SizeApp.RADIUS_2X,
              )),
          width: AppInputType.INCREMENT == widget.type ? widget.width ?? SizeApp.setSize(percent: 0.1) : null,
          height: widget.miniSize ? 30 : widget.height,
          child: TextFormField(
            readOnly: widget.isReadOnly!,
            autofocus: widget.autofocus ?? false,
            onTap: () {
              if (!AppValidate.nullOrEmpty(widget.onTap)) {
                widget.onTap!();
              }
            },
            textAlign: AppInputType.INCREMENT == widget.type ? TextAlign.center : widget.textAlign ?? TextAlign.start,
            onFieldSubmitted: (val) {
              // Gọi hàm submit
              if (!AppValidate.nullOrEmpty(widget.onSubmitted)) {
                widget.onSubmitted!(val);
              }
              if (!AppValidate.nullOrEmpty(val) && AppInputType.INCREMENT == widget.type) {
                if (AppNumber.parseInt(val) < widget.min!) {
                  getController(widget.type).text = AppNumber.parseInt(widget.min.toString()).toString();
                }
              }
            },
            onChanged: (val) {
              isShowedError = true;
              if (widget.onChanged != null) {
                widget.onChanged!(val);
                // onIncrement(widget.type, increment: true);
              }
              validator(widget.type, val.toString());
            },
            maxLength: widget.maxLengthInput,
            textInputAction: widget.textInputAction,
            keyboardType: getType(widget.type),
            maxLines: widget.maxLine,
            textAlignVertical: TextAlignVertical.center,
            enabled: widget.type == AppInputType.DATE ? false : widget.allowEdit,
            controller: getController(widget.type),
            obscureText: widget.obscureText ?? widget.type == AppInputType.PASSWORD && isVisible,
            focusNode: focusNode,
            inputFormatters: _getInputFormatters(widget.type),
            style: widget.style ??
                Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: ColorResources.BLACK,
                    ),
            cursorColor: widget.cursorColor ?? ColorResources.PRIMARY_1,
            textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
            decoration: InputDecoration(
              hintText: widget.hintText,
              counterStyle: widget.maxLengthInput != null
                  ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorResources.BLACK.withOpacity(.5),
                      )
                  : null,
              hintStyle: widget.hintStyle ??
                  Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ColorResources.NEUTRALS_5,
                        fontWeight: FontWeight.normal,
                      ),
              contentPadding: widget.miniSize
                  ? const EdgeInsets.all(5)
                  : widget.contentPaddingIncrement ??
                      SizeApp.setEdgeInsetsSymmetric(
                        vertical: SizeApp.SPACE_1X,
                        horizontal: SizeApp.SPACE_1X,
                      ),
              isDense: true,
              labelText: widget.isLegend == true ? widget.label : null,
              labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: focusNode!.hasFocus ? FontWeight.w600 : FontWeight.normal,
                  ),
              prefixIcon: AppValidate.nullOrEmpty(widget.prefixIcon) ? null : widget.prefixIcon!(focusNode),
              border: widget.underLine ?? getOutlineInputBorder(),

              // focusedBorder: getOutlineInputBorder(),
              // enabledBorder: getOutlineInputBorder(),
              // disabledBorder: getOutlineInputBorder(),
              filled: true,
              fillColor: (widget.allowEdit == false)
                  ? widget.fillColor ?? ColorResources.LIGHT_GREY.withOpacity(0.4)
                  : widget.fillColor ?? Colors.transparent,
              suffixIcon: getSuffixIcon(),
            ),
          ),
        ),
      ),
    );
  }

  ///
  /// Get outlineInputBorder
  ///
  OutlineInputBorder getOutlineInputBorder() {
    BorderSide borderSide = BorderSide.none;
    if (widget.isBorder == true || widget.isLegend == true) {
      borderSide = widget.borderSide ?? UnderlineInputBorder().borderSide;
      // BorderSide(
      //   width: widget.borderSize ?? 1,
      //   color: (widget.allowEdit == false) ? Color.fromARGB(255, 11, 196, 199) : Color.fromARGB(255, 11, 196, 199),
      // );
    }

    return OutlineInputBorder(
      borderSide: borderSide,
      borderRadius: SizeApp.setBorderRadiusAll(
        radius: widget.borderRadius ?? SizeApp.RADIUS_2X,
      ),
    );
  }

  ///
  /// Get input formatters.
  ///
  List<TextInputFormatter> _getInputFormatters(AppInputType type) {
    List<TextInputFormatter> resultFormat = [];

    if (widget.type == AppInputType.NUMBER) {
      resultFormat = [FilteringTextInputFormatter.digitsOnly];
    }
    if (widget.type == AppInputType.PRICE) {
      final locale = sl<SharedPreferenceHelper>().getLocale;
      resultFormat = [
        CurrencyTextInputFormatter(
          symbol: '',
          decimalDigits: 0,
          locale: locale.isEmpty ? 'vi' : locale,
        ),
      ];
    }
    if (widget.type == AppInputType.DOUBLE) {
      final locale = sl<SharedPreferenceHelper>().getLocale;

      final currentLocale = locale.isEmpty ? 'vi' : locale.toString();
      resultFormat = [
        ThousandsSeparatorDecimalInputFormatter(
          locale: currentLocale,
          separator: locale == 'vi' ? '.' : ',',
          decimalSeparator: locale == 'vi' ? ',' : '.',
        ),
      ];
    }
    return widget.inputFormatters ??
        [
          ...resultFormat,
          if (!AppValidate.nullOrEmpty(widget.maxLength)) LengthLimitingTextInputFormatter(widget.maxLength),
        ];
  }
}

class ThousandsSeparatorDecimalInputFormatter extends TextInputFormatter {
  ThousandsSeparatorDecimalInputFormatter({
    this.locale = 'vi',
    required this.decimalSeparator,
    required this.separator,
  });
  String? locale;
  String separator;
  String decimalSeparator;
  static const int decimalDigits = 2;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String newText = newValue.text.replaceAll(separator, '');
    final List<String> parts = newText.split(decimalSeparator);

    String integerPart = parts[0];
    if (integerPart.isNotEmpty) {
      final regEx = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
      integerPart = integerPart.replaceAllMapped(regEx, (Match m) => '${m[1]}$separator');
    }

    newText = integerPart;
    if (parts.length > 1) {
      String decimalPart = parts[1];
      if (decimalPart.length > decimalDigits) {
        decimalPart = decimalPart.substring(0, decimalDigits);
      }
      newText += '$decimalSeparator$decimalPart';
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
