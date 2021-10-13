# Ojective
The application allows a Twitter user to be searched by their username, and if found, displays the most recent tweets from that user. And it presents a possible evaluation of feelings in relation to this tweet, which can be classified into three possible feelings: sad, neutral and happy, when it is selected from the list, showing three possible emojis to represent these feelings.

# Architecture and structure
This sample app to demonstrate some aspect of clean architecture using MVVM-C pattern, RxSwift, dependency injection, unit testing, and some of the best practices used in modern iOS programming using Swift.

# 3rd Party Libraries
- <code>CocoaPods</code> for dependency management;
- <code>RXSwift</code> for asynchronous and reactive communication;
- <code>Swinject</code> for dependency injection;
- <code>Moya</code> for communicating with APIs;
- <code>ObjectMapper</code> for mapping the serialization of API responses;
- <code>lottie-ios</code> for animations;
- <code>SwiftSpinner</code> for loading;
- <code>BRYXBanner</code> to display temp messages alert;
- <code>RxBlocking</code> for help in the testing layer.

# APIs used
- API REST from Twitter (https://developer.twitter.com)
- API REST from Google Natural Language (https://cloud.google.com/natural-language)

# Installation
Run the <code>pod install</code> command

# How to run
The keys for both the Twitter API and the Google API are still functional for testing, so just run the application and everything should work.
If it no longer works, it will be because the keys have already been intentionally disabled, and you need to update them within <code>Resources/Configuration.plist</code>
