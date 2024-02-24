# Movie App

The Weather App is a mobile application designed to provide users with accurate weather forecasts. It follows the MVVM (Model-View-ViewModel) architecture for a modular and scalable codebase.

## Features

- Fetches Movie data from various sources
- Displays Movie information to users
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

## App ScreenShots
![screenshot-3](https://github.com/hersheyckey/movie_db/assets/123447308/0267f351-4455-4a47-a289-3474e6c5ad9e)
![screenshot-2](https://github.com/hersheyckey/movie_db/assets/123447308/cb8fdae7-3144-4485-94ab-f144781c529c)
![screenshot-1](https://github.com/hersheyckey/movie_db/assets/123447308/ee1fd1b7-ed06-4c04-ab78-b8634d04de09)
![screenshot-6](https://github.com/hersheyckey/movie_db/assets/123447308/cbb35820-fec2-42f1-a6c0-7922549dc663)
![screenshot-5](https://github.com/hersheyckey/movie_db/assets/123447308/72f02ba9-4c31-4c3b-be83-ce2b5c9eae5d)
![screenshot-4](https://github.com/hersheyckey/movie_db/assets/123447308/5e9cfc73-68e1-4e4a-b6ef-36cac1585f24)

Contributions are welcome! Fork this repository, make your enhancements or fixes, and submit pull requests following the contribution guidelines.

## License

This project is licensed under the [MIT License](LICENSE).
