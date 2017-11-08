syntax match twitterUserProf "^User\sURL\shttps://twitter\.com/\w\+\n.*\s@\w\+\s\[\(x\|-\)]\s\(Unf\|F\)ollow\s|\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d|$" contains=twitterUserName,twitterUserWithoutName,twitterUserHead
syntax match twitterUserName ".\{-1,}" contained
syntax match twitterUserWithoutName "@\w\+\s\[\(x\|-\)]\s\(Unf\|F\)ollow\s|\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d|$" contained contains=twitterUserScreen,twitterUserVerified,twitterUserFollow,twitterUserDate
syntax match twitterUserScreen "@\w\+" contained
syntax match twitterUserVerified "\[\(x\|-\)]" contained
syntax match twitterUserFollow "\(Unf\|F\)ollow" contained
syntax match twitterUserDate "\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d" contained
syntax match twitterUserHead "^User\sURL\shttps://twitter\.com/\w\+$" contained contains=twitterUserHeadText,twitterUserHeadURL
syntax match twitterUserHeadText "User\sURL" contained
syntax match twitterUserHeadURL "https://twitter\.com/\w\+" contained
syntax match twitterUserStatus "^\(https\?://\(t\.co/[a-zA-Z0-9]\+\)\@![a-zA-Z0-9_/:%#$&?()~.=+-]\+\n\)*\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFollowings\s\s\s\s\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFollowers\n\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sTweets\s\s\s\s\s\s\s\s\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFavorites$" contains=twitterUserURL,twitterUserCount
syntax match twitterUserURL "^https\?://\(t\.co/[a-zA-Z0-9]\+\)\@![a-zA-Z0-9_/:%#$&?()~.=+-]\+$" contained
syntax match twitterUserCount "^\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFollowings\s\s\s\s\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFollowers\n\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sTweets\s\s\s\s\s\s\s\s\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFavorites$" contained

hi twitterUserName     cterm=bold       ctermfg=210  ctermbg=NONE
hi twitterUserScreen   cterm=NONE       ctermfg=202  ctermbg=NONE
hi twitterUserDate     cterm=NONE       ctermfg=003  ctermbg=NONE
hi twitterUserVerified cterm=NONE       ctermfg=208  ctermbg=NONE
hi twitterUserFollow   cterm=bold       ctermfg=045  ctermbg=NONE

hi link twitterUserURL       twitterTweetRawURL
hi link twitterUserCount     twitterTweetCount
hi link twitterUserHead      twitterTweetHead
hi link twitterUserHeadText  twitterTweetHeadText
hi link twitterUserHeadURL   twitterTweetHeadURL
