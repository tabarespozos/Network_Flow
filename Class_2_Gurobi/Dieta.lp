\ Model modelo dieta
\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  20 x1 + 10 x2 + 31 x3 + 11 x4 + 11 x5
Subject To
 Hierro: 2 x1 + 3 x3 + x4 + 2 x5 >= 21
 Calcio: x2 + 2 x3 + 2 x4 + x5 >= 12
Bounds
End
