reset

set terminal pdfcairo enhanced color size 4,2
set output "iron_kubo_A_xy_Nk.pdf"

set xrange [0:7]
set xtics 1
set mxtics 2

set yrange [-100:900]
set ytics 200
set mytics 2

set xlabel "Frequency ℏω / eV"
set ylabel "−Re {/Symbol s}_{xy} / {/Symbol W}^{-1} cm^{-1}"

set border lw 1
set key top right opaque samplen 2 spacing 0.9

# Columns: hbar*omega (eV), Re sigma^A_xy (S/cm), Im sigma^A_xy (S/cm).
# The colors are red mixed with progressively less white as N_k increases.
# plot "iron-kubo_Nk25/iron-kubo_A_xy.dat"  u 1:(-$2) w l lw 1.2 lc rgb "#F6CECE" t "N_k = 25", \
#      "iron-kubo_Nk50/iron-kubo_A_xy.dat"  u 1:(-$2) w l lw 1.2 lc rgb "#F09D9E" t "N_k = 50", \
#      "iron-kubo_Nk75/iron-kubo_A_xy.dat"  u 1:(-$2) w l lw 1.2 lc rgb "#EA5C5D" t "N_k = 75", \
#      "iron-kubo_Nk100/iron-kubo_A_xy.dat" u 1:(-$2) w l lw 1.5 lc rgb "#E41A1C" t "N_k = 100"

plot "iron-kubo_Nk50/iron-kubo_A_xy.dat"  u 1:(-$2) w l lw 1.2 lc rgb "#F6CECE" t "N_k = 50", \
     "iron-kubo_Nk100/iron-kubo_A_xy.dat"  u 1:(-$2) w l lw 1.2 lc rgb "#F09D9E" t "N_k = 100", \
     "iron-kubo_Nk150/iron-kubo_A_xy.dat"  u 1:(-$2) w l lw 1.2 lc rgb "#EA5C5D" t "N_k = 150", \
     "iron-kubo_Nk200/iron-kubo_A_xy.dat" u 1:(-$2) w l lw 1.5 lc rgb "#E41A1C" t "N_k = 200"

unset output
