" Vim syntax file
" Language:         SWIFT ISO15022
" Maintainer:       Nicholas J. Little
" Latest Revision:  23 Jul 2019

if exists("b:current_syntax")
  finish
endif

syn match swiftField ':\d\+\w:' contained nextgroup=swiftValue
syn match swiftValue '.\+'      contained

hi link swiftField Keyword

syn region swiftBlock matchgroup=blockLeader start='{\w\+:' end='}' contains=swiftBlock,swiftField

syn match b1appId         '\(\<\)\@<=\w\{1\}'  contained nextgroup=b1svcId
syn match b1svcId   '\(\<.\{1\}\)\@<=\d\{2\}'  contained nextgroup=b1bic
syn match b1bic     '\(\<.\{3\}\)\@<=\w\{12\}' contained nextgroup=b1sessNo
syn match b1sessNo '\(\<.\{15\}\)\@<=\d\{4\}'  contained nextgroup=b1seqNo
syn match b1seqNo  '\(\<.\{19\}\)\@<=\d\{6\}'  contained

hi link b1appId  Comment
hi link b1svcId  Constant
hi link b1bic    Type
hi link b1sessNo Comment
hi link b1seqNo  Constant

syn cluster b1 contains=b1appId,b1svcId,b1bic,b1sessNo,b1seqNo

syn region block1 matchgroup=blockLeader start='{1:' end='}' contains=@b1

syn match b2odir           '\(\<\)\@<=O'        contained nextgroup=b2omtype
syn match b2omtype   '\(\<.\{1\}\)\@<=\d\{3\}'  contained nextgroup=b2oitime
syn match b2oitime   '\(\<.\{4\}\)\@<=\d\{4\}'  contained nextgroup=b2oidate
syn match b2oidate   '\(\<.\{8\}\)\@<=\d\{6\}'  contained nextgroup=b2obic
syn match b2obic    '\(\<.\{14\}\)\@<=\w\{12\}' contained nextgroup=b2osessNo
syn match b2osessNo '\(\<.\{26\}\)\@<=\d\{4\}'  contained nextgroup=b2oseqNo
syn match b2oseqNo  '\(\<.\{30\}\)\@<=\d\{6\}'  contained nextgroup=b2oodate
syn match b2oodate  '\(\<.\{36\}\)\@<=\d\{6\}'  contained nextgroup=b2ootime
syn match b2ootime  '\(\<.\{42\}\)\@<=\d\{4\}'  contained nextgroup=b2oprio
syn match b2oprio   '\(\<.\{46\}\)\@<=\w\{1\}'  contained

hi link b2odir    Comment
hi link b2omtype  Constant
hi link b2oitime  Type
hi link b2oidate  Comment
hi link b2obic    Constant
hi link b2osessNo Type
hi link b2oseqNo  Comment
hi link b2oodate  Constant
hi link b2ootime  Type
hi link b2oprio   Comment

syn match b2idir           '\(\<\)\@<=I'        contained nextgroup=b2imtype
syn match b2imtype   '\(\<.\{1\}\)\@<=\d\{3\}'  contained nextgroup=b2ibic
syn match b2ibic     '\(\<.\{4\}\)\@<=\w\{12\}' contained nextgroup=b2iprio
syn match b2iprio   '\(\<.\{16\}\)\@<=\w\{1\}'  contained nextgroup=b2imon
syn match b2imon    '\(\<.\{17\}\)\@<=\d\{1\}'  contained nextgroup=b2iperiod
syn match b2iperiod '\(\<.\{18\}\)\@<=\d\{3\}'  contained

hi link b2idir    Comment
hi link b2imtype  Constant
hi link b2ibic    Type
hi link b2iprio   Comment
hi link b2imon    Constant
hi link b2iperiod Type

syn cluster b2i contains=b2idir,b2imtype,b2ibic,b2iprio,b2imon,b2iperiod
syn cluster b2o contains=b2odir,b2omtype,b2oitime,b2oidate,b2obic,b2osessNo,b2oseqNo,b2oodate,b2ootime,b2oprio

syn cluster b2 contains=@b2i,@b2o

syn region block2 matchgroup=blockLeader start='{2:' end='}' contains=@b2

"----------------------------------------------------------------------------/
"  Setup syntax highlighting
"----------------------------------------------------------------------------/

let b:current_syntax = "swift-iso15022"
