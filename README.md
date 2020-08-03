# 1d-mapping-explorations
A project to utilize my previous R package (not documented yet) SeriesXplorer on 1d mappings. Detection of periodicity, chaotic behaviors and animated visualizations are the major tasks. The secondary task is to test the acceleration of JIT on these codes. Videos will be uploaded to my YouTube channel. following CC. This repo follows MIT licence.

## Inspired by
https://dsweb.siam.org/Software/1d-maps
1D Maps
By James Meiss
https://dsweb.siam.org/
The dynamical system web

However in this repo we will focus more on the visualization.
## Dependencies and links related
To fully benefit from R's ecosystem for our chao-crunching, you may install the following packages first.
A number of the graphs are made possible thanks to
ggplot2 https://github.com/tidyverse/ggplot2


It is very important for R users to know to work with this package (as it is almost always the most popular one).
H. Wickham. ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag New York, 2016.

RColorBrewer
ggthemes https://github.com/jrnold/ggthemes

The power-spectral calculation and plotting need
psd https://github.com/abarbour/psd

The package I had built to investigate series, calculate Cob-Web plot, and estimate Lyapunov-exponent, extract period is 
SeriesXplorer

## Index

Map3.R - containing the reporting function wrapped from many other packages
Tent_Map.R - to test with tent mapping, see wiki https://en.wikipedia.org/wiki/Tent_map and Wolfram Math World page  http://mathworld.wolfram.com/TentMap.html for more.
