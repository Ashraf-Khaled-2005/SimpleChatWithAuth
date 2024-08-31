import 'package:chatapp/model/messagemodle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'widget/charbubble.dart';

class ChatPage extends StatefulWidget {
  static String id = "chat";
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final controllerlist = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection('Messages');
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('date', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Messagemodel> messageList = [];
          // ignore: non_constant_identifier_names
          for (DocumentSnapshot Element in snapshot.data!.docs) {
            messageList.add(Messagemodel.fromjson(Element));
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff26425c),
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/scholar.png",
                    width: 50,
                    height: 50,
                  ),
                  const Text(
                    "Schalr Chat",
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ))
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: controllerlist,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return (messageList[index].id == email)
                          ? ChatBubble(message: messageList[index])
                          : ChatRecivedBubble(message: messageList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    autofocus: true,
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({
                        'message': data,
                        'date': DateTime.now(),
                        'id': email
                      });
                      controller.clear();
                      controllerlist.animateTo(0,
                          duration: Duration(seconds: 2),
                          curve: Curves.easeInBack);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                )
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
