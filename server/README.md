# FrogChat Server

The FrogChat Server is built using Dart Frog and uses MySQL for the database. This server handles user authentication and group management for the FrogChat application.


[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![Powered by Dart Frog](https://img.shields.io/endpoint?url=https://tinyurl.com/dartfrog-badge)](https://dartfrog.vgv.dev)

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

## Getting started
To get started with the FrogChat Server, follow these steps:

### Clone the repository:

```
git clone https://github.com/yourusername/FrogChat.git
```

### Install the necessary dependencies:

```
cd FrogChat/server
dart pub get
```

### Set up the database:

Create a .env file in the server directory and add the following lines:

```
host=<your MySQL host>
port=<your MySQL port>
userName=<your MySQL username>
password=<your MySQL password>
DB_NAME=<your MySQL database name>
JWT_SCERET=<JWT Token>
```

Replace the values in angle brackets with your own MySQL information.

Once you have your .env file set up, run the schema file in web server to create necessary tables.

### Start the server:

```
dartfrog dev
```

The server will now be running on http://localhost:8080.

## Contributing
Contributions are welcome! If you find a bug or want to add a new feature, please open an issue or submit a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.