function! MyOnBattery()
  return readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction

if MyOnBattery()
  call neomake#configure#automake('w',0)
else
  call neomake#configure#automake('nw', 0)
endif
