import 'package:chatapp/models/messagemodel.dart';
import 'package:chatapp/widgets/chatbubble.dart';
import 'package:chatapp/widgets/customtextfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chatview extends StatefulWidget {
  const Chatview({super.key});

  @override
  State<Chatview> createState() => _ChatviewState();
}

class _ChatviewState extends State<Chatview> {
  Stream collectionStream = FirebaseFirestore.instance.collection('messages').snapshots();
Stream documentStream = FirebaseFirestore.instance.collection('messages').doc().snapshots();

  final TextEditingController controller = TextEditingController();
  
  
 

  @override
  void dispose() {
    controller.dispose(); // clean up when widget is removed
    super.dispose();
  }
  CollectionReference messages = FirebaseFirestore.instance.collection('messages');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
  stream: messages.orderBy('createdAt').snapshots(),
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      return const Center(child: Text("Something went wrong"));
    } else if (snapshot.hasData) {
      List<Messagemodel> messagelist = [];
      for (int i=0; i<snapshot.data!.docs.length; i++) {
        messagelist.add(
          Messagemodel.fromjson(snapshot.data!.docs[i].data() )
        );
      }
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage('assets/image1.jpg'),
              ),
              SizedBox(width: 10),
              Text('Chat with User'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: messagelist.length,
                  itemBuilder: (context, index) {
                    return Chatbubble(
                       messagemodel: messagelist[index],
                    );
                  },
                ),
              ),
              Customtextfield(
                controller: controller,
                onsubmitted: (data) {
                  messages.add({
                    'text': data,
                    'createdAt': Timestamp.now(),
                  });
                  controller.clear();
                },
              ),
            ],
          ),
        ),
      );
    }
    return Text('Loading...');
    
  },
);

  }
}
