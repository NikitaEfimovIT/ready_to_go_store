import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../cart_provider.dart';
import '../../models/Product.dart';
import '../../models/app_state.dart';

void showCategorySelectingModal(
    BuildContext context,
    Function selectHandler,
    Function updateGlobalState,
    List<String> _selected,
    Function clearSelection) {
  showModalBottomSheet(
    enableDrag: false,
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter modalSetState) {
          return Consumer<AppState>(
            builder: (context, state, child) => FractionallySizedBox(
              heightFactor: 0.65,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FutureBuilder<List<String>>(
                  future: state.categories,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<String>> snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Select categories",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 73, 8),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                ),
                              )),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Wrap(
                                spacing: 10,
                                runSpacing: 5,
                                children: List.generate(
                                  snapshot.data!.length,
                                  (index) {
                                    return ChoiceChip(
                                      onSelected: (e) {
                                        selectHandler(snapshot.data![index]);
                                        modalSetState(() {});
                                      },
                                      label: Text(snapshot.data![index]),
                                      selected: _selected
                                          .contains(snapshot.data![index]),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FilledButton(
                                  onPressed: () {
                                    updateGlobalState();
                                    Navigator.pop(context);
                                  },
                                  child: Text("Confirm"),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    clearSelection();
                                    modalSetState(() {});
                                  },
                                  child: Text("Clear"),
                                ),
                              ])
                        ],
                      );
                    }
                    return const Text("Categories not provided");
                  },
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
