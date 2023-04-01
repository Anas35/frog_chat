import 'package:database/src/database_exception.dart';
import 'package:models/models.dart';
import 'package:mysql_client/mysql_client.dart';

class MessageQuery {
  final MySQLConnection sqlConnection;

  MessageQuery(this.sqlConnection);

  Future<String> createMessage(Message message) async {
    final result = await sqlConnection.execute(
      'insert into messages(groupId, userId, message) values(:groupId, :userId, :message)',
      message.toJson(),
    );

    return result.lastInsertID.toString();
  }

  Future<MessageDetails> getMessage(String id) async {
    final result = await sqlConnection.execute(
      "SELECT `users`.`id`, `users`.name, message from `users` join messages on messages.id = '$id'",
    );

    if (result.rows.isNotEmpty) {
      final row = result.rows.first;
      return MessageDetails(
        userId: row.assoc()['id']!,
        userName: row.assoc()['name']!,
        message: row.assoc()['message']!,
        messageId: id,
      );
    }

    throw DatabaseException('No message with $id found');
  }

  Future<List<MessageDetails>> getGroupMessages(String groupId) async {
    final messages = await sqlConnection.execute(
      "SELECT `users`.`id` as id, `users`.name as name, `messages`.`id` as messageId, message from messages join `users` on messages.userId = `users`.`id` and messages.groupId = '$groupId'",
    );
    final list = messages.rows.map((row) {
      return MessageDetails(
        userId: row.assoc()['id']!,
        userName: row.assoc()['name']!,
        message: row.assoc()['message']!,
        messageId: row.assoc()['messageId']!,
      );
    }).toList();
    return list;
  }
}
