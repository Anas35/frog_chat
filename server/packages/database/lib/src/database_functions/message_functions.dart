import 'package:database/database.dart';
import 'package:models/models.dart';
import 'package:mysql_client/mysql_client.dart';

class MessageFunction {
  final MySQLConnection sqlConnection;

  MessageFunction({required this.sqlConnection});

  Future<dynamic> getMessage(String id) async {
    return DatabaseException.wrapper<dynamic>(
      body: () async {
        final result = await sqlConnection.execute(
          "SELECT hex(`user`.`id`), `user`.name, message from `user` join messages on messages.id = '$id'",
        );
        
        if (result.rows.isNotEmpty) {
          return result.rows.first.assoc();
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
