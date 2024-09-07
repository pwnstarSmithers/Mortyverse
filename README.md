

```markdown
# Mortyverse

## Project Overview

This iOS application interacts with the [Rick and Morty API](https://rickandmortyapi.com/documentation) to fetch and display a list of characters in a paginated manner. It supports pagination, showing 20 characters per page, and provides a detailed view of each character.

## Features

- **Character List**: Displays a paginated list of characters, 20 characters at a time, with each item including the character's name, image, and species.
- **Character Filtering**: Users can filter characters based on their status (alive, dead, unknown).
- **Character Details**: Clicking on a character will show additional details such as name, species, status, and gender.

## Technologies Used

- **UIKit**: Used for managing table view and pagination.
- **SwiftUI**: Used for building smaller, reusable views.
- **Networking**: Fetches data from the Rick and Morty API.

## Requirements

- Xcode 12+
- Swift 5+
- iOS 14+

## Getting Started

To build and run this application locally, follow these steps:

1. Clone this repository to your local machine.
    ```bash
    git clone <[your-repo-url](https://github.com/pwnstarSmithers/Mortyverse.git)>
    ```
2. Open the project in Xcode.
    ```bash
    open Mortyverse.xcodeproj
    ```
3. Build and run the application using a compatible iOS simulator or physical device.

## Assumptions and Decisions

- Pagination is implemented by loading 20 characters at a time from the API.
- Data is fetched using a simple networking layer.
- Filtering by character status (alive, dead, unknown) is handled client-side.

## Challenges Faced

- Integrating UIKit with SwiftUI for optimal performance.
- Managing pagination efficiently to avoid unnecessary API calls.
- Creating a smooth and responsive user interface for paginated content.

## Unit Testing

(Optional) Add details about any unit or integration tests if applicable.

## Future Improvements

- Implementing infinite scrolling for seamless pagination.
- Adding caching for improved performance and offline capability.
- Enhancing error handling for network issues.
  
## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```
