import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:injectable/injectable.dart';

import 'package:booster/infrastructure/core/connection_repository/i_connection_repository.dart';

@LazySingleton(as: IConnectionRepository)
class DataConnectionRepository implements IConnectionRepository {
  final DataConnectionChecker _connectionChecker;

  const DataConnectionRepository(this._connectionChecker);

  @override
  Future<ConnectionStatus> getConnectionStatus() async {
    return await _connectionChecker.hasConnection ? ConnectionStatus.connected : ConnectionStatus.disconnected;
  }

  @override
  Stream<ConnectionStatus> get onConnectionStatusChanged {
    return _connectionChecker.onStatusChange.map(_mapConnectionStatus);
  }

  ConnectionStatus _mapConnectionStatus(DataConnectionStatus dataConnectionStatus) {
    switch (dataConnectionStatus) {
      case DataConnectionStatus.connected:
        return ConnectionStatus.connected;
      case DataConnectionStatus.disconnected:
        return ConnectionStatus.disconnected;
    }
    throw AssertionError();
  }
}
