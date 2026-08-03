# Day 3 – Calendar Screen and Navigation

Today I started working on the second screen of the app by setting up navigation between the different pages.

I connected the bottom navigation bar so that I could switch between the Dashboard, Calendar, and Scan screens while keeping the selected tab highlighted. It also helped me understand how `IndexedStack` can be used to preserve the state of each screen while navigating.

I then started building the Calendar screen. I added the custom back button, notification button, and the Week Days section with the vertical day indicators and the selected date. Getting the spacing, sizing, and positioning to match the reference design took a few iterations, but it gave me a better understanding of Flutter's layout widgets.

I also spent some time organizing the code by keeping the new components separate and reusable instead of putting everything into a single file.

## What I Learned

- How to navigate between multiple screens in Flutter.
- Using `IndexedStack` to keep screen state while switching tabs.
- Building reusable widgets for different parts of the UI.
- Using layout widgets like `Row`, `Column`, and `Stack` to recreate a design.
- How small changes in spacing and alignment can make a big difference when trying to match a UI mockup.