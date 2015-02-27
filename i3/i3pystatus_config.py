#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status

black       = "#2c2836"
darkblack   = "#73707e"
red         = "#bb7473"
darkred     = "#cf9fa4"
green       = "#68b782"
darkgreen   = "#9acbad"
yellow      = "#abb773"
darkyellow  = "#c5cba4"
blue        = "#7865c5"
darkblue    = "#a396d9"
magenta     = "#bb65b6"
darkmagenta = "#cf96cf"
cyan        = "#68a8c5"
darkcyan    = "#9ac1d9"
white       = "#f1edfb"
darkwhite   = "#f1edfb"
background  = "#133B47"

status = Status(standalone=True)

status.register("clock",
    format="%a %-d %b %X",)

status.register("pulseaudio",
    format=" {volume}%",
    color_muted=red,
    color_unmuted=white,)

status.register("weather",
    location_code="AUXX0561:1:AU",
    format=" {current_temp}",)

status.run()
