import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
import 'dart:async';


class Constants{
//  static final Stream<NfcData> _nfcDataStream ;
  static final  Stream nfcStream = FlutterNfcReader.read ;
  static StreamSubscription  streamSubscription = null;
  static StreamSubscription<NfcData>  nfdDataStreamSubscription = null;
  static Stream dataStream = null;
  static  NfcData NFCDATA = null;
}
