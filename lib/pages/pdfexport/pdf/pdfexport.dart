import 'dart:typed_data';

import 'package:makepdfs/models/hazardT.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

Future<Uint8List> makePdf(HazardT hazardT) async {
  final pdf = Document();
  final imageLogo = MemoryImage((await rootBundle.load('assets/dhec.png')).buffer.asUint8List());
  pdf.addPage(
    Page(
      build: (context) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Hazard Assessment Form",
                      style: Theme.of(context).header1,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),

                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image(imageLogo),
                )
              ],
            ),

            Container(height: 50),
            Table(
              border: TableBorder.all(color: PdfColors.black),
              children: [
                TableRow(
                  children: [
                    Expanded(
                      child: PaddedText('Characteristics of Hazard'),
                      flex: 3,
                    ),

                    Expanded(
                      child: PaddedText('Elements of Hazard'),
                      flex: 2,
                    ),
                  ],
                ),

                TableRow(
                  children: [
                    Expanded(
                      child: PaddedText('Cause/Origin'),
                      flex: 3,
                    ),

                    Expanded(
                      child: PaddedText(hazardT.origin),
                      flex: 2,
                    ),
                  ],
                ),

                TableRow(
                  children: [
                    Expanded(
                      child: PaddedText('Force'),
                      flex: 3,
                    ),

                    Expanded(
                      child: PaddedText('Force'),
                      flex: 2,
                    ),
                  ],
                ),

                TableRow(
                  children: [
                    Expanded(
                      child: PaddedText('Warning Signs and Signals'),
                      flex: 3,
                    ),

                    Expanded(
                      child: PaddedText('Warning Signs and Signals'),
                      flex: 2,
                    ),
                  ],
                ),

                TableRow(
                  children: [
                    Expanded(
                      child: PaddedText('Forewarning'),
                      flex: 3,
                    ),

                    Expanded(
                      child: PaddedText('Forewarning'),
                      flex: 2,
                    ),
                  ],
                ),

                TableRow(
                  children: [
                    Expanded(
                      child: PaddedText('Speed of Onset'),
                      flex: 3,
                    ),

                    Expanded(
                      child: PaddedText('Speed of Onset'),
                      flex: 2,
                    ),
                  ],
                ),

                TableRow(
                  children: [
                    Expanded(
                      child: PaddedText('Frequency'),
                      flex: 3,
                    ),

                    Expanded(
                      child: PaddedText('Frequency'),
                      flex: 2,
                    ),
                  ],
                ),

                TableRow(
                  children: [
                    Expanded(
                      child: PaddedText('Period of Occurence'),
                      flex: 3,
                    ),

                    Expanded(
                      child: PaddedText('Period of Occurence'),
                      flex: 2,
                    ),
                  ],
                ),

                TableRow(
                  children: [
                    Expanded(
                      child: PaddedText('Duration'),
                      flex: 3,
                    ),

                    Expanded(
                      child: PaddedText('Duration'),
                      flex: 2,
                    ),
                  ],
                ),

                TableRow(
                  children: [
                    Expanded(
                      child: PaddedText('Analytical description of the hazard:'),
                      flex: 3,
                    ),

                    Expanded(
                      child: PaddedText('Analytical description of the hazard:'),
                      flex: 2,
                    ),
                  ],
                ),

                TableRow(
                  children: [
                    Expanded(
                      child: PaddedText('How will it affect me?'),
                      flex: 2,
                    ),

                    Expanded(
                      child: PaddedText('How will it affect me?'),
                      flex: 2,
                    ),
                  ],
                ),

                TableRow(
                  children: [
                    Expanded(
                      child: PaddedText('How will it affect my community?'),
                      flex: 2,
                    ),

                    Expanded(
                      child: PaddedText('How will it affect my community?'),
                      flex: 2,
                    ),
                  ],
                ),
              ],
            ),
            Container(height: 50),
            Table(
              border: TableBorder.all(color: PdfColors.black),
              children: [
                TableRow(
                  children: [
                    PaddedText('Analytical Description of Hazard'),
                    PaddedText(
                      'Due to extreme amounts of accumulated rainfall, my house was whisked away off of its foundation',
                    )
                  ],
                ),
                TableRow(
                  children: [
                    PaddedText(
                      'How will it affect me?',
                    ),
                    PaddedText(
                      'Extremely',
                    )
                  ],
                ),
                TableRow(
                  children: [
                    PaddedText(
                      'How will it affect my community?',
                    ),
                    PaddedText('Sadly')
                  ],
                )
              ],
            ),
          ],
        );
      },
    ),
  );
  return pdf.save();
}

Widget PaddedText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: align,
      ),
    );

