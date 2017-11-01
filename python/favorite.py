#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import functions

id = sys.argv[1]
tweet = functions.get_tweet(id)
functions.fav_or_unfav(tweet)
