# TweetNotification
The app searches for the tweets for the given hashtag and when the app is in background, it notifies for any new tweets for that hashtag

# Prerequisites
1. Make sure that at least one twitter account is configured in Twitter settings
2. App works on iPhone and iPod running an iOS version not earlier than 8.0

# Steps to use
1. Open the file TweetNotification.xcworkspace to run the project.
2. Make sure that target 'TwitterNotification' is selected to run the project and click Run button.
3. Enter the hashtag to search for (without #)
4. The app will show latest 10 tweets with the given hashtag.
5. Put the app in the background
6. Now if the app receives any tweets containing the same hash tag then it will schedule a local notification and fire it after 3 seconds
