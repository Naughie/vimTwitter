syntax match twitterTweetProf "^Tweet\sURL\shttps://twitter\.com/\w\+/status/\d\+\n\(>\s\)\@!.*\s@\w\+\s|\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d|\s\d\+\(\nRT\s.*\s@\w\+\s|\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d|\s\d\+\)\?$" contains=twitterTweetName,twitterTweetWithoutName,twitterTweetRT,twitterTweetHead
syntax match twitterTweetReply "^Reply\sto\s@\w\+\s\d\+$" contains=twitterTweetRState,twitterTweetScreen,twitterTweetID
syntax match twitterTweetName ".\{-1,}\s" contained
syntax match twitterTweetWithoutName "@\w\+\s|\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d|\s\d\+$" contained contains=twitterTweetPScreen,twitterTweetDate,twitterTweetID
syntax match twitterTweetPScreen "@\w\+" contained
syntax match twitterTweetScreen "@\w\+"
syntax match twitterTweetHead "^Tweet\sURL\shttps://twitter\.com/\w\+/status/\d\+$" contained contains=twitterTweetHeadText,twitterTweetHeadURL
syntax match twitterTweetHeadText "Tweet\sURL" contained
syntax match twitterTweetHeadURL "https://twitter.com/\w\+/status/\d\+" contained
syntax match twitterTweetRT "^RT\s" contained
syntax match twitterTweetID "\d\+$" contained
syntax match twitterTweetDate "\d\d\d\d/\d\d/\d\d\s\d\d:\d\d:\d\d" contained
syntax match twitterTweetURL "https\?://[a-zA-Z0-9_/:%#$&?()~.=+-]\+"
syntax match twitterTweetBottom "^\(https\?://\(t\.co/[a-zA-Z0-9]\+\)\@![a-zA-Z0-9_/:%#$&?()~.=+-]\+\n\)*\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sRTs\s\s\s\s\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFAVs$" contains=twitterTweetCount,twitterTweetRawURL
syntax match twitterTweetCount "^\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sRTs\s\s\s\s\(\d\{6}\|\s\d\{5}\|\s\s\d\{4}\|\s\{3}\d\{3}\|\s\{4}\d\d\|\s\{5}\d\)\sFAVs$" contained
syntax match twitterTweetRawURL "https\?://\(t\.co/[a-zA-Z0-9]\+\)\@![a-zA-Z0-9_/:%#$&?()~.=+-]\+" contained
syntax match twitterTweetHashtag "[#＃][a-zA-Z0-9一-龠〃々ぁ-ゖ゛-ゞァ-ヺーヽヾ０-９Ａ-Ｚａ-ｚｦ-ﾟ]\+"
syntax match twitterTweetRState "^Reply\sto" contained
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
syntax match twitterTweetQRState "^Reply\sto" contained

hi twitterTweetName     cterm=bold       ctermfg=210  ctermbg=NONE
hi twitterTweetDate     cterm=NONE       ctermfg=003  ctermbg=NONE
hi twitterTweetPScreen  cterm=NONE       ctermfg=202  ctermbg=NONE
hi twitterTweetScreen   cterm=bold       ctermfg=202  ctermbg=NONE
hi twitterTweetCount    cterm=bold       ctermfg=189  ctermbg=NONE
hi twitterTweetURL      cterm=NONE       ctermfg=075  ctermbg=NONE
hi twitterTweetRawURL   cterm=bold       ctermfg=142  ctermbg=NONE
hi twitterTweetRT       cterm=bold       ctermfg=197  ctermbg=NONE
hi twitterTweetHashtag  cterm=NONE       ctermfg=087  ctermbg=NONE
hi twitterTweetQMark    cterm=bold       ctermfg=158  ctermbg=NONE
hi twitterTweetID       cterm=NONE       ctermfg=237  ctermbg=NONE
hi twitterTweetRState   cterm=NONE       ctermfg=197  ctermbg=NONE
hi twitterTweetHead     cterm=NONE       ctermbg=240  ctermbg=240
hi twitterTweetHeadText cterm=NONE       ctermfg=007  ctermbg=240
hi twitterTweetHeadURL  cterm=NONE       ctermfg=153  ctermbg=240

hi link twitterTweetRState    twitterTweetRT
hi link twitterTweetQRState   twitterTweetRState
hi link twitterTweetQName     twitterTweetName
hi link twitterTweetQDate     twitterTweetDate
hi link twitterTweetQCount    twitterTweetCount
hi link twitterTweetQURL      twitterTweetURL
hi link twitterTweetQRawURL   twitterTweetRawURL
hi link twitterTweetQRT       twitterTweetRT
hi link twitterTweetQHashtag  twitterTweetHashtag
hi link twitterTweetQScreen   twitterTweetScreen
hi link twitterTweetQPScreen  twitterTweetPScreen
hi link twitterTweetQID       twitterTweetID
hi link twitterTweetQRState   twitterTweetRState
