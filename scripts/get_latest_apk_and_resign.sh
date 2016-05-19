#!/bin/bash
wget "http://jenkins.dimagi.com/job/commcare-odk/lastSuccessfulBuild/artifact/build/outputs/apk/commcare-odk-commcare-release.apk" -O commcare.apk
calabash-android resign commcare.apk
