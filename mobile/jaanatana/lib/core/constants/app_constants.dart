class AppConstants {
  static const String appName = 'Jaanatana';
  /// Keep the current deployment host until a Jaanatana API host is provisioned.
  /// For local development, pass the backend URL with `--dart-define=API_BASE_URL=...`.
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://vyaparai-rtx0.onrender.com',
  );

  /// Network logs can include sensitive headers and must be explicitly enabled.
  static const bool enableLogging = bool.fromEnvironment(
    'ENABLE_LOGGING',
    defaultValue: false,
  );
}
