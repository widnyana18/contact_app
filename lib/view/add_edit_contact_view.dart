import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddEditContactView extends StatefulWidget {
  final bool editMode;
  const AddEditContactView({
    super.key,
    this.editMode = false,
  });

  @override
  State<AddEditContactView> createState() => _AddEditContactViewState();
}

class _AddEditContactViewState extends State<AddEditContactView> {
  ValueNotifier<String> _selectedAccount = ValueNotifier('Google 1');
  ValueNotifier<int> _telepon = ValueNotifier(0);
  ValueNotifier<List<String>> _txtFieldList = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: DropdownButton(
          isExpanded: true,
          isDense: true,
          items: _storage.entries.map(
            (item) {
              return DropdownMenuItem(
                child: ListTile(
                  title: Text(
                    item.key,
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(item.value),
                ),
                value: item.key,
              );
            },
          ).toList(),
          value: _selectedAccount.value,
          selectedItemBuilder: (context) => [
            Text('Keep to ${_selectedAccount.value}'),
          ],
          onChanged: (key) {
            _selectedAccount.value = key!;
          },
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          color: Colors.black,
          icon: Icon(Icons.close_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            color: Colors.black,
            icon: Icon(Icons.done_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 12),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.account_circle),
                  iconSize: 55,
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(hintText: 'Name'),
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Company'),
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Position'),
                ),
                ...List.generate(
                  2,
                  (index) => TextField(
                    decoration: InputDecoration(
                      hintText: 'Telepon',
                      prefix: SizedBox(
                        width: 130,
                        child: ValueListenableBuilder(
                          valueListenable: _telepon,
                          builder: (context, value, child) {
                            return SmartSelect<int>.single(
                              placeholder: '',
                              choiceConfig: S2ChoiceConfig(
                                physics: NeverScrollableScrollPhysics(),
                              ),
                              modalConfig: S2ModalConfig(
                                enableDrag: false,
                                maxHeightFactor: 1,
                              ),
                              title: '',
                              selectedValue: value,
                              choiceItems: _phoneType,
                              choiceBuilder: (context, state, choice) {
                                return ListTile(
                                  title: Text(choice.title!),
                                  textColor: Colors.blue,
                                  onTap: () => choice.select!(true),
                                );
                              },
                              onChange: (selected) {
                                _telepon.value = selected.value;
                              },
                              modalType: S2ModalType.bottomSheet,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: _txtFieldList,
                  builder: (context, value, child) => Column(
                    children: value
                        .map(
                          (item) => TextField(
                            decoration: InputDecoration(hintText: item),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(height: 16),
                ListTile(
                  onTap: () {},
                  title: Text('Group name'),
                  trailing: Icon(Icons.navigate_next_rounded),
                ),
                SizedBox(height: 16),
                FilledButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      useSafeArea: true,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return Material(
                          color: Colors.white,
                          child: IntrinsicHeight(
                            child: Column(
                              children: _columnOpt
                                  .map<Widget>((item) => ListTile(
                                        title: Text(item),
                                        onTap: () {
                                          context.pop();
                                          _txtFieldList.value =
                                              _txtFieldList.value.toList()
                                                ..add(item);
                                          _columnOpt.remove(item);
                                        },
                                      ))
                                  .toList()
                                ..insert(
                                  0,
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: Text('Add other column'),
                                  ),
                                ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text('Add other column'),
                ),
                Offstage(
                  offstage: !widget.editMode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 16),
                      Divider(),
                      SizedBox(height: 16),
                      Text('Imported from'),
                      SizedBox(height: 8),
                      Text('Contact google'),
                      Text('miranda2coen@xxx.id'),
                      SizedBox(height: 16),
                      FilledButton(
                        onPressed: () {},
                        child: Text('Merge contact'),
                      ),
                      SizedBox(height: 8),
                      FilledButton(
                        onPressed: () {},
                        child: Text('Delete one contact'),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  List<S2Choice<int>> _phoneType = [
    S2Choice<int>(value: 0, title: 'Native'),
    S2Choice<int>(value: 1, title: 'Office'),
    S2Choice<int>(value: 2, title: 'Home'),
    S2Choice<int>(value: 3, title: 'Main'),
    S2Choice<int>(value: 4, title: 'Office fax'),
    S2Choice<int>(value: 5, title: 'Home fax'),
    S2Choice<int>(value: 6, title: 'Pager'),
    S2Choice<int>(value: 7, title: 'Other'),
    S2Choice<int>(value: 8, title: 'Special'),
  ];

  List<String> _columnOpt = [
    'Phonetics name',
    'Instant message',
    'Address',
    'Nickname',
    'Website',
    'Internet calling',
    'Birthday',
    'Relation',
    'Notes',
  ];

  Map<String, String> _storage = {
    'Google 1': 'midnight@club.ru.id',
    'Mi account': '27891276',
    'Google 2': 'narcos99@duno.id',
  };
}
