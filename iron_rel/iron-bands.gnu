set arrow from       2.19068255,      8.16108124 to       2.19068255,     53.52894729 nohead
set arrow from       3.73972904,      8.16108124 to       3.73972904,     53.52894729 nohead
set arrow from       5.28877552,      8.16108124 to       5.28877552,     53.52894729 nohead
unset key
set xrange [0:  7.18596]
set yrange [      8.16108124 :     53.52894729]
set xtics (" G "  0.00000," H "  2.19068," N "  3.73973," G "  5.28878," P "  7.18596)
 set palette defined (-1 "blue", 0 "green", 1 "red")
 set pm3d map
 set zrange [-1:1]
 splot "iron-bands.dat" with dots palette
