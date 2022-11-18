# arrivo_web

A new Flutter project.

## Getting Started

1. Generating Flutter Localization Keys
flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart


2. Running Freezed
flutter pub run build_runner watch --delete-conflicting-outputs
flutter pub run build_runner build --delete-conflicting-outputs

3. Enable WYSIWYG editor for web:
flutter run --web-renderer html