Recipe App

### Steps to Run the App

Clone the repository: Clone this repository to your local machine using the following command:
git clone https://github.com/yourusername/recipe-app.git
Open the project in Xcode: Open the RecipeApp.xcodeproj file in Xcode.
Build and run: Select the appropriate simulator or device and click the Run button in Xcode or use the shortcut Cmd + R.
Running tests: To run unit tests, go to Product > Test in Xcode or use the shortcut Cmd + U.

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

In this project, I prioritized the following areas:

1. Concurrency and Network Handling
Ensuring proper handling of network requests and responses was a key focus. This includes fetching data asynchronously with async/await and managing network errors gracefully. I used URLSession for network requests and handled JSON parsing and error management.
2. Image Caching
Since images were loaded from remote URLs, I focused on implementing image caching to reduce network load. I used the popular Kingfisher library, rather than a handwritten solution to handle image caching both in memory and on disk. This ensures that images are cached locally, preventing unnecessary re-fetching from the server but didn't consume valuable dev time for such a small scale ask.
3. UI/UX and Performance Optimization
For a smooth user experience, I ensured that the UI only loads images when needed using LazyVStack. This approach optimizes memory usage by loading content lazily. Additionally, I incorporated a loading indicator while fetching data to improve the user experience during network requests.
4. Unit Testing
I focused on writing unit tests to validate various scenarios, including successful data fetching, malformed data, and empty data. I used mock data and the provided test URLs to verify the app's behavior.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

The project took approximately 2.5 hours to complete, broken down as follows:

Project Setup & Architecture (.5 hour): Setting up the initial project structure, creating the necessary files, and setting up the network manager.
UI Development (.5 hours): Implementing the main screen with SwiftUI, including the layout for recipes and caching images.
Network Handling & Error Management (.5 hour): Implementing asynchronous network calls and error handling for valid, malformed, and empty data.
Image Caching with Kingfisher (.25 hour): Integrating Kingfisher to cache images locally for better performance.
Unit Testing (.25 hours): Writing unit tests for various edge cases, including successful fetch, malformed data, and empty data scenarios.
Code Review, Refactoring, Read-Me (.5 hour): Writing markup here and refactoring some code for readability and best practices.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?

Network Fetching Approach: I used URLSession for network fetching instead of third-party libraries to keep the app lightweight and to demonstrate handling basic network operations without additional dependencies.
Image Caching: Although URLCache could be used for caching, I opted for Kingfisher due to its robust and feature-rich caching capabilities, which made the implementation more flexible and efficient for image handling.
Error Handling: I opted for a simpler approach to error handling by showing a basic error message when data is malformed or empty. A more detailed user-facing error UI could have been implemented, but this was sufficient for the scope of the project.

### Weakest Part of the Project: What do you think is the weakest part of your project?

Error Handling and User Feedback: While I ensured that errors were handled properly in terms of data fetching, there could be more advanced user feedback mechanisms such as custom error screens, retry options, or more detailed messaging. Additionally, I didn't address network-specific errors (e.g., no internet connection) in this iteration, though this could be improved in a real-world application.

It should also be noted that this app is incredibly simple, I could have spent more time enhancing the UI for a detail screen when clicking on the rows, I also could use placeholders for loading data for a more seamless user experience

### External Code and Dependencies: Did you use any external code, libraries, or dependencies?

Kingfisher: I used Kingfisher for caching images efficiently. This library provides robust memory and disk caching, which reduces the need to repeatedly download images, saving network bandwidth and improving performance.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.

Concurrency with async/await: I used Swift Concurrency (async/await) to handle network fetching and avoid blocking the main thread. This helps ensure a smooth user experience even when network calls take some time.
Mock Data and Testing: The tests are run using the provided test URLs to simulate different scenarios like valid, empty, and malformed data. This ensures that the app handles edge cases gracefully without relying on hardcoded mock data.
Performance Considerations: The app loads images lazily using LazyVStack to avoid excessive memory usage, particularly when displaying a long list of recipes.
This README provides a clear overview of how the project was structured, the decisions made during development, and how to run and test the app.
Constraints: I am currently engaged in a full time job with my company working about 9 hours per day this week along with a busy home life with 3 small children. Finding time to sink into this takehome and really give it 110% was challenging. I opted to use AI prompting to help lighten the workload of most straightforward tasks in order to make the most of the time I had. 
