# Day 1 – Dashboard UI (Part 1)

Today I started building the first dashboard screen from the design.

I completed the header section by matching the greeting text, notification button, spacing, and typography as closely as possible to the mockup. I also adjusted the text styling and positioning to better match the original design.

Next, I built the Progress Card, including the custom calorie progress indicator, floating base, and overall layout. I spent some time refining the proportions, colors, gradients, and spacing to make it look as close to the reference as possible.

I also completed the Current Weight card. This included recreating the circular icon container, the weight display, and the bottom progress indicator using an SVG asset. A few layout adjustments were made to ensure the card remained responsive without overflow issues.

Finally, I organized the assets, added the required packages, and kept the code modular by separating reusable widgets into their own files.

### What I learned
- Building reusable Flutter widgets instead of placing everything inside `main.dart`.
- Using `CustomPainter` and gradients to recreate complex UI elements.
- Working with SVG assets and custom icons.
- Fine-tuning spacing, typography, and layout to achieve a pixel-perfect design.
- Debugging Flutter layout issues such as `RenderFlex` overflows and responsive sizing.