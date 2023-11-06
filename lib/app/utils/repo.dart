import 'dart:async';
import 'Example.dart';

abstract class ExampleRepository {
  Future<Example> getGreetings(String greeting);
}
