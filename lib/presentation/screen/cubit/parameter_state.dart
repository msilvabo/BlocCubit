// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ParameterState extends Equatable {
  final String server;
  final String api;

  const ParameterState({this.server= '', this.api = ''});
  
  @override
  List<Object?> get props => [server, api];

  ParameterState copyWith({
    String? server,
    String? api,
  }) {
    return ParameterState(
      server: server ?? this.server,
      api: api ?? this.api,
    );
  }
}
