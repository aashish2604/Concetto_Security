import 'dart:convert';

import 'package:concetto_security/scan.dart';
import 'package:concetto_security/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Concetto Security',
      theme: AppTheme().themeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future _qrScanner() async {
    var cameraStatus = await Permission.camera.status;
    if (cameraStatus.isGranted) {
      String? qrData = await scanner.scan();
      if (qrData != null) {
        if (qrData.contains('Name:')) {
          List<String> data = qrData.split(':');
          String userID = data.last;
          Future.delayed(const Duration(microseconds: 1))
              .then((value) => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ScanResult(
                        id: userID,
                      ))));
        } else {
          Future.delayed(const Duration(microseconds: 1)).then((value) =>
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.white,
                  content: Text(
                    'Invalid QR code',
                    style: TextStyle(color: Colors.black),
                  ))));
        }
      } else {
        Future.delayed(const Duration(microseconds: 1)).then((value) =>
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.white,
                content: Text(
                  'Unable to detect QR code',
                  style: TextStyle(color: Colors.black),
                ))));
      }
    } else {
      var isGrant = await Permission.camera.request();
      if (isGrant.isGranted) {
        String? qrData = await scanner.scan();
        if (qrData != null) {
          if (qrData.contains('Name:')) {
            List<String> data = qrData.split(':');
            String userID = data.last;
            Future.delayed(const Duration(microseconds: 1))
                .then((value) => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScanResult(
                          id: userID,
                        ))));
          } else {
            Future.delayed(const Duration(microseconds: 1)).then((value) =>
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.white,
                    content: Text(
                      'Invalid QR code',
                      style: TextStyle(color: Colors.black),
                    ))));
          }
        } else {
          Future.delayed(const Duration(microseconds: 1)).then((value) =>
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.white,
                  content: Text(
                    'Unable to detect QR code',
                    style: TextStyle(color: Colors.black),
                  ))));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'Concetto Security',
              style: GoogleFonts.orbitron(
                  fontSize: 26.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/qr_icon.png'),
                      fit: BoxFit.fill)),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextButton(
                  onPressed: () {
                    _qrScanner();
                  },
                  child: const Text('Scan QR code')),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
