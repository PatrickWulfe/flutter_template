import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core.dart';
import '../../../components.dart';
import '../components.dart';

class NavDrawerList extends StatelessWidget {
  ThemeCubit themeCubit;
  DrawerHeader header;
  NavDrawerList({Key? key, required this.themeCubit, required this.header})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<_ListItem> _list = _buildList();
    NavDrawerCubit drawerCubit = BlocProvider.of<NavDrawerCubit>(context);
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: Pages.values.length - NumPagesExluded + 2, // +1 for header
      itemBuilder: (context, index) {
        return _buildItem(_list[index], drawerCubit.state.selectedPage);
      },
    );
  }

  List<_ListItem> _buildList() {
    List<_ListItem> _list = [];

    // Placeholder for the header
    _list.add(_ListItem(_ItemTypes.header, null));

    // Create items for each page
    for (int i = 0; i < Pages.values.length - NumPagesExluded; i++) {
      _list.add(_ListItem(_ItemTypes.page, PageConfigs[i]));
    }

    // Add settings list item to the bottom
    _list.add(_ListItem(_ItemTypes.settings, SettingsConfig));
    return _list;
  }

  Widget _buildItem(_ListItem item, Pages selectedPage) {
    switch (item.type) {
      case _ItemTypes.header:
        return _buildHeader();
      case _ItemTypes.page:
        return _buildPageItem(
            item.listItem, (selectedPage == (item.listItem.uiPage as Pages)));
      case _ItemTypes.settings:
        return _buildSettingsTile();
      default:
        return Container();
    }
  }

  Widget _buildHeader() {
    return DrawerHeader(child: NavDrawerHeader());
  }

  Widget _buildPageItem(PageConfiguration pageConfig, bool selected) {
    Color _selectedColor = themeCubit.state.themeData.selectedRowColor;
    Color _bg = themeCubit.state.themeData.backgroundColor;
    return Card(
      color: selected ? _selectedColor : _bg,
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
                color: selected ? Colors.black : Colors.white,
              ),
            ),
            leading: Icon(
              pageConfig.icon,
              color: selected ? Colors.black : Colors.white,
            ),
            onTap: () => _handlePageClick(context, pageConfig),
          );
        },
      ),
    );
  }

  Widget _buildSettingsTile() {
    return _buildPageItem(SettingsConfig, false);
  }

  _handlePageClick(BuildContext context, PageConfiguration pageConfig) {
    BlocProvider.of<NaviBloc>(context).add(NaviNavigate(pageConfig));
  }
}

enum _ItemTypes {
  header,
  page,
  settings,
}

class _ListItem {
  final _ItemTypes type;
  final listItem;

  _ListItem(this.type, this.listItem);
}
