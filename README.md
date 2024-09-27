# Workout Tracker App

## Project Overview

This is a Flutter application for tracking workouts. Users can create workouts, add multiple sets
for each workout, and track different exercises such as Bench Press, Deadlift, etc. The app uses the
**Provider** package for state management and includes features such as dropdown menus for exercise
selection and saving workouts to a list.

## Project Structure

**lib/**:

- **models/**: Contains the data models like `Workout` and `Set`.
- **providers/**: Contains `WorkoutProvider` for managing the state of workouts.
- **screens/**: UI screens such as the main `WorkoutScreen` for displaying and editing workouts.
- **widgets/**: Custom widgets like `CirclePlusButton`, `Set Tile` and `Workout Tile`.
- **utils/**: Utility files such as constants and helpers.
- **main.dart**: The main entry point for the Flutter app.

**test/**:

- **unit_test.dart**: Unit tests for `WorkoutProvider`.
- **widget_test.dart**: Widget tests for UI interactions on `WorkoutScreen`.
- **integration_test.dart**: End-to-end tests simulating the full user flow.

## Architecture Overview (MVP-like)

This app follows a simple **Model-View-Presenter (MVP)**-like architecture to maintain clarity and
separation of concerns. Since this is a relatively simple app, we adopted this architecture to keep
the code easy to understand and maintain.

### Flow of Data:

1. **User Interaction**: The user interacts with the **View** (e.g., adding a new set or changing
   the exercise).
2. **Presenter Logic**: The **Provider** (Presenter) handles the business logic of updating or
   modifying the data.
3. **Model Update**: The **Provider** updates the **Model** (e.g., adding or removing sets).
4. **View Update**: After updating the **Model**, **Provider** triggers a UI update
   using `notifyListeners()`, and the **View** re-renders based on the new data.
