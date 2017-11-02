#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import json
import datetime
from requests_oauthlib import OAuth1Session

def conv_time(a):
    b = a.split(' ')
    c = b[3].split(':')
    if b[1] == 'Jan':
        d = 1
    elif b[1] == 'Feb':
        d = 2
    elif b[1] == 'Mar':
        d = 3
    elif b[1] == 'Apr':
        d = 4
    elif b[1] == 'May':
        d = 5
    elif b[1] == 'Jun':
        d = 6
    elif b[1] == 'Jul':
        d = 7
    elif b[1] == 'Aug':
        d = 8
    elif b[1] == 'Sep':
        d = 9
    elif b[1] == 'Oct':
        d = 10
    elif b[1] == 'Nov':
        d = 11
    elif b[1] == 'Dec':
        d = 12
    return (datetime.datetime(int(b[5]),d,int(b[2]),int(c[0]),int(c[1]),int(c[2])) + datetime.timedelta(hours = 9)).strftime('%Y/%m/%d %H:%M:%S')

def twitter_get_request(url, params):
    CK = os.environ['TWITTER_CONSUMER_KEY']
    CS = os.environ['TWITTER_CONSUMER_SECRET']
    AT = os.environ['TWITTER_ACCESS_TOKEN']
    AS = os.environ['TWITTER_ACCESS_SECRET']

    twitter = OAuth1Session(CK, CS, AT, AS)
    res = twitter.get(url, params = params)

    if res.status_code == 200:
        return json.loads(res.text)
    else:
        raise Exception('Error: {0}'.format(res.status_code))

def twitter_post_request(url, params):
    CK = os.environ['TWITTER_CONSUMER_KEY']
    CS = os.environ['TWITTER_CONSUMER_SECRET']
    AT = os.environ['TWITTER_ACCESS_TOKEN']
    AS = os.environ['TWITTER_ACCESS_SECRET']

    twitter = OAuth1Session(CK, CS, AT, AS)
    res = twitter.post(url, params = params)

    if res.status_code == 200:
        return json.loads(res.text)
    else:
        raise Exception('Error: {0}'.format(res.status_code))

def get_tweet(id):
    url = 'https://api.twitter.com/1.1/statuses/show.json'
    params = {'id': id}
    return twitter_get_request(url, params)

def get_timeline(screen_name, count):
    params = {'count': count}
    if screen_name:
        url = 'https://api.twitter.com/1.1/statuses/user_timeline.json'
        params['screen_name'] = screen_name
    else:
        url = 'https://api.twitter.com/1.1/statuses/home_timeline.json'
    return twitter_get_request(url, params)

def get_user(screen_name):
    url = 'https://api.twitter.com/1.1/users/show.json'
    params = {'screen_name': screen_name}
    return twitter_get_request(url, params)

def print_tweet(t):
    if not t['source'].count('instagram'):
        print('Tweet URL https://twitter.com/{0}/status/{1}'.format(t['user']['screen_name'], t['id_str']))
        print('{0} @{1} |{2}| {3}'.format(t['user']['name'], t['user']['screen_name'], conv_time(t['created_at']), t['id_str']))
        if t['in_reply_to_status_id_str']:
            print('Reply to @{0} {1}'.format(t['in_reply_to_screen_name'], t['in_reply_to_status_id_str']))
        if 'retweeted_status' in t:
            rt = t['retweeted_status']
            print('RT {0} @{1} |{2}| {3}'.format(rt['user']['name'], rt['user']['screen_name'], conv_time(rt['created_at']), rt['id_str']))
            if rt['in_reply_to_status_id_str']:
                print('Reply to @{0} {1}'.format(rt['id_str'], rt['in_reply_to_status_id_str']))
            print(rt['text'])
        else:
            print(t['text'])
        if 'quoted_status' in t:
            qt = t['quoted_status']
            print('> {0} @{1} |{2}| {3}'.format(qt['user']['name'], qt['user']['screen_name'], conv_time(qt['created_at']), qt['id_str']))
            if qt['in_reply_to_status_id_str']:
                print('> Reply to @{0} {1}'.format(qt['in_reply_to_screen_name'], qt['in_reply_to_status_id_str']))
            for l in qt['text'].split('\n'):
                print('> {0}'.format(l))
            if 'extended_entities' in qt:
                for m in qt['extended_entities']['media']:
                    if 'video_info' in m:
                        print('> {0}'.format(m['video_info']['variants'][0]['url']))
                    else:
                        print('> {0}'.format(m['media_url_https']))
            elif 'media' in qt['entities']:
                for m in qt['entities']['media']:
                    print('> {0}'.format(m['media_url_https']))
            elif qt['entities']['urls']:
                for u in qt['entities']['urls']:
                    print('> {0}'.format(u['expanded_url']))
            print('> {0:6d} RTs    {0:6d} FAVs'.format(qt['retweet_count'], qt['favorite_count']))
        if 'extended_entities' in t:
            for m in t['extended_entities']['media']:
                if 'video_info' in m:
                    print('{0}'.format(m['video_info']['variants'][0]['url']))
                else:
                    print('{0}'.format(m['media_url_https']))
        elif 'media' in t['entities']:
            for m in t['entities']['media']:
                print('{0}'.format(m['media_url_https']))
        elif t['entities']['urls']:
            for u in t['entities']['urls']:
                print('{0}'.format(u['expanded_url']))
        print('{0:6d} RTs    {0:6d} FAVs'.format(t['retweet_count'], t['favorite_count']))
        print('')

def print_timeline(tl):
    for t in tl:
        print_tweet(t)

def print_user(u):
    follow_or_unfollow = 'Unfollow' if u['following'] else 'Follow'
    verified_status = 'x' if u['verified'] else '-'
    print('User URL https://twitter.com/{0}'.format(u['screen_name']))
    print('{0} @{1} [{2}] {3} |{4}|'.format(u['name'], u['screen_name'], verified_status, follow_or_unfollow, conv_time(u['created_at'])))
    print(u['description'])
    if 'url' in u['entities']:
        for url in u['entities']['url']['urls']:
            print(url['expanded_url'])
    print('{0:6d} Followings    {1:6d} Followers'.format(u['friends_count'], u['followers_count']))
    print('{0:6d} Tweets        {0:6d} Favorites'.format(u['statuses_count'], u['favourites_count']))
    print('')
    print('')

def fav_or_unfav(t):
    id = t['id_str']
    params = {'id': id}
    if t['favorited']:
        url = 'https://api.twitter.com/1.1/favorites/destroy.json'
        res = twitter_post_request(url, params = params)
        print('Successfully unfavorited {0}'.format(id))
    else:
        url = 'https://api.twitter.com/1.1/favorites/create.json'
        res = twitter_post_request(url, params)
        print('Successfully favorited {0}'.format(id))

def ret_or_unret(t):
    id = t['id_str']
    if t['retweeted']:
        url = 'https://api.twitter.com/1.1/statuses/unretweet/{0}.json'.format(id)
        res = twitter_post_request(url, {})
        print('Successfully unretweeted {0}'.format(id))
    else:
        url = 'https://api.twitter.com/1.1/statuses/retweet/{0}.json'.format(id)
        res = twitter_post_request(url, {})
        print('Successfully retweeted {0}'.format(id))

def fol_or_unfol(u):
    screen_name = u['screen_name']
    if u['following']:
        url = 'https://api.twitter.com/1.1/friendships/destroy.json'
        res = twitter_post_request(url, {'screen_name': screen_name})
        print('Successfully Unfollowed {0}'.format(screen_name))
    else:
        url = 'https://api.twitter.com/1.1/friendships/create.json'
        res = twitter_post_request(url, {'screen_name': screen_name, 'follow': True})
        print('Successfully followed {0}'.format(screen_name))

def list_follows(screen_name):
    url = 'https://api.twitter.com/1.1/friends/list.json'
    cursor = '-1'
    params = {'screen_name': screen_name, 'count': 50}
    while cursor != '0':
        params['cursor'] = cursor
        res = twitter_get_request(url, params)
        cursor = res['next_cursor_str']
        for u in res['users']:
            print_user(u)
