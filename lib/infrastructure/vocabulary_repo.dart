import 'dart:convert';

import 'package:english_mastery/domain/vocabulary/sentence_completion_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:english_mastery/env.dart';
import 'package:english_mastery/urls.dart';

class VocabularyRepo {
  Future<VocabularySentenceCompletionModel?>
      generate_sentence_completion() async {
    try {
      final response = await http.get(
        Uri.parse("${Env.host}${URLs.sentence_completion}"),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(
          "vocabulary generate_sentence_completion() status code : ${response.statusCode}");
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("speaking generate body : ${response.body}");
        return VocabularySentenceCompletionModel.fromJson(responseData);
      } else {
        if (kDebugMode) {
          print('Failed to fetch vocabulary data: ${response.statusCode}');
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return null;
    }
  }
}
