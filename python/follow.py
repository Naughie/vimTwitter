#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import functions

screen_name = sys.argv[1]
user = functions.get_user(screen_name)
functions.fol_or_unfol(user)
