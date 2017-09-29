#!/usr/bin/python2

"""
Take a photo for image capture callout and mark it okay.
"""

import sys
import os
import time

try:
    view_path = os.environ['ANDROID_VIEW_CLIENT_HOME']
    sys.path.append(view_path)
    print(view_path)
except:
    pass

from com.dtmilano.android.viewclient import ViewClient

device, serialno = ViewClient.connectToDeviceOrExit()
vc = ViewClient(device, serialno, autodump=False)


def image_capture_marshmallow():
    try :
        vc.dump()
        vc.findViewWithContentDescriptionOrRaise(u'''Capture photo''').touch()
        vc.dump()
    except:
        vc.dump()
        vc.findViewWithContentDescriptionOrRaise(u'''Shutter''').touch()
        vc.dump()
    try:
        vc.findViewWithContentDescriptionOrRaise(u'''Done''').touch()
    except:
        # try one more time, sometimes it takes a while due to focus issues
        time.sleep(2)
        vc.dump()
        vc.findViewWithContentDescriptionOrRaise(u'''Done''').touch()


def image_capture_kitkat_tablet():
    device.press('KEYCODE_VOLUME_DOWN')
    vc.dump()
    vc.findViewWithTextOrRaise(u'Save').touch()


def image_capture_jellybean():
    vc.dump()
    vc.findViewWithContentDescriptionOrRaise(u'''Shutter button''').touch()
    vc.dump()
    press_dims = get_bottom_right_dims()
    device.touch(press_dims['x'], press_dims['y'], 0)


def get_bottom_right_dims():
    """
    Find location of bottom right 'okay' button regardless of screen dimension
    """
    ratio = 0.88
    display_info = device.getDisplayInfo()
    return {'x': display_info['width'] * ratio,
            'y': display_info['height'] * ratio}

def fallback():
    try: 
        image_capture_marshmallow()
    except:
        no_implementation()

def no_implementation():
    raise Exception("No image capture implementation for sdk " +
                    device.getSdkVersion())


image_capture_implementations = {
    24: image_capture_marshmallow,
    23: image_capture_marshmallow,
    19: image_capture_kitkat_tablet,
    17: image_capture_jellybean,
}

capture = image_capture_implementations.get(device.getSdkVersion(),
                                            fallback)
capture()
