import 'package:database/database.dart';
import 'package:database/src/sql_connection.dart';
import 'package:models/models.dart';

mixin MessageFunction on SqlConnection {

  Future<MessageDetails?> getMessage(String id) async {
    return DatabaseException.wrapper<MessageDetails?>(
      body: () async {
        final result = await sqlConnection.execute(
          "SELECT hex(`user`.`id`), `user`.name, message from `user` join messages on messages.id = '$id'",
        );
        
        if (result.rows.isNotEmpty) {
          return MessageDetails.fromJson(result.rows.first.assoc());
        }

        return null;
      },
      message: 'Couldn\'t fetch message',
    );
  }

  Future<String?> createMessage(Message message) async {
    return DatabaseException.wrapper<String?>(
      body: () async {
        await sqlConnection.execute(
          'insert into messages(groupId, userId, message) values(:groupId, unhex(:userId), :message)',
          message.toJson(),
        );

        return _fetchNewId();
      },
      message: 'Couldn\'t save message to database',
    );
  }

  Future<String?> _fetchNewId() async {
    return DatabaseException.wrapper<String?>(
      body: () async {
        final result = await sqlConnection.execute("SELECT LAST_INSERT_ID()");
        return result.rows.first.colByName("LAST_INSERT_ID()");
        /*return await sqlConnection.execute(
          "select id from messages where groupId = '$groupId' order by id desc LIMIT 1",
        );*/
      },
      message: 'Couldn\'t fetch last inserted Id',
    );
  }

}
