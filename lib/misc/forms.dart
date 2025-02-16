import 'package:bein_mobile/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

//The name that is supposed to appear at the top-left of the form field
class ValName extends StatelessWidget {
  final String name;
  const ValName({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 43),
        child: Text(
          name,
          style: const TextStyle(
              fontSize: 18, color: Color.fromARGB(255, 82, 80, 80)),
        ),
      ),
    );
  }
}

//Entering data into these form fields so they can be validated and submited.
class ValField extends StatelessWidget {
  final String hint;

  final TextEditingController controller;

  const ValField({
    super.key,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ListColors.borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(27),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ListColors.mainColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(27),
          ),
          hintText: hint,
        ),
      ),
    );
  }
}

//Profession MultiSelect
class MultiSelectFormField extends StatelessWidget {
  final List<String> items;
  final List<String>? selectedItems;
  final String? Function(List<String>?)? validator;
  final InputDecoration? decoration;
  final void Function(List<String>)? onConfirm;
  final String? title;
  final TextStyle? selectedItemsTextStyle;
  final DecoratedBox? decoratedBox;

  const MultiSelectFormField({
    super.key,
    required this.items,
    this.selectedItems,
    this.validator,
    this.decoration,
    this.onConfirm,
    this.title = "Select Professions",
    this.selectedItemsTextStyle,
    this.decoratedBox,
  });

  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField<String>(
      items: items.map((item) => MultiSelectItem<String>(item, item)).toList(),
      title: Text(title!),
      selectedItemsTextStyle:
          selectedItemsTextStyle ?? const TextStyle(color: Colors.black),
      selectedColor: Colors.black,
      decoration: const BoxDecoration(
          color: Colors.grey,
          border: Border(),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      onConfirm: (p0) {},
      validator: validator,
    );
  }
}

//Formfield
class StyledFormField extends StatefulWidget {
  final TextEditingController? controller;
  final bool isPassword;
  final String? Function(String?)? validator;
  final InputDecoration? decoration;
  final BoxDecoration? boxDecoration;
  final VoidCallback? onPressed;
  final void Function(String)? onChanged;
  final bool readonly;
  final Future<void>? future;
  final bool isDropdown;
  final bool isAddress;
  final List<String>? dropdownItems;
  final String? selectedItem;
  final bool? selected;
  final TextInputType? keyboardType;

  // Nullable color properties
  final Color? labelTextColor;
  final Color? hintTextColor;
  final Color? iconColor;
  final Color? borderColor;
  final Color? errorTextColor;
  final TextStyle? textStyle;

  const StyledFormField({
    super.key,
    this.controller,
    this.textStyle,
    this.isPassword = false,
    this.validator,
    this.decoration,
    this.boxDecoration,
    this.onPressed,
    this.onChanged,
    this.readonly = false,
    this.future,
    this.isDropdown = false,
    this.isAddress = false,
    this.dropdownItems,
    this.selectedItem,
    this.selected,
    this.keyboardType,
    this.labelTextColor,
    this.hintTextColor,
    this.iconColor,
    this.borderColor,
    this.errorTextColor,
  });

  @override
  State<StyledFormField> createState() => _StyledFormFieldState();
}

class _StyledFormFieldState extends State<StyledFormField> {
  bool _obscureText = true; // Initially, obscure password text

  @override
  Widget build(BuildContext context) {
    // If this is a dropdown field, render a dropdown
    if (widget.isDropdown && widget.dropdownItems != null) {
      return SizedBox(
        height: 80,
        child: DropdownButtonFormField<String>(
          value: widget.selectedItem,
          decoration: widget.decoration,
          items: widget.dropdownItems!.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: widget.textStyle),
            );
          }).toList(),
          onChanged: (String? value) {
            if (widget.onChanged != null && value != null) {
              widget.onChanged!(value);
            }
          },
          validator: widget.validator,
        ),
      );
    }

    // Render a TextFormField for regular text input
    return SizedBox(
      height: 80,
      width: 400,
      child: TextFormField(
        readOnly: widget.readonly,
        controller: widget.controller,
        onTap: widget.onPressed,
        onChanged: widget.onChanged,
        obscureText: widget.isPassword ? _obscureText : false,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        decoration: widget.decoration?.copyWith(
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText; // Toggle the visibility
                    });
                  },
                )
              : null,
        ),
        style: widget.textStyle ?? const TextStyle(color: Colors.black),
      ),
    );
  }
}

//Formfield Decoration
InputDecoration formS(
  String labelText,
  String? hintText,
  IconData? iconData, {
  Color? labelTextColor,
  Color? hintTextColor,
  Color? iconColor,
  Color? borderColor,
  Color? errorTextColor,
}) {
  return InputDecoration(
    errorStyle: TextStyle(
      fontSize: 12,
      color: errorTextColor ?? Colors.red,
    ),
    errorMaxLines: 3,
    prefixIcon: iconData != null
        ? Icon(
            iconData,
            color: iconColor ?? Colors.black,
          )
        : null,
    enabled: true,
    hintText: hintText,
    hintStyle: TextStyle(
      color: hintTextColor ?? Colors.grey,
    ),
    labelText: labelText,
    labelStyle: TextStyle(color: labelTextColor ?? Colors.black, fontSize: 20),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? Colors.black),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? Colors.black),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: errorTextColor ?? Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: errorTextColor ?? Colors.red),
    ),
  );
}

//formfield decorations for user registration and login
const enabledBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.black12,
    width: 1,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
);

const focusedBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.black,
    width: 2,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
);

const errorBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.red,
    width: 2,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
);

const focusedErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.red,
    width: 2,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
);
