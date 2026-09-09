# Architectural & Coding Guardrails

## Architecture: MVC + Services with GetX
You must strictly adhere to the MVC architecture pattern combined with GetX for state management. Never mix UI, business logic, and data.

Enforce this exact folder structure:
- `lib/models/`: Pure data classes, serialization (`fromJson`/`toJson`). No UI or GetX controllers here.
- `lib/services/`: Long-lived infrastructure. All database, local storage, and Local AI/Gemma integrations MUST be encapsulated in classes extending `GetxService`. This ensures the multi-gigabyte AI model remains safely in memory and is not destroyed on route changes.
- `lib/controllers/`: Ephemeral business and view logic. Must extend `GetxController`. Use `Rx` types (e.g., `.obs`) and `RxStatus` to manage UI loading states (especially during the initial local model cold-start phase) before token streaming begins. Controllers interact with Services, but do not initialize the AI themselves.
- `lib/views/`: UI layout only. All views must extend `GetView<YourController>`. Wrap UI pieces that depend on reactive state strictly inside `Obx()` or `controller.obx()`.
- `lib/bindings/`: Declare GetX dependency bindings here. Use `Get.putAsync()` for Services that require asynchronous initialization (like loading the Gemma model) and `Get.lazyPut()` for Controllers.
- `lib/routes/`: Centralized routing logic. Must contain `app_pages.dart` (for `GetPage` arrays and binding attachments) and `app_routes.dart` (for static route name constants). Keep routing logic strictly out of `main.dart`.

## Dependency Requirements
- Only use highly stable Flutter packages that have been actively updated within the last 12 months. Do not use legacy or deprecated packages.
- **AI Exemption:** Specifically use `flutter_gemma` (^1.0.0). Note that as of v1.0, the package is split. You must include both `flutter_gemma` (core) and the specific engine package required for the platform (e.g., `flutter_gemma_mediapipe` for Android/iOS).

## Code Formatting
- Always run `dart format .` after modifying or creating files.
- Use trailing commas for nested widget trees to ensure clean formatting.