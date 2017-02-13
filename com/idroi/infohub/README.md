# InfoHub 
A library provides you to use Infohub from your Android app.

# Using Infohub's API

## Installation

### Android
The easiest way to use Infohub's API is with gradle. Add the following lines to your root `build.gradle` at the end of repositories:


```ruby
allprojects {
	repositories {
		...
		maven { url "https://github.com/IDroi/InfoHub/raw/master/" }
	}
}
```

Add dependencies

```ruby
   compile ('com.idroi.infohub:+'){
        changing=true
    }
```
