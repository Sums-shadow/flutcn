# flutcn

A CLI tool for adding pre-styled Flutter UI components to existing projects, inspired by shadcn/ui.

## Installation

```bash
dart pub global activate flutcn
```

## Usage

Add a pre-styled component to your Flutter project:

```bash
flutcn add <component-name>
```

Available components:
- button: A customizable button with variants and loading state
- card: A styled card component with customizable elevation and padding

## Component Location

Components are created in the `lib/ui` directory by default. You can specify a custom directory using the `--output-dir` option:

```bash
flutcn add button --output-dir=lib/components
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.