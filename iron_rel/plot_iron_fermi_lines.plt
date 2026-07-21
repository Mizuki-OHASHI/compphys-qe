reset
unset surface
set contour
set view map
set cntrparam levels discrete  12.61410
set cntrparam bspline

set table 'bnd_001.dat'
splot 'iron-bnd_001.dat'
unset table
set table 'bnd_002.dat'
splot 'iron-bnd_002.dat'
unset table
set table 'bnd_003.dat'
splot 'iron-bnd_003.dat'
unset table
set table 'bnd_004.dat'
splot 'iron-bnd_004.dat'
unset table
set table 'bnd_005.dat'
splot 'iron-bnd_005.dat'
unset table
set table 'bnd_006.dat'
splot 'iron-bnd_006.dat'
unset table
set table 'bnd_007.dat'
splot 'iron-bnd_007.dat'
unset table
set table 'bnd_008.dat'
splot 'iron-bnd_008.dat'
unset table
set table 'bnd_009.dat'
splot 'iron-bnd_009.dat'
unset table
set table 'bnd_010.dat'
splot 'iron-bnd_010.dat'
unset table
set table 'bnd_011.dat'
splot 'iron-bnd_011.dat'
unset table
set table 'bnd_012.dat'
splot 'iron-bnd_012.dat'
unset table


#Uncomment next two lines to create postscript
#set term post eps enh
#set output 'iron_up-kslice-fermi_lines.eps'
set size ratio -1
unset tics
unset key
#For postscript try changing lw 1 --> lw 2 in the next line
set style line 1 lt 1 lw 1
plot 'bnd_up_003.dat' using 1:2 w lines ls 1 lc 7,\
     'bnd_up_004.dat' using 1:2 w lines ls 1 lc 7,\
     'bnd_up_005.dat' using 1:2 w lines ls 1 lc 7,\
     'bnd_up_006.dat' using 1:2 w lines ls 1 lc 7,\
     'bnd_dn_002.dat' using 1:2 w lines ls 1 lc 6,\
     'bnd_dn_003.dat' using 1:2 w lines ls 1 lc 6,\
     'bnd_dn_004.dat' using 1:2 w lines ls 1 lc 6
