import 'package:flutter/material.dart';

class DemoChip extends StatefulWidget {
  const DemoChip({Key? key}) : super(key: key);

  @override
  State<DemoChip> createState() => _DemoChipState();
}

class _DemoChipState extends State<DemoChip> {
  final _selectKeywords = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];
  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _selectKeywords.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 100,
                    child: RawChip(
                      padding: const EdgeInsets.all(0),
                      label: Text(_selectKeywords[index]),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.grey.shade800,
                        child: const Text('AB'),
                      ),
                      onDeleted: () {
                        setState(() {
                          _selectKeywords.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              )),
          SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _selectKeywords.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 100,
                    child: InputChip(
                        label: Text(_selectKeywords[index]),
                        padding: const EdgeInsets.all(0),
                        avatar: CircleAvatar(
                          backgroundColor: Colors.grey.shade800,
                          child: const Text('AB'),
                        ),
                        onDeleted: () {
                          setState(() {
                            _selectKeywords.removeAt(index);
                          });
                        },
                        onPressed: () {
                          print('I am the one thing in life.');
                        }),
                  );
                },
              )),
          SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _selectKeywords.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 100,
                    child: ChoiceChip(
                      padding: const EdgeInsets.only(right: 20),
                      label: Text(_selectKeywords[index]),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.grey.shade800,
                        child: const Text('AB'),
                      ),
                      selected: _value == index,
                      selectedColor: Colors.green,
                      onSelected: (bool selected) {
                        setState(() {
                          _value = selected ? index : null;
                        });
                      },
                    ),
                  );
                },
              ))
        ],
      ),
    )));
  }
}
