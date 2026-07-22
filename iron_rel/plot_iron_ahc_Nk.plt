reset

set terminal pdfcairo enhanced color size 3.5,2
set output "iron_ahc_Nk.pdf"

set xrange [0:155]
set xtics 25
set mxtics 5

set yrange [450:1100]
set ytics 200
set mytics 2

set xlabel "number of k-mesh N_k"
set ylabel "AHC |{/Symbol s}_{xy}| / {/Symbol W}^{-1} cm^{-1}"

set border lw 1
set key top left opaque samplen 2 spacing 0.9

# wpout_to_wptsv.py extracts: N_k, AHC_z (S/cm), execution time (s).
cpu8_data = "< python3 wpout_to_wptsv.py iron.wpout.cpu8"

plot 1032.0 w l lw 1.2 dt 1 lc rgb "black" t "Experiment", \
      750.8 w l lw 1.2 dt 2 lc rgb "black" t "Theory", \
      cpu8_data u 1:(-$2) w p pt 7 ps 0.65 lc rgb "red" t "Calculation"

unset output
