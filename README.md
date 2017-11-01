# About
Implementation of Twitter for Vim.
These files are composed of mainly two parts; Python to call API, and Vim to highlight response.

# Usage

First of all, put `.vim` files in `autoload` and `syntax` into the right directories. Then, set `g:twitter_script_path` to a directory where this repository is cloned (e.g., when the directories are such that
```
~/.config ----- twitter --+--- vim -----+--- autoload --- ...
                          |             |
                          |             +--- syntax ----- ...
                          |
                          +--- python --+--- ...
```
then `~/.config/twitter`).

The following lines are example configurations:
```
let g:twitter_script_path = '~/.config/twitter'
nnoremap <leader>tt :call twitter#print_timeline()<CR>
nnoremap <leader>ts "syiw:call twitter#show_tweet(@s)<CR>
nnoremap <leader>tu "syiw:call twitter#show_user(@s)<CR>
nnoremap <leader>tf "syiw:call twitter#favorite(@s)<CR>
nnoremap <leader>tr "syiw:call twitter#retweet(@s)<CR>
```

Next, set environment variables `TWITTER_CONSUMER_KEY`, `TWITTER_CONSUMER_SECRET`, `TWITTER_ACCESS_TOKEN` and `TWITTER_ACCESS_SECRET` to your own values.

Now, you can already use Twitter.

First, press `<leader>tt` to show your timeline (with 30 tweets by default).

Each tweet is displayed as (time zone is Japan):
```
Name @screen_name |yyyy/mm/dd HH:MM:SS| tweet_id
Texts.
attached urls (one par line)
%6d RTs    %6d FAVs
```

Press `<leader>tf` at the `tweet_id` to like or unlike the tweet (whether 'like' or 'unlike' is determined automatically).
Press `<leader>tr` at the `tweet_id` to retweet or unretweet the tweet.
Press `<leader>ts` at the `tweet_id` to show the tweet.
Press `<leader>tu` at the `screen_name` to show the detail of the user and his/her timeline. User information is displayed as:
```
Name @screen_name [x] Follow |yyyy/mm/dd HH:MM:SS|
Description.
attached urls (one par line)
%6d Followings    %6d Followers
%6d Tweets        %6d Favorites
```

`[x]` if the user is verified; `[-]` if not verified. `Follow` if you **do not** follow the user; `Unfollow` if you **already** follow.
