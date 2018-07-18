#SingleInstance force
setCapslockState,alwaysOff

capslock & escape::
	reload,1000
	msgBox,reload
	return

+!#^capslock up::
	sendInput,+!#^{escape}
	return

+!#capslock up::
	sendInput,+!#{escape}
	return

+!^capslock up::
	sendInput,+!^{escape}
	return

+!capslock up::
	sendInput,control pressed!
	return

+#^capslock up::
	sendInput,+#^{escape}
	return

+#capslock up::
	sendInput,+#{escape}
	return

+^capslock up::
	sendInput,+^{escape}
	return

+capslock up::
	sendInput,+{escape}
	return

!#^capslock up::
	sendInput,!#^{escape}
	return

!#capslock up::
	sendInput,!#{escape}
	return

!^capslock up::
	sendInput,!^{escape}
	return

!capslock up::
	sendInput,!{escape}
	return

#^capslock up::
	sendInput,#^{escape}
	return

#capslock up::
	sendInput,#{escape}
	return

^capslock up::
	sendInput,^{escape}
	return

capslock up::
	sendInput,{escape}
	return

capslock & j::
	sendInput,{blind}{down}
	return

capslock & k::
	sendInput,{blind}{up}
	return

capslock & h::
	sendInput,{blind}{left}
	return

capslock & l::
	sendInput,{blind}{right}
	return

capslock & o::
	sendInput,{blind}{end}{enter}
	return

capslock & p::
	sendInput,{blind}{backspace}
	return

capslock & u::
	sendInput,{blind}{pgUp}
	return

capslock & d::
	sendInput,{blind}{pgDn}
	return

capslock & m::
	sendInput,{blind}{enter}
	return

+!#^SC028 up::
	sendInput,+!#^{SC028}
	return

+!#SC028 up::
	sendInput,+!#{SC028}
	return

+!^SC028 up::
	sendInput,+!^{SC028}
	return

+!SC028 up::
	sendInput,control pressed!
	return

+#^SC028 up::
	sendInput,+#^{SC028}
	return

+#SC028 up::
	sendInput,+#{SC028}
	return

+^SC028 up::
	sendInput,+^{SC028}
	return

+SC028 up::
	sendInput,+{SC028}
	return

!#^SC028 up::
	sendInput,!#^{SC028}
	return

!#SC028 up::
	sendInput,!#{SC028}
	return

!^SC028 up::
	sendInput,!^{SC028}
	return

!SC028 up::
	sendInput,!{SC028}
	return

#^SC028 up::
	sendInput,#^{SC028}
	return

#SC028 up::
	sendInput,#{SC028}
	return

^SC028 up::
	sendInput,^{SC028}
	return

SC028 up::
	sendInput,{escape}
	return

SC028 & j::
	sendInput,{blind}{down}
	return

SC028 & k::
	sendInput,{blind}{up}
	return

SC028 & h::
	sendInput,{blind}{left}
	return

SC028 & l::
	sendInput,{blind}{right}
	return

SC028 & o::
	sendInput,{blind}{end}{enter}
	return

SC028 & p::
	sendInput,{blind}{backspace}
	return

SC028 & u::
	sendInput,{blind}{pgUp}
	return

SC028 & d::
	sendInput,{blind}{pgDn}
	return

SC028 & m::
	sendInput,{blind}{enter}
	return

+!#^tab up::
	sendInput,+!#^{tab}
	return

+!#tab up::
	sendInput,+!#{tab}
	return

+!^tab up::
	sendInput,+!^{tab}
	return

+!tab up::
	sendInput,+!{tab}
	return

+#^tab up::
	sendInput,+#^{tab}
	return

+#tab up::
	sendInput,+#{tab}
	return

+^tab up::
	sendInput,+^{tab}
	return

+tab up::
	sendInput,+{tab}
	return

!#^tab up::
	sendInput,!#^{tab}
	return

!#tab up::
	sendInput,!#{tab}
	return

!^tab up::
	sendInput,!^{tab}
	return

!tab up::
	sendInput,{alt down}{tab}
	return

#^tab up::
	sendInput,#^{tab}
	return

#tab up::
	sendInput,#{tab}
	return

^tab up::
	sendInput,^{tab}
	return

tab up::
	sendInput,{tab}
	return

tab & j::
	sendInput,{blind}+{down}
	return

tab & k::
	sendInput,{blind}+{up}
	return

tab & h::
	sendInput,{blind}+{left}
	return

tab & l::
	sendInput,{blind}+{right}
	return

