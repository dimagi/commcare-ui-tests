#!/bin/bash
wget "https://jenkins.dimagi.com/job/commcare-android/lastSuccessfulBuild/artifact/commcare-android/build/outputs/apk/commcare-android-commcare-release.apk" -O commcare.apk
calabash-android resign commcare.apk
