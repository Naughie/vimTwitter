#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import functions

count = sys.argv[1]
screen_name = sys.argv[2]
user = functions.get_user(screen_name)
functions.print_user(user)
timeline = functions.get_timeline(screen_name, count)
functions.print_timeline(timeline)
