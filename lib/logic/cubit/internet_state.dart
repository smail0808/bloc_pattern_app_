part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}
// before we check for internet state
class InternetLoading extends InternetState {}

// if there is internet state
class InternetConnected extends InternetState {
  final ConnectionType connectionType;

  InternetConnected({@required this.connectionType});
}
// desconnect state 
class InternetDesconnected extends InternetState {}
