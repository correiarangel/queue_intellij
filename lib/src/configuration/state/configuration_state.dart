import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';

abstract class ConfigurationState {}

class EmpyConfigurationState implements ConfigurationState {}

class LoadingConfigurationState implements ConfigurationState {}

class LoadedConfigurationState implements ConfigurationState {
  final List<QueeuEntity> queues;

  LoadedConfigurationState(this.queues);
}

class ExceptionConfigurationState implements ConfigurationState {}
