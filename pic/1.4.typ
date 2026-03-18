#set page(height: auto, margin: 5pt)
#set align(center)
#import "@preview/fletcher:0.5.8": diagram, edge, node

#diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 1pt,
  mark-scale: 120%,
  {
    // ---------- 参数 ----------
    let gamma = 4
    let TH = 3.0
    let V1 = 1.2
    let V2 = 2.0
    let V3 = 3.0

    let p1 = TH / V1
    let p2 = TH / V2

    // 2->3 绝热：p V^gamma = const
    let K23 = p2 * calc.pow(V2, gamma)
    let p3 = K23 / calc.pow(V3, gamma)

    // 3->4 等温：TC = p3 V3
    let TC = p3 * V3

    // 4->1 绝热：p V^gamma = const = p1 V1^gamma
    let K41 = p1 * calc.pow(V1, gamma)
    // 解 V4：TC/V4 = K41/V4^gamma
    let V4 = calc.pow(K41 / TC, 1 / (gamma - 1))
    let p4 = TC / V4

    // ---------- 映射：物理(V,p) -> 页面(x,y) ----------
    let x0 = 12mm
    let y0 = 72mm
    let sx = 26mm
    let sy = 18mm
    let map = (V, p) => (x0 + V * sx, y0 + p * sy)

    // ---------- 坐标轴 ----------
    edge(vertices: (map(0, 0), map(3.8, 0)), marks: "->")
    edge(vertices: (map(0, 0), map(0, 3.6)), marks: "->")

    node((rel: (3mm, 2mm), to: map(3.8, 0)), [$V$], stroke: none)
    node((rel: (-4mm, -3mm), to: map(0, 3.6)), [$p$], stroke: none)

    // ---------- 采样曲线 ----------
    let N = 80

    let isotherm = (T, Va, Vb) => range(N + 1).map(i => {
      let t = i / N
      let V = Va + (Vb - Va) * t
      let p = T / V
      map(V, p)
    })

    let adiabat = (K, Va, Vb) => range(N + 1).map(i => {
      let t = i / N
      let V = Va + (Vb - Va) * t
      let p = K / calc.pow(V, gamma)
      map(V, p)
    })

    let P12 = isotherm(TH, V1, V2)
    let P23 = adiabat(K23, V2, V3)
    let P34 = isotherm(TC, V3, V4)
    let P41 = adiabat(K41, V4, V1)

    // ---------- Carnot 循环 ----------
    edge(vertices: P12, marks: "->")
    edge(vertices: P23, marks: "->")
    edge(vertices: P34, marks: "->")
    edge(vertices: P41, marks: "->")

    // ---------- 标注 ----------
    node((rel: (-4mm, -2mm), to: map(V1, p1)), [1], stroke: none)
    node((rel: (3mm, -2mm), to: map(V2, p2)), [2], stroke: none)
    node((rel: (3mm, 3mm), to: map(V3, p3)), [3], stroke: none)
    node((rel: (-4mm, 3mm), to: map(V4, p4)), [4], stroke: none)

    node((rel: (0mm, -7mm), to: map((V1 + V2) / 2, TH / ((V1 + V2) / 2))), [$T_H$], stroke: none)
    node((rel: (0mm, 7mm), to: map((V3 + V4) / 2, TC / ((V3 + V4) / 2))), [$T_C$], stroke: none)
  },
)
