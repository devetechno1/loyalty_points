import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/extensions/string_ex.dart';

import '../../app_info.dart';
import '../utils/constants/app_color.dart';
import '../utils/constants/app_constants.dart';
import '../utils/helper/my_text_decoration.dart';

class MyDefaultField extends StatefulWidget {
  const MyDefaultField({
    super.key,
    this.labelText,
    this.controller,
    this.isDouble = false,
    this.isPhoneNumber = false,
    this.onChanged,
    this.onSaved,
    this.textAlign = TextAlign.start,
    this.validator,
    this.initialValue,
    this.maxLength,
    this.textInputAction = TextInputAction.next,
    this.textDirection,
    this.maxLines = 1,
    this.minLines,
    this.horizontalPadding,
    this.verticalPadding = 0,
    this.textAlignVertical = TextAlignVertical.center,
    this.alignLabelWithHint,
    this.textCapitalization = TextCapitalization.words,
    this.fieldKey,
    this.onFieldSubmitted,
    this.filled,
    this.fillColor,
    this.suffixIconColor,
    this.suffix,
    this.prefix,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.autofillHints,
    this.onEditingComplete,
    this.onPhoneInputChanged,
    this.inputFormatters,
    this.hintText,
    this.autofocus = false,
    this.style,
    this.hintStyle,
    this.focusNode,
    this.onPhoneInputSaved,
    this.onTap,
    this.countries,
    this.autoDispose = false,
  });
  final GlobalKey<FormFieldState>? fieldKey;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final bool isDouble;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final int? maxLength;
  final TextInputAction textInputAction;
  final TextDirection? textDirection;
  final int? maxLines;
  final int? minLines;
  final TextAlignVertical? textAlignVertical;
  final double? horizontalPadding;
  final double verticalPadding;
  final bool? alignLabelWithHint;
  final bool? filled;
  final bool isPhoneNumber;
  final Color? fillColor;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Color? suffixIconColor;
  final Widget? suffix;
  final Widget? prefix;
  final bool obscureText;
  final bool readOnly;
  final bool autofocus;
  final bool autoDispose;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final Iterable<String>? autofillHints;
  final List<String>? countries;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final void Function(PhoneNumber)? onPhoneInputChanged;
  final void Function(PhoneNumber)? onPhoneInputSaved;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<MyDefaultField> createState() => _MyDefaultFieldState();
}

class _MyDefaultFieldState extends State<MyDefaultField> {
  late TextDirection? textDirection = widget.textDirection;
  bool isValidPhone = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      detectDirections(widget.initialValue!);
    } else if (widget.controller?.text != null) {
      detectDirections(widget.controller!.text);
    }
  }

  @override
  void dispose() {
    if (widget.autoDispose) {
      widget.controller?.dispose();
      widget.focusNode?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isPhoneNumber) {
      return InternationalPhoneNumberInput(
        textFieldController: widget.controller,
        hintText: widget.hintText,
        countries: widget.countries,
        errorMessage: localeLang(context).invalidPhoneNumber,
        selectorConfig: SelectorConfig(
          leadingPadding: widget.horizontalPadding ?? AppConst.paddingDefault,
          trailingSpace: false,
          selectorType: PhoneInputSelectorType.DIALOG,
          setSelectorButtonAsPrefixIcon: true,
        ),
        selectorTextStyle: widget.style,
        keyboardAction: widget.textInputAction,
        formatInput: false,
        onInputChanged: (PhoneNumber phone) {
          if (widget.onPhoneInputChanged != null) {
            widget.onPhoneInputChanged!(removeZerosInFirstNum(phone));
          }
        },
        focusNode: widget.focusNode,
        autofillHints: widget.autofillHints,
        maxLength: widget.maxLength ?? 15,
        initialValue: PhoneNumber(
          isoCode: AppInfo.initCountryIsoCode,
          phoneNumber: widget.initialValue,
        ),
        onInputValidated: (value) => isValidPhone = value,
        validator: (val) {
          if (val?.isNotEmpty != true) return localeLang(context).fillField;

          if (!isValidPhone) return localeLang(context).invalidPhoneNumber;

          return null;
        },
        keyboardType: TextInputType.phone,
        textAlignVertical: widget.textAlignVertical ?? TextAlignVertical.center,
        onSaved: (PhoneNumber phone) {
          if (widget.onPhoneInputSaved != null) {
            widget.onPhoneInputSaved!(removeZerosInFirstNum(phone));
          }
        },
        textAlign: widget.textAlign,
        onFieldSubmitted: widget.onFieldSubmitted,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        fieldKey: widget.fieldKey,
        isEnabled: !widget.readOnly,
        textStyle: widget.style,
        inputDecoration: InputDecoration(
          enabled: !widget.readOnly,
          filled: widget.filled,
          fillColor: widget.fillColor,
          suffixIconColor: widget.suffixIconColor,
          border: MyTextFieldDecoration.border,
          enabledBorder: MyTextFieldDecoration.enabledBorder,
          constraints: const BoxConstraints(maxWidth: AppConst.constraint),
          alignLabelWithHint: widget.alignLabelWithHint,
          labelText: widget.labelText,
          hintStyle:
              widget.hintStyle ?? const TextStyle(color: AppColor.borderColor),
          suffixIcon: widget.suffix,
          prefixIcon: widget.prefix,
          hintText: widget.hintText,
          contentPadding: EdgeInsets.symmetric(
            vertical: widget.verticalPadding,
            horizontal: widget.horizontalPadding ?? 22,
          ),
        ),
      );
    }
    return PopScope(
      onPopInvokedWithResult: (_, __) => FocusScope.of(context).unfocus(),
      child: TextFormField(
        obscureText: widget.obscureText,
        focusNode: widget.focusNode,
        onTap: widget.onTap,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          filled: widget.filled,
          fillColor: widget.fillColor,
          suffixIconColor: widget.suffixIconColor,
          border: MyTextFieldDecoration.border,
          enabledBorder: MyTextFieldDecoration.enabledBorder,
          constraints: const BoxConstraints(maxWidth: AppConst.constraint),
          alignLabelWithHint: widget.alignLabelWithHint,
          labelText: widget.labelText,
          hintStyle: widget.hintStyle ?? const TextStyle(color: Colors.grey),
          suffixIcon: widget.suffix,
          prefixIcon: widget.prefix,
          hintText: widget.hintText,
          contentPadding: EdgeInsets.symmetric(
            horizontal: widget.horizontalPadding ?? 22,
            vertical: widget.verticalPadding,
          ),
        ),
        readOnly: widget.readOnly,
        textDirection: textDirection,
        autofillHints: widget.autofillHints,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        maxLength: widget.maxLength,
        initialValue: widget.initialValue,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: widget.keyboardType ??
            (widget.isDouble ? TextInputType.number : TextInputType.text),
        inputFormatters: widget.inputFormatters,
        key: widget.fieldKey,
        onChanged: (val) {
          detectDirections(val);
          if (widget.onChanged != null) widget.onChanged!(val);
        },
        textCapitalization: widget.textCapitalization,
        textAlignVertical: widget.textAlignVertical,
        onSaved: widget.onSaved,
        validator: widget.validator,
        textAlign: widget.textAlign,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onFieldSubmitted,
        onEditingComplete: widget.onEditingComplete,
        enableSuggestions: true,
        autofocus: widget.autofocus,
        style: widget.style,
        enabled: !widget.readOnly,
      ),
    );
  }

  void detectDirections(String val) {
    if (widget.textDirection == null) {
      textDirection = val.direction;
      setState(() {});
    }
  }

  PhoneNumber removeZerosInFirstNum(PhoneNumber phone) {
    return PhoneNumber(
      phoneNumber: "${phone.dialCode}${phone.parseNumber().removeZerosInFirst}",
      dialCode: phone.dialCode,
      isoCode: phone.isoCode,
    );
  }
}
