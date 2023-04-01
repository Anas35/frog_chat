import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:database/database.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../../routes/users/[user_id]/groups/index.dart' as route;

class _MockRequestContext extends Mock implements RequestContext {}

class _MockGroupQuery extends Mock implements GroupQuery {}

void main() {
  late RequestContext context;
  late GroupQuery groupQuery;

  const userId = 'id';

  setUp(() {
    context = _MockRequestContext();
    groupQuery = _MockGroupQuery();
    when(() => context.read<GroupQuery>()).thenReturn(groupQuery);
  });

  group('GET /group', () {
    test('responds with a 200 and return List of groups', () async {
      
      final request = Request.get(
        Uri.parse('http://localhost/users/$userId/groups'),
      );

      when(() => groupQuery.getAllGroups(any())).thenAnswer((_) async => []);
      when(() => context.request).thenReturn(request);

      final response = await route.onRequest(context, userId);

      expect(response.statusCode, equals(HttpStatus.ok));

      verify(() => groupQuery.getAllGroups(userId)).called(1);
    });
  });

  group('POST /group', () {
    test('create and join group', () async {
      
      final request = Request.post(
        Uri.parse('http://localhost/users/$userId/groups'),
        body: 'group',
      );

      when(() => groupQuery.createGroup(any())).thenAnswer((_) async => '11');
      when(() => groupQuery.joinGroup(any(), any())).thenAnswer((_) async {});
      when(() => context.request).thenReturn(request);

      final response = await route.onRequest(context, userId);

      expect(response.statusCode, equals(HttpStatus.created));

      verify(() => groupQuery.createGroup('group')).called(1);
    });
  });
}
