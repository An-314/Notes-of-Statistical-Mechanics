#set page(height: auto, margin: 5pt)
#import "@preview/fletcher:0.5.8": diagram, edge, node

#diagram(
  spacing: (0.5cm, 0.5cm),

  node((0, 0), [$U(S,V,N)$], name: <U>),
  node((-2, 2), [$F(T,V,N)$], name: <F>),
  node((2, 2), [$H(S,p,N)$], name: <H>),
  node((0, 4), [$G(T,p,N)$], name: <G>),
  node((0, 6), [$J(T,V,mu)$], name: <J>),

  edge(<U>, <F>, [$-T S$], "-|>"),
  edge(<U>, <H>, [$+p V$], "-|>"),
  edge(<F>, <G>, [$+p V$], "-|>"),
  edge(<H>, <G>, [$-T S$], "-|>"),
  edge(<G>, <J>, [$-mu N$], "-|>"),
)
