import 'dart:convert';

import 'package:english_mastery/domain/vocabulary/error_correction_model.dart';
import 'package:english_mastery/domain/vocabulary/multiple_choice_model.dart';
import 'package:english_mastery/domain/vocabulary/sentence_completion_model.dart';
import 'package:english_mastery/domain/vocabulary/synonyms_antonyms_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:english_mastery/env.dart';
import 'package:english_mastery/urls.dart';

class VocabularyRepo {
  //sentence completion
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
        print("vocabulary generate body : ${response.body}");
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

//error correction
  Future<ErrorCorrectionModel?> generate_error_correction() async {
    try {
      final response = await http.get(
        Uri.parse("${Env.host}${URLs.error_correction}"),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(
          "vocabulary generate_error_correction() status code : ${response.statusCode}");
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("vocabulary generate body : ${response.body}");
        return ErrorCorrectionModel.fromJson(responseData);
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

//multiple choice
  Future<MultipleChoiceModel?> generate_multiple_choice() async {
    try {
      final response = await http.get(
        Uri.parse("${Env.host}${URLs.multiple_choice}"),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(
          "vocabulary generate_multiple_choice() status code : ${response.statusCode}");
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("vocabulary generate body : ${response.body}");
        return MultipleChoiceModel.fromJson(responseData);
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

//synonyms antonyms
  Future<SynonymsAntonymsModel?> generate_synonyms_antonyms() async {
    try {
      final response = await http.get(
        Uri.parse("${Env.host}${URLs.synonyms_antonyms}"),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(
          "vocabulary generate_synonyms_antonyms() status code : ${response.statusCode}");
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("vocabulary generate body : ${response.body}");
        return SynonymsAntonymsModel.fromJson(responseData);
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