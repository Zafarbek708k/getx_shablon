import 'home_state.dart';

abstract class HomeLogic{
 abstract final HomeState state ;
 void switchTheme();
 Future<void> getCars(String email, String password);
}
