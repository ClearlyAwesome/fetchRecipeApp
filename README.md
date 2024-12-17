# fetchRecipeApp
An app built for a company as part of a project

**Steps to Run the App
-Clone the project repository.
-Open the project in Xcode (version 14 or later is recommended).
-Build and run the app on the simulator or a real device.
-Ensure you have internet access since the app fetches recipes from an API.
-Pull-to-refresh on the main screen to see updated recipes.

**Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
--I prioritized clean architecture and efficient networking using Swift Concurrency (async/await). I wanted the project to be scalable and easy to maintain. This helped me build a lightweight and responsive app that avoids external dependencies.

**Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
--I spent around 5-ish hours on this project.
~30 min: Setting up the project structure and organizing folders...This is always critical. 
~2 hours: Building the core functionality — models, API fetching with Swift Concurrency, and error handling.
~2 hour: Testing the app and debugging.
~30 minutes: Polishing the UI, adding pull-to-refresh, and writing documentation.

**Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
--I decided not to use external libraries (e.g., Alamofire or Kingfisher) to demonstrate my understanding of raw SwiftUI and Concurrency. The trade-off is that manual image caching took longer to implement, but it keeps the project lean and flexible.

**Weakest Part of the Project: What do you think is the weakest part of your project?
--The weakest part is probably the fact that you have to go through multiple pages to get to the recipe. You tap the row, then tap the recipe button. That button brings you to a web browser. It is just kind of klunky. 

**Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
--One challenge I faced was handling edge cases like malformed API responses or empty datasets. I built in graceful error handling, but there’s always room for improvement.

**If I had more time, I’d:
-Add more unit tests, especially for UI and edge cases.
-Enhance the UI with animations and recipe details screens.
-Explore SwiftData or Core Data for offline functionality.

Overall, I’m happy with the project. It’s clean, focused, and shows how I approach building a SwiftUI app from scratch.
