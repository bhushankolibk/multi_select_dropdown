library dropdown_multi_select;

import 'package:flutter/material.dart';

class DropdownMultiSelect extends StatefulWidget {
  const DropdownMultiSelect({
    Key? key,
    required this.dropdownValueList,
    required this.selectedTileColor,
    required this.onChanged,
    this.deleteIconColor,
    this.hint,
    this.hintStyle,
    this.itemTextStyle,
    this.decoration,
    this.trailingIcon,
    this.selectedItemBackgroundColor,
    this.selectedItemTextStyle,
  }) : super(key: key);

  final List<String> dropdownValueList;
  final Color selectedTileColor;
  /// Called when the user selects an item and return list<String>
  final ValueChanged<List<String>> onChanged;
  final Color? deleteIconColor;
  final String? hint;


  final TextStyle? hintStyle;
  final TextStyle? itemTextStyle;
  final Decoration? decoration;
  final Icon? trailingIcon;
  final Color? selectedItemBackgroundColor;
  final TextStyle? selectedItemTextStyle;

  @override
  State<DropdownMultiSelect> createState() => _DropdownMultiSelectState();
}

class _DropdownMultiSelectState extends State<DropdownMultiSelect> {
  late List<String> list;
  late List<String> listOFSelectedTeam = [];
  late Color selectedTileColor;

  @override
  void initState() {
    list = widget.dropdownValueList;
    selectedTileColor = widget.selectedTileColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter stateSetter) {
        return InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (ctx) {
                  return Dialog(child: StatefulBuilder(
                      builder: (BuildContext ctx, StateSetter state) {
                    return Scrollbar(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: list.map((e) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  title: Text(
                                    e,
                                    style: widget.itemTextStyle ??
                                        const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                  ),
                                  tileColor: listOFSelectedTeam.contains(e)
                                      ? selectedTileColor
                                      : null,
                                  onTap: () {
                                    if (listOFSelectedTeam.contains(e)) {
                                      listOFSelectedTeam.remove(e);
                                    } else {
                                      listOFSelectedTeam.add(e);
                                    }
                                    widget.onChanged(listOFSelectedTeam);

                                    stateSetter(() {});
                                    state(() {});
                                  },
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  }));
                });
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: widget.decoration ??
                const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 2.0,
                        color:  Colors.grey
                            ),
                  ),
                ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: listOFSelectedTeam.isEmpty
                      ? Text(
                          widget.hint ?? "Select Item",
                          style: widget.hintStyle ??
                              const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                        )
                      : Wrap(
                          children: listOFSelectedTeam.map(
                          (e) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 2,
                                right: 2,
                              ),
                              child: Chip(
                                label: Text("$e ",
                                    style: widget.selectedItemTextStyle ?? TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black.withOpacity(0.8))),
                                deleteIcon: const Icon(
                                  Icons.delete,
                                ),
                                backgroundColor: widget.selectedItemBackgroundColor ?? Colors.grey,
                                deleteIconColor: widget.deleteIconColor ?? Colors.black,
                                onDeleted: () {
                                  stateSetter(() {
                                    listOFSelectedTeam.remove(e);
                                    widget.onChanged(listOFSelectedTeam);
                                  });
                                },
                              ),
                            );
                          },
                        ).toList()),
                ),
               widget.trailingIcon ?? const Icon(
                 Icons.arrow_drop_down,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
