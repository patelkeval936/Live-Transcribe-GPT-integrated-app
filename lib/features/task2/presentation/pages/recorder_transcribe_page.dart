
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:sound_stream/sound_stream.dart';
import 'package:web_socket_channel/io.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

import 'live_transcribe_page.dart';

const _baseUrl =
    'wss://api.deepgram.com/v1/listen?encoding=linear16&sample_rate=16000&language=en-GB';
const apiKey = '79dc332c9093c5b4168956d543dea3b40ebe70dd';

class RecordedTranscriptionPage extends StatefulWidget {
  const RecordedTranscriptionPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<RecordedTranscriptionPage> createState() => _RecordedTranscriptionPageState();
}

class _RecordedTranscriptionPageState extends State<RecordedTranscriptionPage> {

  Uri buildUrl(String baseUrl, Map<String, dynamic>? baseQueryParams,
      Map<String, dynamic>? queryParams) {
    final uri = Uri.parse(baseUrl);

    final Map<String, String> mergedQueryParams =
    mergeMaps(baseQueryParams, queryParams)
        .map((key, value) => MapEntry(key, value.toString()));

    return uri.replace(queryParameters: mergedQueryParams);
  }

  /// Merges two maps, returning a new map. If both maps have the same key, the value from map2 is used.
  Map<String, dynamic> mergeMaps(
      Map<String, dynamic>? map1, Map<String, dynamic>? map2) {
    return {...?map1, ...?map2};
  }

  Future<String> transcribeFromBytes(List<int> data,
      {Map<String, dynamic>? queryParams}) async {
    http.Response res = await http.post(
      buildUrl(_baseUrl, null, queryParams),
      headers: {
        HttpHeaders.authorizationHeader: 'Token $apiKey',
      },
      body: data,
    );

    return res.body;
  }

  /// Transcribe a local audio file. Returns the transcription as a JSON string.
  ///
  /// https://developers.deepgram.com/reference/listen-file
  Future<String> transcribeFromFile(File file,
      {Map<String, dynamic>? queryParams}) {
    assert(file.existsSync());
    final Uint8List bytes = file.readAsBytesSync();

    return transcribeFromBytes(bytes, queryParams: queryParams);
  }

  String myText = "To start transcribing your voice, press start.";

  final RecorderStream _recorder = RecorderStream();

  late StreamSubscription _recorderStatus;
  late StreamSubscription _audioStream;

  late IOWebSocketChannel channel;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback(onLayoutDone);
  }

  @override
  void dispose() {
    _recorderStatus.cancel();
    _audioStream.cancel();
    channel.sink.close();

    super.dispose();
  }

  Future<void> _initStream() async {
    channel = IOWebSocketChannel.connect(Uri.parse(serverUrl),
        headers: {'Authorization': 'Token $apiKey'});

    channel.stream.listen((event) async {
      final parsedJson = jsonDecode(event);

      print(parsedJson);
      print('-------------------------------------------');

      if (parsedJson['channel'] != null && parsedJson['channel']['alternatives'] != null) {
        updateText(parsedJson['channel']['alternatives'][0]['transcript']);
      }
    });

    _audioStream = _recorder.audioStream.listen((data) {
      channel.sink.add(data);
    });

    _recorderStatus = _recorder.status.listen((status) {
      if (mounted) {
        setState(() {});
      }
    });

    await Future.wait([
      _recorder.initialize(),
    ]);
  }

  void _startRecord() async {
    resetText();
    _initStream();

    await _recorder.start();

    setState(() {});
  }

  void _stopRecord() async {
    await _recorder.stop();

    setState(() {});
  }

  void onLayoutDone(Duration timeStamp) async {
    await Permission.microphone.request();
    setState(() {});
  }

  void updateText(newText) {
    setState(() {
      myText = myText + ' ' + newText;
    });
  }

  void resetText() {
    setState(() {
      myText = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Transcription'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: SizedBox(
                  width: 150,
                  child: Text(
                    myText,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 50,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    updateText('');

                    _startRecord();
                  },
                  child: const Text('Start', style: TextStyle(fontSize: 30)),
                ),
                const SizedBox(width: 5),
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    _stopRecord();
                  },
                  child: const Text('Stop', style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
