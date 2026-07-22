reset

set terminal pdfcairo enhanced color size 3,2
set output "iron_time_Nk.pdf"

set logscale xy
set autoscale fix
set offsets graph 0.05, graph 0.05, graph 0.05, graph 0.05
set xtics (25, 50, 75, 100, 125, 150)
set ytics (50, 100, 200, 500, 1000, 2000)
set mxtics 5
set mytics 5

set xlabel "number of k-mesh N_k"
set ylabel "Calculation time / s"

set border lw 1
set key top left opaque samplen 2

# wpout_to_wptsv.py extracts: N_k, AHC_z (S/cm), execution time (s).
cpu8_data = "< python3 wpout_to_wptsv.py iron.wpout.cpu8"
cpu4_data = "< python3 wpout_to_wptsv.py iron.wpout.cpu4"

# Linear regression in log-log space using the four cpu8 points at N_k=75--150:
# log(time) = slope * log(N_k) + intercept.
log_time(x) = slope*x + intercept
slope = 3.0
intercept = -7.0
set fit nolog quiet
fit log_time(x) cpu8_data \
    u (($1 >= 75 && $1 <= 150) ? log($1) : 1/0):(log($3)) \
    via slope, intercept

cpu8_fit(x) = (x >= 75 && x <= 150) ? exp(intercept)*x**slope : 1/0
print sprintf("8 MPI processes, N_k=75--150: log-log slope = %.6f", slope)

# Fit all six cpu8 points at N_k=25--150 to time = a*N_k^3 + b.
cubic_time(x) = a*x**3 + b
a = 6.0e-4
b = 1.0
fit [25:150] cubic_time(x) cpu8_data u 1:3 via a, b
print "8 MPI processes, N_k=25--150: time = a*N_k^3 + b"
print sprintf("a = %.10e s, b = %.6f s", a, b)

plot cpu8_fit(x) w l lw 1.2 dt 2 lc rgb "red" \
         t sprintf("fit: slope=%.2f", slope), \
     cpu8_data u 1:3 w p pt 7 ps 0.65 lc rgb "red" t "8 MPI procs", \
     cpu4_data u 1:3 w p pt 5 ps 0.65 lc rgb "blue" t "4 MPI procs"

unset output
