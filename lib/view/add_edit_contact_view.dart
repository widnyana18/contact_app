import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddEditContactView extends StatefulWidget {
  const AddEditContactView({super.key});

  @override
  State<AddEditContactView> createState() => _AddEditContactViewState();
}

class _AddEditContactViewState extends State<AddEditContactView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: DropdownButton(
          isExpanded: true,
          isDense: true,
          items: [
            DropdownMenuItem(
              child: ListTile(
                title: Text(
                  'Google',
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text('midnight@club.ru.id'),
              ),
              value: 0,
            ),
          ],
          onChanged: (idx) {},
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 12),
        child: Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle),
              iconSize: 50,
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
            TextField(
              decoration: InputDecoration(
                hintText: 'Telepon',
                prefix: SmartSelect<String>.single(
                  title: 'Telepon',
                  selectedValue: _telepon,
                  choiceItems: _options,
                  choiceBuilder: (context, choice, searchText) {
                    return ListTile(
                      title: Text(searchText.title!),
                    );
                  },
                  onChange: (selected) =>
                      setState(() => _telepon = selected.value),
                  modalType: S2ModalType.bottomSheet,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Telepon',
                prefix: SmartSelect<String>.single(
                  title: 'Telepon',
                  selectedValue: _telepon,
                  choiceItems: _options,
                  choiceBuilder: (context, choice, searchText) {
                    return ListTile(
                      title: Text(searchText.title!),
                    );
                  },
                  onChange: (selected) =>
                      setState(() => _telepon = selected.value),
                  modalType: S2ModalType.bottomSheet,
                ),
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
              onPressed: () {},
              child: Text('Add other column'),
            ),
          ],
        ),
      ),
    );
  }

  String _telepon = 'flutter';

  List<S2Choice<String>> _options = [
    S2Choice<String>(value: 'ion', title: 'Ionic'),
    S2Choice<String>(value: 'flu', title: 'Flutter'),
    S2Choice<String>(value: 'rea', title: 'React Native'),
  ];
}
