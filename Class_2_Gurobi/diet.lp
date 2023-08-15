\ LP format - for model browsing. Use MPS format to capture full model detail.
Minimize
  20 consumed.1 + 10 consumed.2 + 31 consumed.3 + 11 consumed.4
   + 12 consumed.5
Subject To
 nutrient.iron: 2 consumed.1 + 3 consumed.3 + consumed.4 + 2 consumed.5
   >= 21
 nutrient.calcium: consumed.2 + 2 consumed.3 + 2 consumed.4 + consumed.5
   >= 12
Bounds
End
