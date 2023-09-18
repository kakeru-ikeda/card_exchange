import 'package:card_exchange/model/authentication/auth_user.dart';
import 'package:card_exchange/page/authentication/auth_gate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Setting')),
      body: Column(children: [
        ListTile(
          title: Text('User UID'),
          subtitle: Text(AuthUser.user!.uid),
        ),
        ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              final data = ClipboardData(text: AuthUser.user!.uid);
              await Clipboard.setData(data);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AuthGate()),
              );
            },
            child: Text('Sign Out'))
      ]),
    );
  }
}
