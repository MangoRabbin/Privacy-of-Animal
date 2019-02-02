import 'package:flutter/material.dart';
import 'package:privacy_of_animal/bloc_helpers/bloc_event_state_builder.dart';
import 'package:privacy_of_animal/logics/tag_chat/tag_chat.dart';
import 'package:privacy_of_animal/utils/service_locator.dart';

class TagChatInput extends StatefulWidget {

  @override
  TagChatInputState createState() {
    return new TagChatInputState();
  }
}

class TagChatInputState extends State<TagChatInput> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5)
        ), 
        color: Colors.white
      ),
      child: Row(
        children: <Widget>[
          // Edit text
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: BlocBuilder(
                bloc: sl.get<TagChatBloc>(),
                builder: (context, TagChatState state){
                  if(state.isNPCDone) sl.get<TagChatBloc>().emitEvent(TagChatEvnetNothing());
                  return TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: '답변을 입력하세요.',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    controller: _textEditingController,
                    enabled: state.isNPCDone ? true : false,
                  );
                }
              ),
            ),
          ),

          // Button send message
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  sl.get<TagChatBloc>().emitEvent(TagChatEventUser(message: _textEditingController.text));
                  _textEditingController.clear();
                }
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}