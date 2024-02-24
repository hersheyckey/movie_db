# Movie App

The Weather App is a mobile application designed to provide users with accurate weather forecasts. It follows the MVVM (Model-View-ViewModel) architecture for a modular and scalable codebase.

## Features

- Fetches weather data from various sources
- Displays weather information to users
- Separates business logic from presentation for easy maintenance

## Project Structure

- **app.dart:** Entry point of the application.
- **constants.dart:** Contains constant values used throughout the application.
- **data/:** Handles data-related functionalities.
  - **network/:** Manages network operations.
  - **repository_impl/:** Implements data repositories.
- **domain/:** Contains business logic.
  - **repository/:** Defines interfaces for data repositories.
- **models/:** Defines data models.
- **presentation/:** Manages user interface and interaction.
  - **screens/:** Contains screen components.
  - **view_models/:** Holds ViewModel classes.
- **resources/:** Manages application assets, colors, fonts, routes, strings, styles, and other values.
- **main.dart:** Entry point for the Flutter application.

## Installation

1. Ensure you have Flutter installed.
2. Clone this repository.
3. Run `flutter pub get` to install dependencies.
4. Launch the app using `flutter run`.

## Contributing

Contributions are welcome! Fork this repository, make your enhancements or fixes, and submit pull requests following the contribution guidelines.

## License

This project is licensed under the [MIT License](LICENSE).
