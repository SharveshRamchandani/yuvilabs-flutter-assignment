# Day 0 - Initial Setup and Project Foundation

Today I set up the Flutter development environment and verified that the application builds and runs successfully on my physical Android device.

Instead of putting everything inside `main.dart`, I spent some time setting up a clean project structure for the rest of the assignment. I created reusable theme files (`app_colors.dart` and `app_typography.dart`) to keep colors and text styles organized in one place.

I also created my first reusable widget, `Day0Card`, inside `lib/widgets/day0_card.dart` to understand custom widgets, styling, and parameter passing. After that, I updated `main.dart` to use the new `FitnessApp` structure and modified `widget_test.dart` so the existing tests match the current application.

This setup gives me a solid foundation for the remaining days without having to restructure the project later.

## Next Steps

On Day 1, I'll begin building the main dashboard UI by implementing the first reusable layout components.