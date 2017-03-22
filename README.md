# InfoHub 
A library provides you to use Infohub from your Android app.

# Using Infohub's API

## Installation

### Android
The easiest way to use Infohub's API is with gradle. There are two steps. 

* Add the following lines to your root `build.gradle` at the end of repositories:


```
allprojects {
	repositories {
		...
		maven { url "https://github.com/IDroi/InfoHub/raw/master/" }
	}
}
```

* Add dependencies

```
   compile ('com.idroi:infohub:+'){
        changing=true
    }
```

* Other dependencies - Droi

```
    compile 'com.squareup.okhttp3:okhttp:3.0.1'
    compile 'com.android.support:support-v4:25.0.1'
    compile 'com.droi.sdk:Core:+'
    compile 'com.droi.sdk:analytics:+'
    compile 'com.droi.sdk:selfupdate:+'    
```

* Other dependencies - Ads

```
   compile 'org.apache.commons:commons-lang3:3.5'
   compile 'com.google.android.gms:play-services-ads10.0.1'
   compile 'com.google.android.gms:play-services-analytics:10.0.1'
   compile 'com.google.android.gms:play-services-gcm:10.0.1'
   compile 'com.flurry.android:ads:6.4.2'
   compile 'com.inmobi.monetization:inmobi-ads:6.0.3'
   compile ‘com.facebook.android:audience-network-sdk:4.+'
```

* Other dependencies - Other

```
	compile 'com.github.hackware1993:MagicIndicator:1.4.0'
	compile 'com.google.firebase:firebase-core:10.0.1'
    compile 'com.flurry.android:analytics:6.4.2'
    compile 'com.google.firebase:firebase-messaging:10.0.1'
```