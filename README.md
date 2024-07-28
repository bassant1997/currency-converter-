# currency-converter
Create a currency converter app with the following features:  List of supported currencies with country flags, stored locally after the first API request for offline access. Historical data for two chosen currencies over the last 7 days. Currency converter allowing users to select two currencies and input an amount to convert.

## Instructions to Build
1. Clone the repository.
3. Run the app.
'note':you must have Flutter installed.

 ## App Architecture
 The app follows the Bloc pattern for state management.I have chosen This pattern for its scalability and help me to seperate all logig from UI, making it easier to 
 manage state changes and business logic.

 ## Image Loader Library
 The app uses `cached_network_image` for loading and caching images.I have chosen This library for its easy of use and ability to cache images, reducing network 
 calls and improving performance.

 ## Database
 The app uses Hive database for store data locally.Hive is easy to use and lightweight.providing fast storage and retrieval of data, and improving app profrmancing

 ## Handling API requests
 The app uses the Dio package for handling API requests. Dio is a powerful HTTP client for Dart, making it an excellent choice for efficient network operations.






 



