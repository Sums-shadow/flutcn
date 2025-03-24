import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:flutcn/commands/add_command.dart';
import 'package:flutcn/utils/logger.dart';

void main(List<String> arguments) async {
  final runner = CommandRunner('flutcn', 'CLI tool for adding pre-styled Flutter UI components')
    ..addCommand(AddCommand());

  try {
    await runner.run(arguments);
  } catch (e) {
    Logger.error(e.toString());
    exit(1);
  }
}