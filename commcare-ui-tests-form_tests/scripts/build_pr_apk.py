#!/usr/bin/python3

import os
from shutil import copyfile
import subprocess
import sys
from checkout_cross_request_repo import checkout_pr_branch

APK_FILE = "build/outputs/apk/commcare-android-commcare-debug.apk"
ODK_DIR = "commcare-android"


def run(running_dir, pr_number):
    parent_dir = os.path.abspath("../")
    checkout_pr_branch(parent_dir, pr_number,
                       "commcare-android", "commcare-core")
    os.chdir(os.path.join(parent_dir, ODK_DIR))
    os.remove(APK_FILE)
    subprocess.call(["gradle", "assembleCommcareDebug"])
    if os.path.exists(APK_FILE):
        apk_name = os.path.join(running_dir, "commcare.apk")
        copyfile(APK_FILE, apk_name)
    else:
        raise Exception("build failed")


def main():
    if len(sys.argv) < 2:
        print("Command arg format: [ODK PR number]")
        sys.exit()

    # assumes that this script is run from commcare-ui-tests base dir and
    # android/core dirs are all share the same parent dir, one level up
    pr_number = sys.argv[1]
    run(os.getcwd(), pr_number)

if __name__ == "__main__":
    main()
