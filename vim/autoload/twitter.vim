let s:twitter_script_cmd = 'python'
let s:twitter_script_ext = 'py'
let s:twitter_script_path = g:twitter_script_path . '/' . s:twitter_script_cmd

let g:quickrun_config.twitter_timeline = {
  \ 'outputter/buffer/name' : 'twitter timeline',
  \ 'outputter/buffer/filetype' : 'twitter_timeline',
  \ 'outputter/buffer/into' : 1,
  \ 'command' : s:twitter_script_cmd,
  \ 'exec' : ['%c ' . s:twitter_script_path . '/timeline.' . s:twitter_script_ext . ' ' . g:twitter_timeline_count],
  \}

let g:quickrun_config.twitter_tweet = {
  \ 'outputter/buffer/name' : 'twitter tweet',
  \ 'outputter/buffer/filetype' : 'twitter_tweet',
  \ 'outputter/buffer/into' : 1,
  \ 'command' : s:twitter_script_cmd,
  \ 'exec' : ['%c ' . s:twitter_script_path . '/show_tweet.' . s:twitter_script_ext . ' %a'],
  \}

let g:quickrun_config.twitter_user = {
  \ 'outputter/buffer/name' : 'twitter user',
  \ 'outputter/buffer/filetype' : 'twitter_user',
  \ 'outputter/buffer/into' : 1,
  \ 'command' : s:twitter_script_cmd,
  \ 'exec' : ['%c ' . s:twitter_script_path . '/user.' . s:twitter_script_ext . ' ' . g:twitter_timeline_count . ' %a'],
  \}

let g:quickrun_config.twitter_fav = {
  \ 'outputter' : 'message',
  \ 'command' : s:twitter_script_cmd,
  \ 'exec' : ['%c ' . s:twitter_script_path . '/favorite.' . s:twitter_script_ext . ' %a'],
  \}

let g:quickrun_config.twitter_ret = {
  \ 'outputter' : 'message',
  \ 'command' : s:twitter_script_cmd,
  \ 'exec' : ['%c ' . s:twitter_script_path . '/retweet.' . s:twitter_script_ext . ' %a'],
  \}


function! twitter#unset_trailing_spaces() abort
  syntax match TrailingSpaces "\s\+$"
  hi TrailingSpaces ctermbg=None
endfunction

function! twitter#print_timeline() abort
  QuickRun -type twitter_timeline
  call twitter#unset_trailing_spaces()
endfunction

function! twitter#show_tweet(tweet_id) abort
  let @t = a:tweet_id
  QuickRun -type twitter_tweet -args @t
  call twitter#unset_trailing_spaces()
endfunction

function! twitter#show_user(user_id) abort
  let @u = a:user_id
  QuickRun -type twitter_user -args @u
  call twitter#unset_trailing_spaces()
endfunction

function! twitter#favorite(tweet_id) abort
  let @f = a:tweet_id
  QuickRun -type twitter_fav -args @f
endfunction

function! twitter#retweet(tweet_id) abort
  let @r = a:tweet_id
  QuickRun -type twitter_ret -args @r
endfunction

function! twitter#open_new() abort
  echo 'a'
endfunction

function! twitter#post() abort
  echo 'a'
endfunction
