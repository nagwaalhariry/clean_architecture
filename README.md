# Flutter Clean Architecture Template

Production-ready, reusable Flutter template using **feature-first clean architecture** with strict separation of concerns.

## What this template includes

- Feature-first folder structure
- `core` layer with:
  - global `Failure` handling
  - `BaseUseCase` abstraction
  - network connectivity abstraction
- Data / Domain / Presentation layers
- Repository pattern
- Dependency Injection with `get_it`
- `Equatable` entities and states
- Null safety (Dart 3)
- A minimal `sample_feature` to demonstrate wiring (no real business feature)

---

## Folder structure

```text
lib/
  main.dart
  src/
    app.dart
    di/
      injection_container.dart
    core/
      error/
        exceptions.dart
        failures.dart
        failure_mapper.dart
      network/
        network_info.dart
        network_info_impl.dart
      usecase/
        base_usecase.dart

  features/
    sample_feature/
      data/
        datasources/
          sample_remote_data_source.dart
        models/
          sample_model.dart
        repositories/
          sample_repository_impl.dart
      domain/
        entities/
          sample_entity.dart
        repositories/
          sample_repository.dart
        usecases/
          get_sample_message.dart
      presentation/
        cubit/
          sample_feature_cubit.dart
          sample_feature_state.dart
        pages/
          sample_feature_page.dart
```

---

## Architecture rules (SOLID aligned)

### 1) Dependency Rule
Outer layers depend on inner layers, never the opposite.

- `presentation` -> `domain`
- `data` -> `domain`
- `domain` -> no Flutter/framework details

### 2) Single Responsibility
Each class has one reason to change:
- Use case: one business action
- Repository implementation: orchestration + mapping errors
- Data source: raw IO access
- Cubit: UI state transitions

### 3) Open/Closed & Liskov
Abstractions (`SampleRepository`, `NetworkInfo`, `BaseUseCase`) enable extension without modifying consumers.

### 4) Interface Segregation
Small focused interfaces (`SampleRemoteDataSource`, `NetworkInfo`) avoid forcing unused methods.

### 5) Dependency Inversion
High-level modules depend on abstractions; concrete implementations are wired in `get_it`.

---

## Layer responsibilities

### Core layer (`lib/src/core`)
Reusable cross-feature primitives.

- `failures.dart`: global typed failure hierarchy
- `exceptions.dart`: low-level exceptions from data sources
- `failure_mapper.dart`: converts failures into user-facing messages
- `base_usecase.dart`: shared `BaseUseCase<Type, Params>` + `NoParams`
- `network_info.dart`: connectivity contract
- `network_info_impl.dart`: concrete internet checker implementation

### Domain layer (`feature/domain`)
Pure business contracts and entities.

- `entities`: immutable domain objects (with `Equatable`)
- `repositories`: abstract contracts used by use cases
- `usecases`: business actions returning `Either<Failure, T>`

### Data layer (`feature/data`)
Infrastructure implementation.

- `models`: serialization/deserialization
- `datasources`: API/local DB clients
- `repositories`: implement domain contracts and map exceptions -> failures

### Presentation layer (`feature/presentation`)
UI + state management.

- `cubit`: state transitions and use case orchestration
- `pages`: UI rendering and failure message mapping

---

## Dependency injection

All dependencies are registered in:
- `lib/src/di/injection_container.dart`

Pattern used:
- `registerFactory` for UI state objects (`Cubit`)
- `registerLazySingleton` for use cases, repositories, and services

---

## Failure flow

1. Data source throws typed exceptions (`ServerException`, `CacheException`).
2. Repository catches them and returns typed `Failure` (`ServerFailure`, etc.).
3. Use case forwards `Either<Failure, Entity>` to presentation.
4. Presentation maps failure to user-friendly text via `mapFailureToMessage`.

---

## sample_feature (demonstration only)

`sample_feature` is intentionally simple and non-business-specific. It shows how a feature should be wired end-to-end without embedding domain-specific logic.

You can duplicate this feature as a blueprint when creating real modules.

---

## Getting started

1. Install dependencies:
   ```bash
   flutter pub get
   ```
2. Run the app:
   ```bash
   flutter run
   ```
3. Run tests:
   ```bash
   flutter test
   ```

---

## How to add a new feature

1. Create `features/<feature_name>/` with `data/domain/presentation`.
2. Define entity + repository contract in `domain`.
3. Add use cases in `domain/usecases`.
4. Implement data source + repository in `data`.
5. Add cubit/page in `presentation`.
6. Register dependencies in `injection_container.dart`.

Keep framework details out of `domain`, and keep `core` generic/reusable across features.
