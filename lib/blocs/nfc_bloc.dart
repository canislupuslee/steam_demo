import 'dart:async';

import 'bloc_base.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

class NfcBloc extends BlocBase {
  final _controller = StreamController<NfcData>();
  get nfcData => FlutterNfcReader.read;

  void dispose() {
    stopNFC();
    _controller.close();
  }

  Future<void> stopNFC() async {
    NfcData response;
    try {
      print('NFC: Stop scan by user');
      response = await FlutterNfcReader.stop;
      print("stop success "+response.status.toString());
    } on Exception {
      print('NFC: Stop scan exception');
      response = NfcData(
        id: '',
        content: '',
        error: 'NFC scan stop exception',
        statusMapper: '',
      );
      response.status = NFCStatus.error;
    }
  }
}
