syntax match twitterTweetProf "^Tweet\sURL\shttps://twitter\.com/\w\+/status/\d\+\n\(>\s\)\@!.*\s@\w\+\s|\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d|\s\d\+\(\nRT\s.*\s@\w\+\s|\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d|\s\d\+\)\?$" contains=twitterTweetName,twitterTweetWithoutName,twitterTweetRT,twitterTweetHead
syntax match twitterTweetReply "^Reply\sto\s@\w\+\s\d\+$" contains=twitterTweetRState,twitterTweetScreen,twitterTweetID
syntax match twitterTweetName ".\{-1,}\s" contained
syntax match twitterTweetWithoutName "@\w\+\s|\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d|\s\d\+$" contained contains=twitterTweetPScreen,twitterTweetDate,twitterTweetID
syntax match twitterTweetPScreen "@\w\+" contained
syntax match twitterTweetScreen "@\w\+"
syntax match twitterTweetHead "^Tweet\sURL\shttps://twitter\.com/\w\+/status/\d\+$" contained contains=twitterTweetHeadText,twitterTweetHeadURL
syntax keyword twitterTweetHeadText "Tweet URL" contained
syntax match twitterTweetHeadURL "https://twitter.com/\w\+/status/\d\+" contained
syntax match twitterTweetRT "^RT\s" contained
syntax match twitterTweetID "\d\+$" contained
syntax match twitterTweetDate "\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d" contained
syntax match twitterTweetURL "https\?://[a-zA-Z0-9_/:%#$&?()~.=+-]\+"
syntax match twitterTweetBottom "^\(https\?://\(t\.co/[a-zA-Z0-9]\+\)\@![a-zA-Z0-9_/:%#$&?()~.=+-]\+\n\)*\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sRTs\s\s\s\s\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFAVs$" contains=twitterTweetCount,twitterTweetRawURL
syntax match twitterTweetCount "^\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sRTs\s\s\s\s\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFAVs$" contained
syntax match twitterTweetRawURL "https\?://\(t\.co/[a-zA-Z0-9]\+\)\@![a-zA-Z0-9_/:%#$&?()~.=+-]\+" contained
syntax match twitterTweetHashtag "[#＃][a-zA-Z0-9一-龠〃々ぁ-ゖ゛-ゞァ-ヺーヽヾ０-９Ａ-Ｚａ-ｚｦ-ﾟ]\+"
syntax match twitterTweetRState "^Reply\sto\s" contained
syntax match twitterTweetQStatus "^>\s.*$" contains=twitterTweetQMark,twitterTweetQProf,twitterTweetQBottom,twitterTweetQURL,twitterTweetQRTWith,twitterTweetQHashtag,twitterTweetQScreen,twitterTweetQReply
syntax match twitterTweetQProf "^>\s.*\s@\w\+\s|\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d|\s\d\+\(\n>\sRT\s.*\s@\w\+\s|\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d|\s\d\+\)\?$" contains=twitterTweetQMark,twitterTweetQName,twitterTweetQWithoutName,twitterTweetQRT
syntax match twitterTweetQReply "^>\sReply\sto\s@\w\+\s\d\+$" contained contains=twitterTweetQRState,twitterTweetQScreen,twitterTweetQID
syntax match twitterTweetQName "\(>\s\)\@!.\{-1,}\s" contained
syntax match twitterTweetQWithoutName "@\w\+\s|\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d|\s\d\+$" contained contains=twitterTweetQDate,twitterTweetQPScreen,twitterTweetQID
syntax match twitterTweetQPScreen "@\w\+" contained
syntax match twitterTweetQScreen "@\w\+" contained
syntax match twitterTweetQID "\d\+$" contained
syntax match twitterTweetQDate "\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d" contained
syntax match twitterTweetQURL "https\?://[a-zA-Z0-9_/:%#$&?()~.=+-]\+" contained
syntax match twitterTweetQMark "^>\s" contained
syntax match twitterTweetQBottom "^\(>\shttps\?://\(t\.co/[a-zA-Z0-9]\+\)\@![a-zA-Z0-9_/:%#$&?()~.=+-]\+\n\)*>\s\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sRTs\s\s\s\s\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFAVs$" contained contains=twitterTweetQRawURL,twitterTweetQCount,twitterTweetQMark
syntax match twitterTweetQCount "\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sRTs\s\s\s\s\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFAVs$" contained
syntax match twitterTweetQRawURL "https\?://\(t\.co/[a-zA-Z0-9]\+\)\@![a-zA-Z0-9_/:%#$&?()~.=+-]\+" contained
syntax match twitterTweetQRT ">\sRT\s"hs=s+2 contained contains=twitterTweetQMark
syntax match twitterTweetQHashtag "[#＃][a-zA-Z0-9一-龠〃々ぁ-ゖ゛-ゞァ-ヺーヽヾ０-９Ａ-Ｚａ-ｚｦ-ﾟ]\+" contained
syntax keyword twitterTweetQRState "Reply to" contained

syntax match twitterUserProf "^User\sURL\shttps://twitter\.com/\w\+\n.*\s@\w\+\s\[\(x\|-\)]\s\(Unf\|F\)ollow\s|\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d|$" contains=twitterUserName,twitterUserWithoutName,twitterUserHead
syntax match twitterUserName ".\{-1,}" contained
syntax match twitterUserWithoutName "@\w\+\s\[\(x\|-\)]\s\(Unf\|F\)ollow\s|\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d|$" contained contains=twitterUserScreen,twitterUserVerified,twitterUserFollow,twitterUserDate
syntax match twitterUserScreen "@\w\+" contained
syntax match twitterUserVerified "\[\(x\|-\)]" contained
syntax match twitterUserFollow "\(Unf\|F\)ollow" contained
syntax match twitterUserDate "\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d" contained
syntax match twitterUserHead "^User\sURL\shttps://twitter\.com/\w\+$" contained contains=twitterUserHeadText,twitterUserHeadURL
syntax keyword twitterUserHeadText "User URL" contained
syntax match twitterUserHeadURL "https://twitter\.com/\w\+" contained
syntax match twitterUserStatus "^\(https\?://\(t\.co/[a-zA-Z0-9]\+\)\@![a-zA-Z0-9_/:%#$&?()~.=+-]\+\n\)*\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFollowings\s\s\s\s\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFollowers\n\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sTweets\s\s\s\s\s\s\s\s\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFavorites$" contains=twitterUserURL,twitterUserCount
syntax match twitterUserURL "^https\?://\(t\.co/[a-zA-Z0-9]\+\)\@![a-zA-Z0-9_/:%#$&?()~.=+-]\+$" contained
syntax match twitterUserCount "^\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFollowings\s\s\s\s\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFollowers\n\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sTweets\s\s\s\s\s\s\s\s\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFavorites$" contained

hi twitterTweetName     ctermfg=210 cterm=bold
hi twitterTweetDate     ctermfg=3
hi twitterTweetPScreen  ctermfg=202
hi twitterTweetScreen   ctermfg=202 cterm=bold
hi twitterTweetCount    ctermfg=189 cterm=bold
hi twitterTweetURL      ctermfg=75
hi twitterTweetRawURL   ctermfg=142 cterm=bold
hi twitterTweetRT       ctermfg=197 cterm=bold
hi twitterTweetHashtag  ctermfg=87
hi twitterTweetQMark    ctermfg=158 cterm=bold
hi twitterTweetID       ctermfg=237
hi twitterTweetRState   ctermfg=197
hi twitterTweetHeadText ctermfg=7
hi twitterTweetHeadURL  ctermfg=75 cterm=underline
hi link twitterTweetQName twitterTweetName
hi link twitterTweetQDate twitterTweetDate
hi link twitterTweetQCount twitterTweetCount
hi link twitterTweetQURL twitterTweetURL
hi link twitterTweetQRawURL twitterTweetRawURL
hi link twitterTweetQRT twitterTweetRT
hi link twitterTweetQHashtag twitterTweetHashtag
hi link twitterTweetQScreen twitterTweetScreen
hi link twitterTweetQPScreen twitterTweetPScreen
hi link twitterTweetQID twitterTweetID
hi link twitterTweetQRState twitterTweetRState

hi twitterUserName     ctermfg=210 cterm=bold
hi twitterUserScreen   ctermfg=202
hi twitterUserDate     ctermfg=3
hi twitterUserVerified ctermfg=208
hi twitterUserFollow   ctermfg=45  cterm=bold
hi link twitterUserURL twitterTweetRawURL
hi link twitterUserCount twitterTweetCount
hi link twitterUserHeadText twitterTweetHeadText
hi link twitterUserHeadURL twitterTweetHeadURL
