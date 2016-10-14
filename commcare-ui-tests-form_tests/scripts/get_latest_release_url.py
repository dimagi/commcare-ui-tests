#!/usr/bin/python3

"""
Gets url to the latest released apk of CommCare, as listed on
https://github.com/dimagi/commcare-android/releases
"""

import github3


def main():
    repo = github3.repository('dimagi', 'commcare-android')
    latest_release = repo.latest_release()
    apk_assets = [a for a in latest_release.assets() if is_release_apk(a.name)]
    print(apk_assets[0].browser_download_url)


def is_release_apk(name):
    return name.endswith("apk") and "lts" not in name


if __name__ == "__main__":
    main()
