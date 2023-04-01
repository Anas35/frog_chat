import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../../../routes/users/[user_id]/groups/[group_id]/join.dart' as route;

class _MockRequestContext extends Mock implements RequestContext {}

class _MockGroupQuery extends Mock implements GroupQuery {}

void main() {
  late RequestContext context;
  late GroupQuery groupQuery;

  const userId = 'id';
  const groupId = 'groupId';

  setUp(() {
    context = _MockRequestContext();
    groupQuery = _MockGroupQuery();
    when(() => context.read<GroupQuery>()).thenReturn(groupQuery);
  });

  group('POST /join', () {
    test('join group', () async {
      
      final request = Request.post(
        Uri.parse('http://localhost/users/$userId/groups/$groupId/join'),
      );

      when(() => groupQuery.joinGroup(any(), any())).thenAnswer((_) async {});
      when(() => context.request).thenReturn(request);

      final response = await route.onRequest(context, userId, groupId);

      expect(response.statusCode, equals(HttpStatus.ok));

      verify(() => groupQuery.joinGroup(userId, groupId)).called(1);
    });
  });
}
