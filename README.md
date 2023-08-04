# drop_down_multiselect


A Flutter package that provides a customizable multiselect dropdown widget.


## Features

- Allows users to select multiple options from a dropdown list.
- Customizable appearance and behavior.
- Supports both single and multiple selections.

## Getting Started

To use this package, add `dropdown_multi_select` as a dependency in your `pubspec.yaml` file.

dependencies:
  flutter:
    sdk: flutter
  multi_select_dropdown: ^1.0.0 # Replace with the latest version

USAGE:

1. Import the package in your Dart file.

    import 'package:dropdown_multi_select/dropdown_multi_select.dart';

2. Use the MultiSelectDropdown widget.

             MultiSelectDropdown(
                dropdownValueList: countries,
                selectedTileColor: Colors.lightBlue,
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                deleteIconColor: Colors.red,
                hint: "Select Country",
                onChanged: (selectedList) {
                  selectedValueList = selectedList;
                },
              ),

   

