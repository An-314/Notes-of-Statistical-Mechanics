#set page(width: auto, height: auto, margin: 0pt)
#import "@preview/fletcher:0.5.8": diagram, edge, node

#set text(size: 11pt)

#let quad(x, x1, y1, x2, y2, x3, y3) = (
  y1 * (x - x2) * (x - x3) / ((x1 - x2) * (x1 - x3))
    + y2 * (x - x1) * (x - x3) / ((x2 - x1) * (x2 - x3))
    + y3 * (x - x1) * (x - x2) / ((x3 - x1) * (x3 - x2))
)

#let line(x, x1, y1, x2, y2) = y1 + (y2 - y1) * (x - x1) / (x2 - x1)

#let sample-curve(pa, pb, n, f, map) = range(n + 1).map(i => {
  let t = i / n
  let p = pa + (pb - pa) * t
  map(p, f(p))
})

#diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 0.9pt,
  mark-scale: 110%,

  {
    let x0 = 8mm
    let y0 = 7mm
    let sx = 22mm
    let sy = 18mm
    let xmax = 5.0
    let ymax = 3.2

    let map = (p, mu) => (x0 + p * sx, y0 + mu * sy)

    // 坐标轴
    edge(vertices: (map(0, 0), map(xmax, 0)), marks: "->")
    edge(vertices: (map(0, 0), map(0, ymax)), marks: "->")

    node((rel: (2mm, -1mm), to: map(xmax, 0)), [$p$], stroke: none)
    node((rel: (-4mm, 1mm), to: map(0, ymax)), [$mu$], stroke: none)

    // 三个压强
    let p1 = 0.75
    let pA = 1.75
    let p2 = 2.85

    // 关键点
    let O_p = 0.18
    let O_mu = 0.55

    let K_mu = 1.10
    let J_mu = 1.82

    let N_mu = 2.80

    let B_mu = 1.93

    let R_p = 4.25
    let R_mu = 2.13

    // -------------------------
    // 1) OKAN：一条单一二次曲线（凹凸性一致）
    //    通过 O, K, N，A 取这条曲线在 pA 处的点
    // -------------------------
    let lower = p => quad(p, O_p, O_mu, p1, K_mu, p2, N_mu)
    let A_mu = lower(pA)

    let lower-pts = sample-curve(O_p, p2, 240, lower, map)
    edge(vertices: lower-pts)

    // -------------------------
    // 2) JN：线段
    // -------------------------
    let jn = p => line(p, p1, J_mu, p2, N_mu)
    edge(vertices: (map(p1, J_mu), map(p2, N_mu)))

    // -------------------------
    // 3) JBMR：一条连续曲线
    //    通过 J, B, R，M 是这条曲线在 p2 处的点
    // -------------------------
    let upper = p => quad(p, p1, J_mu, pA, B_mu, R_p, R_mu)
    let M_mu = upper(p2)

    let upper-pts = sample-curve(p1, R_p, 240, upper, map)
    edge(vertices: upper-pts)

    // 箭头
    // edge(vertices: (map(1.00, lower(1.00)), map(1.22, lower(1.22))), marks: "->")
    // edge(vertices: (map(1.55, jn(1.55)), map(1.82, jn(1.82))), marks: "->")
    // edge(vertices: (map(1.55, upper(1.55)), map(1.88, upper(1.88))), marks: "->")

    // 竖虚线
    edge(vertices: (map(p1, 0), map(p1, J_mu)), dash: "dashed", stroke: 0.5pt)
    edge(vertices: (map(pA, 0), map(pA, B_mu)), dash: "dashed", stroke: 0.5pt)
    edge(vertices: (map(p2, 0), map(p2, N_mu)), dash: "dashed", stroke: 0.5pt)

    // p1 pA p2 标签
    node((rel: (-1mm, -3mm), to: map(p1, 0)), [$p_1$], stroke: none)
    node((rel: (-1mm, -3mm), to: map(pA, 0)), [$p_A$], stroke: none)
    node((rel: (-1mm, -3mm), to: map(p2, 0)), [$p_2$], stroke: none)

    // 点标签
    node((rel: (-2mm, -2mm), to: map(O_p, O_mu)), [$O$], stroke: none)

    node((rel: (-2mm, -2mm), to: map(p1, K_mu)), [$K$], stroke: none)
    node((rel: (-2mm, 2mm), to: map(p1, J_mu)), [$J$], stroke: none)

    node((rel: (-3mm, -2mm), to: map(pA, A_mu)), [$A$], stroke: none)
    node((rel: (2mm, -1mm), to: map(pA, B_mu)), [$B$], stroke: none)

    node((rel: (2mm, -1mm), to: map(p2, M_mu)), [$M$], stroke: none)
    node((rel: (2mm, 2mm), to: map(p2, N_mu)), [$N$], stroke: none)

    node((rel: (2mm, 1mm), to: map(R_p, R_mu)), [$R$], stroke: none)
  },
)
