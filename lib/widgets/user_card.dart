import 'package:flutter/material.dart';
import 'package:zeeeeee/models/usersss.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class UserCard extends StatefulWidget {
  final UserModel userModel;

  const UserCard({
    required this.userModel,
    super.key,
  });

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.5),
        ),
        elevation: 5,
        child: InkWell(
          onTap: (){
            print("UserModel -> ${widget.userModel.name}, ${widget.userModel.username}, ${widget.userModel.email},");
          },
          child: Container(
            height: 75,
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 25,
                  child: Center(
                    child: Text(
                      widget.userModel.name.substring(0, 1).toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    widget.userModel.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                actionButton(false),
                const SizedBox(width: 10),
                actionButton(true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ZegoSendCallInvitationButton actionButton(bool isVideo) =>
      ZegoSendCallInvitationButton(
        buttonSize: const Size(50, 50),
        isVideoCall: isVideo,
        iconSize: const Size(40,40),
        resourceID: "zego_call",
        invitees: [
          ZegoUIKitUser(
            id: widget.userModel.email,
            name: widget.userModel.username,
          ),
          
        ],
      );
}


