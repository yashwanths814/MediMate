// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async'; // Required for the Completer
import 'dart:convert';
import 'dart:html' as html; // Import for web audio playback
import 'package:http/http.dart' as http;

Future<int> fetchSpeechAndPlay(
  String promptText,
  String? apiKey,
) async {
  // Ensure the API key is provided
  if (apiKey == null || apiKey.isEmpty) {
    throw Exception('API key is required.');
  }

  // Set up the POST request headers.
  Map<String, String> headers = {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json',
  };

  // Set up the POST request body.
  String body = json.encode(
      {'model': 'tts-1', 'input': promptText, 'voice': 'onyx', 'speed': '1.1'});

  // Make the POST request to fetch the speech audio.
  final response = await http.post(
    Uri.parse('https://api.openai.com/v1/audio/speech'),
    headers: headers,
    body: body,
  );

  // Handle the response
  if (response.statusCode == 200) {
    // Create an audio element
    html.AudioElement audioElement = html.AudioElement()
      ..src = 'data:audio/mp3;base64,${base64.encode(response.bodyBytes)}'
      ..autoplay = true
      ..controls = false;

    // Add the audio element to the DOM to ensure it is loaded
    html.document.body?.children.add(audioElement);

    // Completes when the audio is loaded and can play
    Completer<int> durationCompleter = Completer<int>();
    audioElement.onCanPlay.first.then((_) {
      // Once the audio is loaded, the duration is available.
      // Convert the duration to milliseconds and round it to get an integer.
      int durationMs = (audioElement.duration * 1000).round();
      durationCompleter.complete(durationMs);
    });

    // Play the audio
    audioElement.play();

    // Return the duration in milliseconds once it's available
    return durationCompleter.future;
  } else {
    // If the server did not return a "200 OK response",
    // throw an exception
    throw Exception(
        'Failed to generate speech. Status code: ${response.statusCode}');
  }
}
