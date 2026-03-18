#set page(height: auto, margin: 5pt)
#import "@preview/fletcher:0.5.8": diagram, edge, node
#diagram(
  spacing: (10mm, 10mm),
  node-stroke: 1.2pt,
  edge-stroke: 1.2pt,
  // 顶部文字：T1: 高温
  node((0, -0.55), [$T_1: "高温"$], stroke: none, fill: none),
  // 上方热源框 T1
  node((0, 0), $T_1$, shape: "rect", width: 42mm, height: 10mm, name: "hot"),
  // 热机圆 M
  node((0, 1), $M$, shape: "circle", width: 10mm, height: 10mm, name: "M"),
  // 下方热源框 T2
  node((0, 2), $T_2$, shape: "rect", width: 42mm, height: 10mm, name: "cold"),
  // 底部文字：T2: 低温
  node((0, 3), [$T_2: "低温"$], stroke: none, fill: none),
  // q1：T1 -> M
  edge((name: "hot", anchor: "south"), (name: "M", anchor: "north"), $q_1$, "->"),
  // q2：M -> T2
  edge((name: "M", anchor: "south"), (name: "cold", anchor: "north"), $q_2$, "->"),
  // w：M -> 右
  edge((name: "M", anchor: "east"), (1, 1), $w$, "->"),
  // 右侧公式
  node((1.85, 1), [$w = q_1 - q_2$], stroke: none, fill: none),
)
