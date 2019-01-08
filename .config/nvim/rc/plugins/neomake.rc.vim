function! MyOnBattery()
	return readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction

if MyOnBattery()
	call neomake#configure#automake('w',0)
else
	call neomake#configure#automake('nw', 0)
endif
let g:neomake_javascript_enabled_makers = ['eslint']
let b:neomake_javascript_eslint_exe = "eslint_d"
