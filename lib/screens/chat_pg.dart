import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:provider/provider.dart';
import '../providers/products.dart';



class ChatPage extends StatefulWidget {
  static const routeName = '/chat-page';

  // final String title;
  // final WebSocketChannel channel;

  // ChatPage({Key key, @required this.title, @required this.channel})
      // : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _controller = TextEditingController();
  String msg;
  WebSocketChannel channel;

  @override
  initState(){
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Products>(context).chatApi();
    });
    try{
    //  channel = IOWebSocketChannel.connect('ws://54.183.150.155:8082');
    channel = IOWebSocketChannel.connect('ws://54.183.150.155:8082/ws/chat/63dd89c0-a9e9-4fa7-b311-b3858687554a/');
    print("11111111111111 ws connect was called");
    } catch (error) {
      print("11111111111111111 ws connect err");
      throw error;
    }

  }

  @override
  Widget build(BuildContext context) {
    // final load = Provider.of<Products>(context).chatApi();
    final load = Provider.of<Products>(context);
    print("11111111111111 chat data: ${load.chat}");
    return Scaffold(
      appBar: AppBar(
        title: Text("${load.chat}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Send a message'),
              ),
            ),
            StreamBuilder(
              // stream: widget.channel.stream,
              stream: channel.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                );
              },
            ),
            // StreamBuilder(
            //   stream: widget.channel.stream,
            //   builder: (context, snapshot) {
            //     return Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 24.0),
            //       child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
            //     );
            //   },
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      // widget.channel.sink.add(_controller.text);
      print('11111111111111 clicked msg send');
      try{
        channel.sink.add(_controller.text);
      } catch (error) {
        print("111111111111111111111111 ws add err");
        throw error;
      }
    }

      // widget.channel.sink.add('msg');

  }

  @override
  void dispose() {
    // widget.channel.sink.close();
    channel.sink.close();
    super.dispose();
  }
}