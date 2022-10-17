import 'package:concetto_security/custom_colors.dart';
import 'package:concetto_security/scan_data_repository.dart';
import 'package:concetto_security/scan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ScanResult extends StatelessWidget {
  final String id;
  const ScanResult({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: ScanDataRepository().getData(id),
          builder: (context, AsyncSnapshot<ScanModel?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null) {
                ScanModel data = snapshot.data!;
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ParticipantData(
                      scanData: data,
                    ));
              } else {
                return const Center(
                  child: Text(
                    'No Data Found',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: kBrightCyan,
                ),
              );
            } else {
              return const Center(
                  child: Text(
                'Some error occured',
                style: TextStyle(color: Colors.white),
              ));
            }
          }),
    );
  }
}

class ParticipantData extends StatelessWidget {
  final ScanModel scanData;
  const ParticipantData({required this.scanData, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Participant's Data",
                style: GoogleFonts.oswald(color: Colors.white, fontSize: 32.0),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            KeyValueText(keyText: 'Name', valueText: scanData.name),
            KeyValueText(keyText: 'College', valueText: scanData.college),
            KeyValueText(keyText: 'Email', valueText: scanData.email),
            KeyValueText(keyText: 'Gender', valueText: scanData.gender),
            KeyValueText(keyText: 'Phone', valueText: scanData.phone),
            KeyValueText(
                keyText: 'Transportation', valueText: scanData.transportation),
            KeyValueText(keyText: 'Arrival', valueText: scanData.arrival),
            KeyValueText(keyText: 'Departure', valueText: scanData.departure),
            KeyValueText(keyText: 'Combo Pack', valueText: scanData.comboPack),
            KeyValueText(keyText: 'Events', valueText: scanData.events),
          ],
        ),
      ),
    );
  }
}

class KeyValueText extends StatelessWidget {
  final String keyText;
  final String valueText;
  const KeyValueText(
      {required this.keyText, required this.valueText, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: '$keyText: ',
            style:
                GoogleFonts.sourceCodePro(color: kBrightCyan, fontSize: 22.0)),
        TextSpan(
            text: valueText,
            style: const TextStyle(color: Colors.white, fontSize: 20.0)),
      ])),
    );
  }
}
