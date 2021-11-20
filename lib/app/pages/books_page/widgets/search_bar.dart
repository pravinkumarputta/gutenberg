import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gutenberg/app/styles/styles.dart';

class SearchBar extends StatefulWidget {
  final Function onInputChange;

  const SearchBar({this.onInputChange});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchInputController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // _searchInputController.addListener(() {
    //   this.widget.onInputChange(_searchInputController.value.text);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGray1,
        borderRadius: BorderRadius.circular(4),
      ),
      height: 40,
      child: TextField(
        controller: _searchInputController,
        autofocus: false,
        textInputAction: TextInputAction.search,
        onSubmitted: this.widget.onInputChange,
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.caption,
          hintText: 'Search',
          contentPadding: EdgeInsets.all(10),
          prefixIcon: SvgPicture.asset(
            'assets/icons/Search.svg',
            fit: BoxFit.scaleDown,
          ),
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: () {
              _searchInputController.clear();
              this.widget.onInputChange(_searchInputController.value.text);
            },
            icon: SvgPicture.asset(
              'assets/icons/Cancel.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
          fillColor: AppColors.lightGray1,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
