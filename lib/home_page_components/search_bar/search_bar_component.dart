import 'package:flutter/material.dart';
import 'dart:async';

import 'package:provider/provider.dart';
import 'package:ready_to_go_store/models/app_state.dart';

class SearchBarComponent extends StatefulWidget {
  const SearchBarComponent({super.key});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarComponent> {
  String _query = '';
  Timer? _debounce;

  void _onSearchChanged(String query) {
    setState(() {
      _query = query;

      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        Provider.of<AppState>(context, listen: false).setSearchQuery(_query);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      child: TextField(

        onChanged: _onSearchChanged,
        decoration: const InputDecoration(

          hintText: 'Find item',
          hintStyle: TextStyle(
            color: Color.fromRGBO(151, 151, 151, 0.5)
          ),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 0.5,
                color: Color.fromRGBO(0, 23, 37, 0.30),
              )),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 0.5,
                color: Color.fromRGBO(0, 23, 37, 0.30),
              )),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              width: 0.5,
              color: Color.fromRGBO(0, 23, 37, 0.30),
            )
          ),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
