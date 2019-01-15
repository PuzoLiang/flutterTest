import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'dart:math';
import 'dart:typed_data';
import 'dart:io';
import 'dart:isolate';
import 'package:collection/collection.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Welcome to Flutter',
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('欢迎来到国家数据中心'),
      //   ),
      //   body: Center(
      //     // child: Text('更多资讯订阅'),
      //     child: RandomWords(),
      //   ),
      // ),
       title: 'Startup Name Generator',            
       home: RandomWords(),
    );
  }
}


class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Scaffold(
    appBar: AppBar(
      title: Text('2019年中国制造业采供经理人'),
    ),
    body: _buildSuggestions(),
  );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}


class WebSocketChannel(StreamChannel<List<int>> channel, { String protocpl, Duration pingInterval, bool serverSide: true});