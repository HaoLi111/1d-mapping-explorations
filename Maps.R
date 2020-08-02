#Maps to explore


## modified cos Map
cos_Map = function(x,lambda) 1 - lambda*(1 - cos(x/pi))

## modified semi-circular Map
cir_Map = function(x,lambda) {
  (1 - lambda * (1 - sqrt(1 - x^2)))
}


## Generalzed power map modified