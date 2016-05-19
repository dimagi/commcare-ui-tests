#!/bin/python2

"""
Take a photo for image capture callout and mark it okay.
"""

import sys
import os

try:
    view_path = os.environ['ANDROID_VIEW_CLIENT_HOME']
    sys.path.append(view_path)
    print(view_path)
except:
    pass

from com.dtmilano.android.viewclient import ViewClient

device, serialno = ViewClient.connectToDeviceOrExit()
vc = ViewClient(device, serialno, autodump=False)


def image_cature_marshmallow():
    vc.dump()
    vc.findViewWithContentDescriptionOrRaise(u'''Capture photo''').touch()
    vc.dump()
    vc.findViewWithContentDescriptionOrRaise(u'''Done''').touch()


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


def no_implementation():
    raise Exception("No image capture implementation for sdk " +
                    device.getSdkVersion())


image_capture_implementations = {
    23: image_cature_marshmallow,
    17: image_capture_jellybean,
}

capture = image_capture_implementations.get(device.getSdkVersion(),
                                            no_implementation)
capture()
