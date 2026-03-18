#import "@preview/fletcher:0.5.8": diagram, edge, node

#let sample-curve(a, b, n, f, map) = range(n + 1).map(i => {
  let t = i / n
  let x = a + (b - a) * t
  map(x, f(x))
})

#diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 0.95pt,
  mark-scale: 110%,

  {
    let x0 = 38mm
    let y0 = 28mm
    let sx = 18mm
    let sy = 26mm

    // 数学坐标 -> 画布坐标
    let map = (m, f) => (x0 + m * sx, y0 + f * sy)

    // Landau 自由能
    let f-plus = m => 0.65 * m * m + m * m * m * m // T > Tc
    let f-zero = m => 0.55 * m * m * m * m // T = Tc
    let f-minus = m => -0.70 * m * m + m * m * m * m // T < Tc

    // 极小位置
    let phi0 = calc.sqrt(0.70 / 2.0)
    let fmin = f-minus(phi0)

    // 坐标轴
    edge(vertices: (map(-1.7, 0), map(1.85, 0)), marks: "->")
    edge(vertices: (map(0, -0.32), map(0, 2.8)), marks: "->")

    node((rel: (2mm, -2mm), to: map(1.85, 0)), [$phi$], stroke: none)

    // 三条曲线
    let pts-plus = sample-curve(-1.35, 1.35, 260, f-plus, map)
    let pts-zero = sample-curve(-1.35, 1.35, 260, f-zero, map)
    let pts-minus = sample-curve(-1.35, 1.35, 260, f-minus, map)

    edge(vertices: pts-plus, stroke: 1.05pt)
    edge(vertices: pts-zero, stroke: 1.05pt)
    edge(vertices: pts-minus, stroke: 1.05pt)

    // 极小点的虚线
    edge(
      vertices: (map(-phi0, 0), map(-phi0, fmin)),
      dash: "dashed",
      stroke: 0.55pt,
    )
    edge(
      vertices: (map(phi0, 0), map(phi0, fmin)),
      dash: "dashed",
      stroke: 0.55pt,
    )

    // ±phi0 标注
    node((rel: (-1mm, -4mm), to: map(-phi0, 0)), [$-phi_0$], stroke: none)
    node((rel: (-1mm, -4mm), to: map(phi0, 0)), [$phi_0$], stroke: none)

    // 文字说明
    node(map(0.25, 2.72), [一个极小 $m=0$], stroke: none)
    node(map(1.45, 0.35), [两个极小], stroke: none)

    // 右侧三条温度标签
    node(map(1.72, 2.15), [$T = T_c$], stroke: none)
    node(map(1.64, 1.50), [$T > T_c$], stroke: none)
    node(map(1.60, 0.98), [$T < T_c$], stroke: none)

    // 指示短线
    edge(vertices: (map(0.78, f-zero(0.78)), map(1.48, 1.98)), stroke: 0.6pt)
    edge(vertices: (map(0.86, f-plus(0.86)), map(1.38, 1.40)), stroke: 0.6pt)
    edge(vertices: (map(0.92, f-minus(0.92)), map(1.32, 0.90)), stroke: 0.6pt)
  },
)
