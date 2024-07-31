import 'package:flutter/material.dart';

import 'package:table_app/table_widget/calls_widget.dart';
import 'package:table_app/table_widget/center_table.dart';
import 'package:table_app/table_widget/puts_widget.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  final ScrollController _controller1 = ScrollController();
  final ScrollController _controller2 = ScrollController();

  bool _isScrolling = false; // Flag to prevent recursive updates

  @override
  void initState() {
    super.initState();

    _controller1.addListener(() {
      if (_controller1.hasClients && !_isScrolling) {
        _isScrolling = true;
        if (_controller2.hasClients) {
          _controller2.jumpTo(_controller1.offset);
        }
        _isScrolling = false;
      }
    });

    _controller2.addListener(() {
      if (_controller2.hasClients && !_isScrolling) {
        _isScrolling = true;
        if (_controller1.hasClients) {
          _controller1.jumpTo(_controller2.offset);
        }
        _isScrolling = false;
      }
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Table"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(border: Border.all()),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Calls",
                    style: TextStyle(
                      color: Color.fromARGB(255, 226, 213, 96),
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Puts",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(child: CallsWidget(controller1: _controller1)),
                const CenterWidget(),
                Expanded(child: PutsWidget(controller2: _controller2)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
