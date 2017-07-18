#Automated Tests for CommCareODK
Automated UI level tests for [CommCareODK](https://github.com/dimagi/commcare-odk). The tests are written for the [Calabash](https://github.com/calabash/calabash-android) library which is implemented in Ruby. Calabash tests are written in the [Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin) language for the [Cucumber](https://cucumber.io/) framework.


###Setup:
+ `git submodule update --init`
+ Install python2.7 and python3
+ The commcare-odk.apk file you want to test - usually from the build server if you are not a mobile dev
+ The Android default keystore (obtained from a dev, or generated locally)
+ Calabash installed on your machine - [instructions here](https://github.com/calabash/calabash-android/blob/master/documentation/installation.md)
+ The Android SDK installed locally - [instructions here](http://developer.android.com/sdk/installing/index.html)
+ Install [AndroidViewClient](https://github.com/dtmilano/AndroidViewClient) `sudo easy_install androidviewclient`. This allows control over non-CommCare apps, such as the Camera app
+ A plugged in device accessible via ADB
+ `cp local.properties.yaml.template local.properties.yaml` and then get the passwords to fill in from another mobile dev

###Running

        $ calabash-android run commcare-odk.apk
        

##Resources

[Canned Steps](https://github.com/calabash/calabash-android/blob/master/ruby-gem/lib/calabash-android/canned_steps.md) - this is a set of steps that are already defined for us - for example we can just press "Then I press the button with text 'Start'" and that will work.
