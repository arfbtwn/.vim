" Vim syntax file
" Language:         SWIFT ISO15022
" Maintainer:       Nicholas J. Little
" Latest Revision:  23 Apr 2019

if exists("b:current_syntax")
  finish
endif

syn match swiftField ':\d\+\w:' contained nextgroup=swiftValue
syn match swiftValue '.\+'      contained

hi link swiftField Keyword

syn region swiftBlock matchgroup=blockLeader start='{\w\+:' end='}' contains=swiftBlock,swiftField

syn match b1appId         '\(\<\)\@<=.\{1\}'  contained nextgroup=b1svcId
syn match b1svcId   '\(\<.\{1\}\)\@<=.\{2\}'  contained nextgroup=b1bic
syn match b1bic     '\(\<.\{3\}\)\@<=.\{12\}' contained nextgroup=b1sessNo
syn match b1sessNo '\(\<.\{15\}\)\@<=.\{4\}'  contained nextgroup=b1seqNo
syn match b1seqNo  '\(\<.\{19\}\)\@<=.\{6\}'  contained

hi link b1appId  Comment
hi link b1svcId  Constant
hi link b1bic    Type
hi link b1sessNo Comment
hi link b1seqNo  Constant

syn cluster b1 contains=b1appId,b1svcId,b1bic,b1sessNo,b1seqNo

syn region block1 matchgroup=blockLeader start='{1:' end='}' contains=@b1

syn match b2dir           '\(\<\)\@<=.\{1\}'  contained nextgroup=b2mtype
syn match b2mtype   '\(\<.\{1\}\)\@<=.\{3\}'  contained nextgroup=b2itime
syn match b2itime   '\(\<.\{4\}\)\@<=.\{4\}'  contained nextgroup=b2idate
syn match b2idate   '\(\<.\{8\}\)\@<=.\{6\}'  contained nextgroup=b2bic
syn match b2bic    '\(\<.\{14\}\)\@<=.\{12\}' contained nextgroup=b2sessNo
syn match b2sessNo '\(\<.\{26\}\)\@<=.\{4\}'  contained nextgroup=b2seqNo
syn match b2seqNo  '\(\<.\{30\}\)\@<=.\{6\}'  contained nextgroup=b2odate
syn match b2odate  '\(\<.\{36\}\)\@<=.\{6\}'  contained nextgroup=b2otime
syn match b2otime  '\(\<.\{42\}\)\@<=.\{4\}'  contained nextgroup=b2prio
syn match b2prio   '\(\<.\{46\}\)\@<=.\{1\}'  contained

hi link b2dir    Comment
hi link b2mtype  Constant
hi link b2itime  Type
hi link b2idate  Comment
hi link b2bic    Constant
hi link b2sessNo Type
hi link b2seqNo  Comment
hi link b2odate  Constant
hi link b2otime  Type
hi link b2prio   Comment

syn cluster b2 contains=b2dir,b2mtype,b2itime,b2idate,b2bic,b2sessNo,b2seqNo,b2odate,b2otime,b2prio

syn region block2 matchgroup=blockLeader start='{2:' end='}' contains=@b2

"----------------------------------------------------------------------------/
"  Setup syntax highlighting
"----------------------------------------------------------------------------/

let b:current_syntax = "swift-iso15022"
