#!/bin/bash
wget "http://jenkins.dimagi.com/job/commcare-android/lastSuccessfulBuild/artifact/build/outputs/apk/commcare-android-commcare-release.apk" -O commcare.apk
calabash-android resign commcare.apk
