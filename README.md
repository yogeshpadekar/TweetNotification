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

# Screenshots
### Launch Screen
![Launch screen](https://github.com/yogeshpadekar/TweetNotification/blob/master/Screenshots/Simulator%20Screen%20Shot%2006-Nov-2016%2C%206.17.52%20PM.png)

### Home Screen
![Home screen](https://github.com/yogeshpadekar/TweetNotification/blob/master/Screenshots/Simulator%20Screen%20Shot%2006-Nov-2016%2C%206.17.59%20PM.png)

### Tweet List
![Tweet List](https://github.com/yogeshpadekar/TweetNotification/blob/master/Screenshots/Simulator%20Screen%20Shot%2006-Nov-2016%2C%2011.59.10%20PM.png)

### Tweet Notification
![Tweet Notification](https://github.com/yogeshpadekar/TweetNotification/blob/master/Screenshots/Simulator%20Screen%20Shot%2006-Nov-2016%2C%206.14.38%20PM.png)
