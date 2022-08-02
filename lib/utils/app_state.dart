import 'package:rainbow/model/user_model.dart';

class AppState {
  static final AppState _singleton = AppState.internal();

  factory AppState() {
    return _singleton;
  }

  AppState.internal()  {
    throw UnimplementedError();
  }

  UserModel? currentUser;

  String? currentActiveRoom;
}

AppState appState = AppState();
