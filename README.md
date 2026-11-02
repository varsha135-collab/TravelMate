# TravelMate

TravelMate is a Flutter travel-planning app for browsing a small set of Indian destinations and keeping a simple list of planned trips. It includes a demo login, destination views, trip planning, and a profile screen.

## Features

- Demo login form with input validation.
- Home screen with destination previews and navigation to the app's main screens.
- Destination grid showing Manali, Goa, Assam, and Kerala with sample prices and local images.
- Destination detail screen with a short description and a shortcut to trip planning.
- Create trips with a destination, travel date, number of travelers, budget, and trip type.
- View and remove trips during the current app session.
- Profile screen with a logout action.
- Responsive destination grid that adjusts its column count to the available width.

Trips are stored in memory using `Provider`; they are not saved between app launches. Login uses hard-coded demo credentials and is not connected to an authentication service.

## Technologies

- [Flutter](https://flutter.dev/) and Dart
- Material 3 widgets and theming
- [`provider`](https://pub.dev/packages/provider) for trip state management
- [`cupertino_icons`](https://pub.dev/packages/cupertino_icons) for Cupertino-style icons
- Local destination images in `assets/`

## Requirements

- Flutter SDK installed and available on your `PATH`
- A Dart SDK satisfying the constraint in `pubspec.yaml` (`^3.13.4`), normally provided by a compatible Flutter SDK
- An available Flutter target: emulator, connected device, desktop environment, or web browser, depending on the platform you want to run

Check your Flutter installation and available targets with:

```shell
flutter doctor
flutter devices
```

## Setup

1. Clone the repository and enter the project directory:

   ```shell
   git clone <repository-url>
   cd travel_mate
   ```

2. Fetch the Flutter dependencies:

   ```shell
   flutter pub get
   ```

The destination images are bundled from `assets/` and are declared in `pubspec.yaml`; no separate asset download or backend configuration is required.

## Run

Start the app on the currently selected device or target:

```shell
flutter run
```

To select a specific target, first use `flutter devices`, then pass its device ID:

```shell
flutter run -d <device-id>
```

The app opens on the login screen. Use these demo credentials:

| Field | Value |
|---|---|
| Email | `student@gmail.com` |
| Password | `travel123` |

After login, use the home screen to explore destinations, create a trip, view planned trips, or open the profile screen. Created trips remain available only until the app process ends.

## Tests

Run the Flutter test suite with:

```shell
flutter test
```
