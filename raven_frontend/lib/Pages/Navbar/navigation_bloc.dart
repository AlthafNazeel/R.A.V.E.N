import 'package:bloc/bloc.dart';
import 'package:raven_frontend/Pages/Notifications.dart';
import 'package:raven_frontend/Pages/add_device.dart';
import 'package:raven_frontend/Pages/homePage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  NotificationClickedEvent,
  AddDeviceClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);

  NavigationStates get initialState => HomePage();

  //@override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.NotificationClickedEvent:
        yield NotificationsPageE();
        break;
      case NavigationEvents.AddDeviceClickedEvent:
        yield AddDevice();
        break;
    }
  }
}
