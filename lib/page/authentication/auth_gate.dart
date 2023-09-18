import 'dart:io';

import 'package:card_exchange/constance/google_client.dart';
import 'package:card_exchange/model/authentication/auth_user.dart';
import 'package:card_exchange/page/navigation_bar/navigation_bar_page.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthGate extends StatelessWidget {
  AuthGate() {
    FirebaseUIAuth.configureProviders([
      GoogleProvider(clientId: GoogleClient.id),
    ]);
  }
  // @override
  // Widget build(BuildContext context) {
  //   return AuthStateListener<OAuthController>(
  //     child: OAuthProviderButton(
  //       // or any other OAuthProvider
  //       provider: GoogleProvider(clientId: GoogleClient.id),
  //     ),
  //     listener: (oldState, newState, ctrl) {
  //       if (newState is SignedIn) {
  //         Navigator.pushReplacementNamed(context, '/profile');
  //       }
  //       return null;
  //     },
  //   );
  // }

  static final googleLogin = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  @override
  Widget build(BuildContext context) {
    // final providers = [
    //   EmailAuthProvider(),
    //   GoogleProvider(clientId: GoogleClient.id),
    // ];

    return MaterialApp(
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/sign-in' : '/profile',
      routes: {
        '/sign-in': (context) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
              // GoogleProvider(clientId: GoogleClient.id),
            ],
            actions: [
              AuthStateChangeAction<SignedIn>(
                (context, state) {
                  Navigator.pushReplacementNamed(context, '/profile');
                },
              ),
            ],
            footerBuilder: (context, action) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text('Other'),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      GoogleSignInAccount? signinAccount =
                          await googleLogin.signIn();
                      if (signinAccount == null) return;
                      GoogleSignInAuthentication auth =
                          await signinAccount.authentication;
                      final OAuthCredential credential =
                          GoogleAuthProvider.credential(
                        idToken: auth.idToken,
                        accessToken: auth.accessToken,
                      );
                      // 認証情報をFirebaseに登録
                      User? user = (await FirebaseAuth.instance
                              .signInWithCredential(credential))
                          .user;
                      if (user != null) {
                        AuthUser.user = user;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NavigationBarPage(),
                          ),
                        );
                      }
                    },
                    icon: Icon(Icons.g_mobiledata),
                    label: Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Center(child: Text('Sign in with Google'))),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.signInAnonymously();
                        if (kDebugMode) {
                          Fluttertoast.showToast(msg: '匿名ログイン');
                        }
                        AuthUser.user = FirebaseAuth.instance.currentUser;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NavigationBarPage(),
                          ),
                        );
                      } catch (e) {
                        print(e);
                        Fluttertoast.showToast(
                            msg: 'ログインに失敗しました。通信状況をご確認ください。');
                      }
                    },
                    icon: Icon(Icons.person),
                    label: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      child: Center(child: Text('Guest Login')),
                    ),
                  )
                ],
              );
            },
          );
        },
        '/profile': (context) {
          AuthUser.user = FirebaseAuth.instance.currentUser;
          return NavigationBarPage();
        },
      },
      theme: ThemeData(
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(18),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          ),
          textTheme: TextTheme(
            headlineSmall: TextStyle(fontSize: 40),
            bodySmall: TextStyle(fontSize: 18),
            labelLarge: TextStyle(fontSize: 18),
          )),
    );
  }
}
