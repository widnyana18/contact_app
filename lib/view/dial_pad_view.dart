import 'package:contact_app/controllers/dial_pad_notifier.dart';
import 'package:flutter/material.dart';
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _cursorPosition.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final numberProvider = context.watch<DialPadNotifier>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                stream: numberProvider.number,
                builder: (context, snapshot) {
                  final number = snapshot.data ?? '';
                  _controller.text = number;

                  return TextField(
                    focusNode: _focusNode,
                    autofocus: false,
                    autocorrect: true,
                    controller: _controller,
                    onTap: () {
                      _focusNode.unfocus();
                      _cursorPosition.value = _controller.selection.baseOffset;
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
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  numberProvider.deleteNumber(_cursorPosition.value);
                  _controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: _cursorPosition.value),
                  );
                  _cursorPosition.value--;
                },
                child: Icon(Icons.backspace),
              ),
              SizedBox(height: 32),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  children: labelPad.map((pad) {
                    return TextButton(
                      onPressed: () {
                        numberProvider.appendNumber(
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
            ],
          ),
        ),
      ),
    );
  }

  final labelPad = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#'];
}
