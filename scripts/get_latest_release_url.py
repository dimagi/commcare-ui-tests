#!/usr/bin/python3

"""
Gets url to the latest released apk of CommCare, as listed on
https://github.com/dimagi/commcare-android/releases
"""

import github3


def main():
    repo = github3.repository('dimagi', 'commcare-android')
    # Find first non-lts release
    for release in repo.releases():
        apk_assets = [a for a in release.assets() if is_release_apk(a.name)]
        if len(apk_assets) > 0:
            print(apk_assets[0].browser_download_url)
            return


def is_release_apk(name):
    return name.endswith("apk") and "lts" not in name


if __name__ == "__main__":
    main()
