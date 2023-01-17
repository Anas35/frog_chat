/*// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chat_app/group/bloc/bloc.dart';

void main() {
  group('GroupBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          GroupBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final groupBloc = GroupBloc();
      expect(groupBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<GroupBloc, GroupState>(
      'CustomGroupEvent emits nothing',
      build: GroupBloc.new,
      act: (bloc) => bloc.add(const CustomGroupEvent()),
      expect: () => <GroupState>[],
    );
  });
}
*/