import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class DemoRive extends StatefulWidget {
  const DemoRive({super.key});

  @override
  State<DemoRive> createState() => _DemoRiveState();
}

class _DemoRiveState extends State<DemoRive> {
  String correctPassword = 'admin';
  String animationType = 'idle';

  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: FlareActor(
                'assets/Teddy.flr',
                alignment: Alignment.bottomCenter,
                fit: BoxFit.contain,
                animation: animationType,
                callback: (animation) {
                  setState(() {
                    animationType = 'idle';
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () => signIn(),
              child: const Text(
                "Click",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        setState(() {
          animationType = 'hands_up';
        });
      } else {
        setState(() {
          animationType = 'hands_down';
        });
      }
    });

    usernameFocusNode.addListener(() {
      if (usernameFocusNode.hasFocus) {
        setState(() {
          animationType = 'test';
        });
      } else {
        setState(() {
          animationType = 'idle';
        });
      }
    });

    super.initState();
  }

  void signIn() {
    if (animationType == 'hands_up') {
      setState(() {
        animationType = 'hands_down';
      });
    }

    if (passwordController.text.compareTo(correctPassword) == 0) {
      setState(() {
        animationType = "success";
      });
    } else {
      setState(() {
        animationType = "fail";
      });
    }
  }
}
