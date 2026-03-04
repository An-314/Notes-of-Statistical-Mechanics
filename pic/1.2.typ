#import "@preview/fletcher:0.5.8": diagram, edge, node
#let thermo_panel(kind: "forward", prefix: "A") = diagram(
  spacing: (10mm, 10mm),
  node-stroke: 1pt,
  edge-stroke: 1pt,
  // nodes
  node((1, 0), $T$, shape: "rect", width: 26mm, height: 10mm, name: (prefix + "-T")),
  node((1, 1.2), $M$, shape: "circle", width: 14mm, height: 14mm, name: (prefix + "-M")),
  // arrows + labels
  // 左侧 w：只在正过程出现
  if kind == "forward" {
    edge((0.2, 1.2), (name: (prefix + "-M"), anchor: "west"), $w$, "->")
  },
  // 垂直 q：正过程 M->T；逆过程 T->M
  if kind == "forward" {
    edge((name: (prefix + "-M"), anchor: "north"), (name: (prefix + "-T"), anchor: "south"), $q$, "->")
  } else {
    edge((name: (prefix + "-T"), anchor: "south"), (name: (prefix + "-M"), anchor: "north"), $q$, "->")
  },
  // 右侧 q=w：两张图都有
  node((1.75, 0.45), [$q=w$], stroke: none, fill: none),
  // 右侧 w：只在逆过程出现（M -> 右）
  if kind == "reverse" {
    edge((name: (prefix + "-M"), anchor: "east"), (1.65, 1.2), $w$, "->")
  },
)
#grid(
  columns: (1fr, 1fr),
  align(center, thermo_panel(kind: "forward", prefix: "L")), align(center, thermo_panel(kind: "reverse", prefix: "R")),
)
#grid(
  columns: (1fr, 1fr),
  align(center)[① 正过程], align(center)[② 逆过程],
)
