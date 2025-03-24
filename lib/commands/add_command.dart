import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:path/path.dart' as path;
import '../utils/logger.dart';
import '../templates/template_manager.dart';

class AddCommand extends Command {
  @override
  final name = 'add';
  
  @override
  final description = 'Add a pre-styled UI component to your Flutter project';

  AddCommand() {
    argParser.addOption(
      'output-dir',
      abbr: 'o',
      defaultsTo: 'lib/ui',
      help: 'Directory where the component will be created',
    );
  }

  @override
  Future<void> run() async {
    if (argResults!.rest.isEmpty) {
      Logger.error('Please specify a component name');
      exit(1);
    }

    final componentName = argResults!.rest.first;
    final outputDir = argResults!['output-dir'] as String;
    
    try {
      await _createComponent(componentName, outputDir);
      Logger.success('Successfully created $componentName component');
    } catch (e) {
      Logger.error('Failed to create component: ${e.toString()}');
      exit(1);
    }
  }

  Future<void> _createComponent(String componentName, String outputDir) async {
    final template = TemplateManager.getTemplate(componentName);
    if (template == null) {
      throw 'Component template "$componentName" not found';
    }

    final dir = Directory(outputDir);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    final filePath = path.join(outputDir, '${componentName}.dart');
    if (File(filePath).existsSync()) {
      throw 'Component already exists at $filePath';
    }

    await File(filePath).writeAsString(template);
  }
}