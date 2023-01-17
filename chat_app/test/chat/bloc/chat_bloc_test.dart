/*
// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chat_app/chat/bloc/bloc.dart';

void main() {
  group('ChatBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ChatBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final chatBloc = ChatBloc();
      expect(chatBloc.state.errorMessage, equals('Default Value'));
    });

    blocTest<ChatBloc, ChatState>(
      'CustomChatEvent emits nothing',
      build: ChatBloc.new,
      act: (bloc) => bloc.add(const CustomChatEvent()),
      expect: () => <ChatState>[],
    );
  });
}

 */