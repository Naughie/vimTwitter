#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import functions

count = sys.argv[1]
timeline = functions.get_timeline('', count)
functions.print_timeline(timeline)
