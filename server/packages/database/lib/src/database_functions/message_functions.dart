import 'package:database/database.dart';
import 'package:database/src/sql_connection.dart';
import 'package:models/models.dart';

mixin MessageFunction on SqlConnection {

  Future<MessageDetails?> getMessage(String id) async {
    return DatabaseException.wrapper<MessageDetails?>(
      body: () async {
        final result = await sqlConnection.execute(
          "SELECT hex(`user`.`id`) as id, `user`.name, message from `user` join messages on messages.id = '$id'",
        );
        
        if (result.rows.isNotEmpty) {
          final row = result.rows.first;
          final user = User.fromJson(row.assoc());

          return MessageDetails(user: user, message: row.assoc()['message']!);
        }

        return null;
      },
      message: 'Couldn\'t fetch message',
    );
  }

  Future<String> createMessage(Message message) async {
    return DatabaseException.wrapper<String>(
      body: () async {
        final result = await sqlConnection.execute(
          'insert into messages(groupId, userId, message) values(:groupId, unhex(:userId), :message)',
          message.toJson(),
        );

        return result.lastInsertID.toString();
      },
      message: 'Couldn\'t save message to database',
    );
  }

}
