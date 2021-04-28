part of 'settings_panel.dart';

class ThemeDropdown extends StatelessWidget {
  const ThemeDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsPageCubit pageCubit = BlocProvider.of<SettingsPageCubit>(context);
    List<DropdownMenuItem> _list = _getDropdownList();
    return Row(
      value: pageCubit.state.props.sele
      children: [
        Text('Theme options'),
        DropdownButton(items: _getDropdownList()),
      ],
    );
  }

  List<DropdownMenuItem> _getDropdownList() {
    return AppTheme.values.map((AppTheme value) {
      return DropdownMenuItem(child: Text(AppThemeName[value]!));
    }).toList();
  }
}
