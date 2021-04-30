import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core.dart';
import '../../../widgets.dart';
import '../components.dart';

@immutable
class NavDrawerList extends StatelessWidget {
  final DrawerHeader header;
  const NavDrawerList({Key? key, required this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<_ListItem> _list = _buildList();
    NavDrawerCubit drawerCubit = BlocProvider.of<NavDrawerCubit>(context);
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: Pages.values.length - NumPagesExluded + 2, // +1 for header
      itemBuilder: (context, index) {
        return _buildItem(_list[index], context);
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

  Widget _buildItem(_ListItem item, BuildContext context) {
    switch (item.type) {
      case _ItemTypes.header:
        return _buildHeader();
      case _ItemTypes.page:
        return _buildPageItem(item.listItem, context);
      case _ItemTypes.settings:
        return _buildSettingsTile();
      default:
        return Container();
    }
  }

  Widget _buildHeader() {
    return DrawerHeader(child: NavDrawerHeader());
  }

  Widget _buildPageItem(PageConfiguration pageConfig, context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context);
    bool selected =
        BlocProvider.of<NavDrawerCubit>(context).state.selectedPage ==
            pageConfig.uiPage;
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
