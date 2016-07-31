
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;; 参考 Japanese Emoji - Ich brauche Hilfe - AutoHotkey Community
;;https://autohotkey.com/board/topic/113625-japanese-emoji/
^!k::
if (A_TimeSincePriorHotkey>3000 or A_TimeSincePriorHotkey=-1)
   länge=0
;;Emoji := ["( ͡° ͜ʖ ͡°):smile:",  "(๑￣ ̫ ￣๑):haha:", "¯\_(ツ)_/¯:shrug:", "(╯°□°）╯︵ ┻━┻:flip:","◔_◔:whatever:", "щ(ºДºщ)", ":ok:ᕕ( ᐛ )ᕗ:why:"]
Emoji := ["( ͡° ͜ʖ ͡°)",  "(๑￣ ̫ ￣๑)", "¯\_(ツ)_/¯", "(╯°□°）╯︵ ┻━┻","◔_◔", "щ(ºДºщ)", "ᕕ( ᐛ )ᕗ"]

EmojiIndex++

loop %länge%
   send,{BS}
if (EmojiIndex > Emoji.MaxIndex())
  EmojiIndex := 1

EmojiInIndex:=Emoji[EmojiIndex]
Send, %EmojiInIndex%
StringLen,länge,EmojiInIndex
return

;$ESC::
;  länge=0
;
;  ;;参考了: Escape key script help - Ask for Help - AutoHotkey Community
;  ;;https://autohotkey.com/board/topic/126632-escape-key-script-help/
;  If WinActive( "Dolphin 4.0.2" )
;    SendInput, s{F4}
;  else
;    SendInput, {Escape}
;return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

