import 'package:wow_shopping/app/app.dart';
import 'package:wow_shopping/bootstrap.dart';

void main() {
  bootstrap(
    () => const ShopWowApp(
      config: AppConfig(
        env: AppEnv.dev,
      ),
    ),
  );
}
