reset
set style data dots
set nokey

ymax = 15
ymin = -10
set yrange [ymin : ymax]

set xrange [0:  7.18596]
set arrow from  2.19068255,   ymin to  2.19068255,  ymax nohead
set arrow from  3.73972904,   ymin to  3.73972904,  ymax nohead
set arrow from  5.28877552,   ymin to  5.28877552,  ymax nohead
set xtics (" G "  0.00000," H "  2.19068," N "  3.73973," G "  5.28878," P "  7.18596)

set palette defined (-1 "blue", 0 "gray80", 1 "red")
eF = 17.4613

set pm3d map
set zrange [-1:1]

splot "iron-bands.dat" u 1:($2-eF):3 with dots palette

