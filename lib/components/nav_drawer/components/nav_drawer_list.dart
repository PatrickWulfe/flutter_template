import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_template/utils/utils.dart';
import '../../components.dart';
import '../nav_drawer.dart';

class NavDrawerList extends StatelessWidget {
  const NavDrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = NavDrawerCubit();
    List<_ListItem> _list = _buildList();
    return BlocListener<NaviBloc, NaviState>(
      listener: (context, state) {
        cubit.updateSelected(state.pageConfig.uiPage);
      },
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: Pages.values.length,
        itemBuilder: (context, index) {
          return _buildItem(_list[index], cubit.state.selectedPage);
        },
      ),
    );
  }

  List<_ListItem> _buildList() {
    List<_ListItem> _list = [];

    // Create a header for the list
    _list.add(_ListItem(_ItemTypes.header, Text('Header')));

    // Create items for each page
    for (int i = 0; i < Pages.values.length - 1; i++) {
      _list.add(_ListItem(_ItemTypes.page, PageConfigs[i]));
    }
    return _list;
  }

  Widget _buildItem(_ListItem item, Pages selectedPage) {
    switch (item.type) {
      case _ItemTypes.header:
        return _buildHeader(item);
      case _ItemTypes.page:
        return _buildPageItem(
            item.listItem, (selectedPage == (item.listItem.uiPage as Pages)));
      default:
        return Container();
    }
  }

  Widget _buildHeader(_ListItem item) {
    return DrawerHeader(child: item.listItem);
  }

  Widget _buildPageItem(PageConfiguration pageConfig, bool selected) {
    return Card(
      color: selected ? Colors.blueAccent : Colors.white,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      borderOnForeground: true,
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Builder(
        builder: (context) {
          return ListTile(
            title: Text(
              pageConfig.name,
              style: TextStyle(
                  //color: selected ? Colors.black : Colors.blueGrey,
                  ),
            ),
            leading: Icon(
              pageConfig.icon,
              //color: selected ? Colors.black : Colors.blueGrey,
            ),
            onTap: () => _handlePageClick(context, pageConfig),
          );
        },
      ),
    );
  }

  _handlePageClick(BuildContext context, PageConfiguration pageConfig) {
    BlocProvider.of<NaviBloc>(context).add(NaviNavigate(pageConfig));
  }
}

enum _ItemTypes {
  header,
  page,
}

class _ListItem {
  final _ItemTypes type;
  final listItem;

  _ListItem(this.type, this.listItem);
}
