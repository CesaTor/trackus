import 'package:flutter/material.dart';
import 'package:trackus/core/core.dart';
import 'package:trackus/features/add_item/presentation/widgets/item_color.dart';
import 'package:trackus/features/add_item/presentation/widgets/item_color_picker.dart';

class AddItem extends StatefulWidget {
  const AddItem({
    required this.onAdd,
    super.key,
  });

  final void Function(String title, Color color) onAdd;

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  late Color selectedColor;
  late String chosenTitle;

  late TextEditingController titleC;

  @override
  void initState() {
    selectedColor = defaultColor;
    chosenTitle = '';
    titleC = TextEditingController(text: chosenTitle);
    titleC.addListener(() => setState(() => chosenTitle = titleC.text));

    super.initState();
  }

  @override
  void dispose() {
    titleC.dispose();
    super.dispose();
  }

  void onSave() {
    if (chosenTitle.isNotEmpty) widget.onAdd(chosenTitle, selectedColor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: Container(
            color: Theme.of(context).appBarTheme.backgroundColor,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemColor(color: selectedColor),
                  const SizedBox(width: 8),
                  // IntrinsicWidth(
                  //   child:
                  Flexible(
                    child: TextFormField(
                      minLines: 1,
                      maxLines: 5,
                      controller: titleC,
                      decoration: const InputDecoration(
                        hintText: 'New Project',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  // ),
                  // Flexible(
                  //   child: TextField(
                  //     controller: controller,
                  //     decoration: InputDecoration(
                  //       hintText: 'New Project',
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
        actions: chosenTitle.isNotEmpty
            ? [
                TextButton(
                  onPressed: onSave,
                  child: Text(
                    i18n.add.save,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ]
            : null,
      ),
      body: ItemColorPicker(
        onChanged: (c) => setState(() => selectedColor = c),
        selectedColor: selectedColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: chosenTitle.isNotEmpty
          ? MaterialButton(
              shape: roudedShape,
              color: Theme.of(context).colorScheme.primaryContainer,
              onPressed: onSave,
              child: Text(
                i18n.add.save,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          : null,
    );
  }
}
