<p align="center">
  <img src="https://github.com/matt-novoselov/Linguine-Backend/blob/b9a6f794c6286ffa10ee1c40ce3a817e1ed780b2/LinguineIconRounded.png" alt="Logo" width="80" height="80">
  <h2 align="center">
    Linguine
  </h2>
</p>

<img src="https://github.com/matt-novoselov/matt-novoselov/blob/79c191afd3a463f993688531e61d04f7e41002bd/Files/ios17.svg" alt="SwiftUI" style="height: 30px"> <img src="https://github.com/matt-novoselov/matt-novoselov/blob/79c191afd3a463f993688531e61d04f7e41002bd/Files/SwiftUI.svg" alt="SwiftUI" style="height: 30px">

Frontend code for Linguine - your online language-learning companion, designed to transform education into an enjoyable, gamified experience. Dive into complete lessons and engage in friendly competition with your peers!

<a href="https://youtu.be/bDzZPEOf0J8" target="_blank">
  <img src="https://github.com/matt-novoselov/Linguine-Backend/assets/59065228/02f11e91-ef30-4784-91ee-b525a6ad4429" alt="GIF">
</a>

[![](https://github.com/matt-novoselov/matt-novoselov/blob/34555effedede5dd5aa24ae675218d989e976cf6/Files/YouTube_Badge.svg)](https://youtu.be/bDzZPEOf0J8)

## Description
The app was built using **SwiftUI** to create a visual interface, which was inspired by [Duolingo](https://www.duolingo.com/).

Linguine includes **7 levels and 21 lessons** to help you learn foreign languages. As of now, Italian is the only language available for learning in the app.

**Lottie Files** are used to render vector-based animations, with these animations stored as `.lottie` files in the Resources folder of the project.

For secure authentication and authorization, the app uses **Auth0**. Auth0 meets all requirements and certificates, including GDPR and HIPAA. The login process involves storing the user’s nickname and score in the database to enable functionality of a leaderboard showcasing top-ranking users. Additionally, sign-in and sign-out functionality help synchronize user progress across various devices.

A custom backend server, developed using FastAPI, is required to manage user registration, score updates, and leaderboard management. Detailed information on deploying your own Linguine backend server can be found in the [Readme file of the Linguine backend repository](https://github.com/matt-novoselov/Linguine-backend). The app uses the API endpoint of that server to pass the data.

Our app incorporates accessibility features to assist our users, including support for VoiceOver.

## Requirements
- iOS 17.0+
- Xcode 15.0+

## Installation
1. Open Xcode.
2. Click on **"Clone Git Repository"**.
3. Paste the following URL: `https://github.com/matt-novoselov/Linguine-Frontend.git`
4. Click **"Clone"**.
5. Install and run the backend server [following instructions](https://github.com/matt-novoselov/Linguine-backend).
6. Build and run the project in Xcode.

## Dependencies
- [Lottie for Swift Package Manager](https://github.com/airbnb/lottie-spm) - a cross-platform library that natively renders vector-based animations.
- [Auth0.swift](https://github.com/auth0/Auth0.swift) - Auth0 iOS SDK to make requests to the Auth0 Authentication APIs.

<br>

## Credits
Distributed under the MIT license. See **LICENSE** for more information.

Developed with ❤️ by Matt Novoselov
