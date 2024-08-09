import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zeeeeee/models/usersss.dart';
import 'package:zeeeeee/services/firebase_service.dart';
import 'package:zeeeeee/static.dart';
import 'package:zeeeeee/widgets/top_bar.dart';
import 'package:zeeeeee/widgets/user_card.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  void initState() {
    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: Statics.appID /*input your AppID*/,
      appSign: Statics.appSign /*input your AppSign*/,
      userID: FirebaseService.currentUser.email,
      userName:  FirebaseService.currentUser.username,
      plugins: [ZegoUIKitSignalingPlugin()],
    );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(
              upperTitle: 'Welcome back,',
              title: FirebaseService.currentUser.name,
            ),
            Center(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseService.buildViews,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final List<QueryDocumentSnapshot>? docs = snapshot.data?.docs;
                  if (docs == null || docs.isEmpty) {
                    return const Text('No data');
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final model = UserModel.fromJson(
                        docs[index].data() as Map<String, dynamic>,
                      );
                      if (model.username !=
                          FirebaseService.currentUser.username) {
                        return UserCard(userModel: model);
                      }
                      return const SizedBox.shrink();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}