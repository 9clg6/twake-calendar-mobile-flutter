/// Application environments.
enum Environment {
  /// Local development.
  development,

  /// Staging / pre-production.
  staging,

  /// Production.
  production;

  /// Builds [Environment] from a `--dart-define=ENV=...` value.
  static Environment fromDefine(String? raw) {
    switch (raw) {
      case 'staging':
        return Environment.staging;
      case 'prod':
      case 'production':
        return Environment.production;
      case 'dev':
      case 'development':
      default:
        return Environment.development;
    }
  }
}
