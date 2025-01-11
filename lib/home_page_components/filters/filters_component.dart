import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ready_to_go_store/home_page_components/filters/category_selection_modal_view.dart';

import '../../models/app_state.dart';

class FilterComponents extends StatefulWidget {
  const FilterComponents({super.key});

  @override
  State<StatefulWidget> createState() => _FilterComponentsState();
}

class _FilterComponentsState extends State<FilterComponents> {
  List<String> selectedCat = [];

  void changeSelectedCategories(String category) {
    setState(() {
      if (selectedCat.contains(category)) {
        selectedCat.remove(category);
      } else {
        selectedCat.add(category);
      }
    });
  }

  void clearSelection(){
    setState(() {
      selectedCat.clear();
    });
  }


  void useSelectedCategories() {
    Provider.of<AppState>(context, listen: false)
        .updateSelectedCategories(selectedCat);
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [ OutlinedButton(
        onPressed: () => showCategorySelectingModal(
            context, (category) => changeSelectedCategories(category), ()=>useSelectedCategories(), selectedCat, ()=>clearSelection()),
        child: Text("Select categories"),
      style: OutlinedButton.styleFrom(
        side: BorderSide(

              style: BorderStyle.solid,
              width: 0.5,
              color: Color.fromRGBO(0, 23, 37, 0.30),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),

    )]);
  }
}
