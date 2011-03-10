" Dust syntax
" Language:	Dust
" Maintainer:	Zoltan Kalmar <kalmiz@gmail.com>
" Screenshot:   
" Version:	1
" Last Change:  Marc 10th 2011
" Remark:       
"   It lexically hilights embedded dust (exclusively) in html file. 
"   While it was written for Ruby-based Mustache template system, it should
"   work for Google's C-based *ctemplate* as well as Erlang-based *et*. All
"   of them are, AFAIK, based on the idea of ctemplate.
"   Based on mustache.vim from Juvenn Woo <machese@gmail.com>
" References:	
"
"   [Dust](http://akdubya.github.com/dustjs/)
" TODO: Feedback is welcomed.


" Read the HTML syntax to start with
if version < 600
  so <sfile>:p:h/html.vim
else
  runtime! syntax/html.vim
  unlet b:current_syntax
endif

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Standard HiLink will not work with included syntax files
if version < 508
  command! -nargs=+ HtmlHiLink hi link <args>
else
  command! -nargs=+ HtmlHiLink hi def link <args>
endif

syntax match dustError '}}\?'
syntax match dustInsideError '{[{#<>=!\/]\?' containedin=@dustInside
syntax region dustVariable matchgroup=dustMarker start=/{/ end=/}/ containedin=@htmlDustContainer 
syntax region dustSection matchgroup=dustMarker start='{[#/]' end=/}/ containedin=@htmlDustContainer
syntax region dustInlinePartial matchgroup=dustMarker start=/{>/ end=/\/}/
syntax region dustPartial matchgroup=dustMarker start=/{[<]/ end=/}/
syntax region dustMarkerSet matchgroup=dustMarker start=/{?/ end=/}/
syntax region dustBlock matchgroup=dustMarker start=/{+/ end=/}/
syntax region dustComment start=/{!/ end=/}/ contains=Todo containedin=htmlHead


" Clustering
syntax cluster dustInside add=dustVariable,dustVariableUnescape,dustSection,dustPartial,dustMarkerSet
syntax cluster htmlDustContainer add=htmlHead,htmlTitle,htmlString,htmlH1,htmlH2,htmlH3,htmlH4,htmlH5,htmlH6


" Hilighting
" dustInside hilighted as Number, which is rarely used in html
" you might like change it to Function or Identifier
HtmlHiLink dustVariable Number
HtmlHiLink dustVariableUnescape Number
HtmlHiLink dustPartial Number
HtmlHiLink dustInlinePartial Number
HtmlHiLink dustSection Number
HtmlHiLink dustMarkerSet Number
HtmlHiLink dustBlock Number

HtmlHiLink dustComment Comment
HtmlHiLink dustMarker Identifier
HtmlHiLink dustError Error
HtmlHiLink dustInsideError Error

let b:current_syntax = "dust"
delcommand HtmlHiLink
