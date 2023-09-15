import 'package:flutter/material.dart';

class ExchangeModal extends StatefulWidget {
  const ExchangeModal({super.key});

  @override
  State<ExchangeModal> createState() => _ExchangeModalState();
}

class _ExchangeModalState extends State<ExchangeModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 64),
      decoration: BoxDecoration(
        //モーダル自体の色
        color: Colors.white,
        //角丸にする
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text('Exchange'),
      ),
    );
  }
}
