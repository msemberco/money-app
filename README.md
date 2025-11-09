# Money App

A Flutter-based personal finance dashboard that helps you monitor incomes, expenses, and overall balance at a glance.

## Getting Started

1. **Install Flutter** – Follow the official guide: <https://docs.flutter.dev/get-started/install>.
2. **Open in VS Code** – Ensure the Flutter and Dart extensions are installed. The repository already contains launch configurations in `.vscode/`.
3. **Fetch dependencies**
   ```bash
   flutter pub get
   ```
4. **Run the application**
   ```bash
   flutter run
   ```

## Project Structure

- `lib/main.dart` – Entry point that bootstraps the application.
- `lib/screens/dashboard_screen.dart` – Initial dashboard UI with balance, income, and expense summaries.
- `lib/widgets/` – Reusable UI components such as transaction tiles and summary cards.
- `lib/models/transaction.dart` – Basic data model for income and expense transactions.
- `lib/theme/app_theme.dart` – Centralized theme configuration.

Feel free to customize the sample data with real backend integrations, add state management, or connect to local storage for persistence.
