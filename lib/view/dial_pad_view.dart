import 'package:contact_app/controllers/dial_pad_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DialPadView extends StatefulWidget {
  @override
  _DialPadViewState createState() => _DialPadViewState();
}

class _DialPadViewState extends State<DialPadView> {
  final TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  ValueNotifier<int> _cursorPosition = ValueNotifier(0);

  @override
  void dispose() {
    _controller.dispose();
    _cursorPosition.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Consumer<DialPadNotifier>(builder: (context, value, child) {
                  return StreamBuilder<String>(
                    stream: value.number,
                    builder: (context, snapshot) {
                      final number = snapshot.data ?? value.rawNum;
                      _controller.text = number;
                      _cursorPosition.value = _controller.text.length;
                      _controller.selection = TextSelection.fromPosition(
                        TextPosition(offset: _cursorPosition.value),
                      );

                      return Flexible(
                        child: TextField(
                          focusNode: _focusNode,
                          autofocus: false,
                          autocorrect: true,
                          controller: _controller,
                          onTap: () {
                            _focusNode.unfocus();
                            _cursorPosition.value =
                                _controller.selection.baseOffset;
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                          ),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter number',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      );
                    },
                  );
                }),
                IconButton(
                  onPressed: () {
                    context
                        .read<DialPadNotifier>()
                        .deleteNumber(_cursorPosition.value);
                    _controller.selection = TextSelection.fromPosition(
                      TextPosition(offset: _cursorPosition.value),
                    );
                    _cursorPosition.value--;
                  },
                  icon: Icon(Icons.backspace),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1.3,
                children: labelPad.map((pad) {
                  return TextButton(
                    onPressed: () {
                      context.read<DialPadNotifier>().appendNumber(
                            number: pad,
                            index: _cursorPosition.value,
                          );
                      _controller.selection = TextSelection.fromPosition(
                        TextPosition(offset: _cursorPosition.value),
                      );
                      _cursorPosition.value++;
                    },
                    child: Text(pad),
                  );
                }).toList(),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu_rounded),
                ),
                SizedBox(width: 8),
                FilledButton.icon(
                  onPressed: () {
                    context.pushNamed('call_in');
                  },
                  icon: Icon(Icons.call),
                  label: Text('byU'),
                ),
                FilledButton.icon(
                  onPressed: () {
                    context.pushNamed('call_in');
                  },
                  icon: Icon(Icons.call),
                  label: Text('Smartfren'),
                ),
                SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.dialpad),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  final labelPad = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#'];
}

void showDialPad(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  showBottomSheet(
    context: context,
    constraints: BoxConstraints(maxHeight: height * .7),
    builder: (context) => DialPadView(),
  );
}
