#set page(height: auto, margin: 5pt)
#set align(center)
#import "@preview/fletcher:0.5.8": diagram, edge, node

#set text(size: 11pt)

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
    let sy = 18mm

    let map = (m, f) => (x0 + m * sx, y0 + f * sy)

    // 三条 Landau 自由能，都过原点
    let aplus = 0.85
    let azero = 0.65
    let aminus = 0.75
    let b = 0.85

    let f-plus = m => aplus * m * m + b * m * m * m * m
    let f-zero = m => azero * m * m * m * m
    let f-minus = m => -aminus * m * m + b * m * m * m * m

    // 双势阱极小位置
    let phi0 = calc.sqrt(aminus / (2 * b))
    let fmin = f-minus(phi0)

    // ----------------------------
    // 关键：统一截取高度，而不是平移曲线
    // ----------------------------
    let ytop = 3.2

    // 对 T > Tc:  b x^2 + aplus x - ytop = 0, 其中 x = m^2
    let x-plus = (-aplus + calc.sqrt(aplus * aplus + 4 * b * ytop)) / (2 * b)
    let m-plus = calc.sqrt(x-plus)

    // 对 T = Tc:  azero * m^4 = ytop
    let m-zero = calc.pow(ytop / azero, 1 / 4)

    // 对 T < Tc:  b x^2 - aminus x - ytop = 0
    let x-minus = (aminus + calc.sqrt(aminus * aminus + 4 * b * ytop)) / (2 * b)
    let m-minus = calc.sqrt(x-minus)

    // 坐标轴
    edge(vertices: (map(-1.95, 0), map(2.00, 0)), marks: "->")
    edge(vertices: (map(0, -0.2), map(0, 3.8)), marks: "->")

    node((rel: (2mm, -2mm), to: map(2.00, 0)), [$phi$], stroke: none)

    // 三条曲线：都只截到同样的 ytop
    let pts-plus = sample-curve(-m-plus, m-plus, 320, f-plus, map)
    let pts-zero = sample-curve(-m-zero, m-zero, 320, f-zero, map)
    let pts-minus = sample-curve(-m-minus, m-minus, 320, f-minus, map)

    edge(vertices: pts-plus, stroke: 1.0pt)
    edge(vertices: pts-zero, stroke: 1.0pt)
    edge(vertices: pts-minus, stroke: 1.0pt)

    // 极小位置虚线
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

    // ±phi0
    node((rel: (-1mm, -4mm), to: map(-phi0, 0)), [$-phi_0$], stroke: none)
    node((rel: (-1mm, -4mm), to: map(phi0, 0)), [$phi_0$], stroke: none)
    node(map(1.42, 1.55), [$T = T_c$], stroke: none)
    node(map(1.35, 0.85), [$T > T_c$], stroke: none)
    node(map(1.30, 0.18), [$T < T_c$], stroke: none)
  },
)
