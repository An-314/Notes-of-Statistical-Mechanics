#set page(height: auto, margin: 5pt)
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/physica:0.9.8": *

#set text(size: 11pt)

#let sample_curve(a, b, n, f, map) = range(n + 1).map(i => {
  let t = i / n
  let x = a + (b - a) * t
  map(x, f(x))
})

#let quad(x, x1, y1, x2, y2, x3, y3) = (
  y1 * (x - x2) * (x - x3) / ((x1 - x2) * (x1 - x3))
    + y2 * (x - x1) * (x - x3) / ((x2 - x1) * (x2 - x3))
    + y3 * (x - x1) * (x - x2) / ((x3 - x1) * (x3 - x2))
)

#let fig_gp = diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 0.9pt,
  mark-scale: 110%,

  {
    let x0 = 7mm
    let y0 = 6mm
    let sx = 14mm
    let sy = 12mm
    let Pc = 2.0
    let Gc = 2.10
    let map = (P, G) => (x0 + P * sx, y0 + G * sy)

    // 轴
    edge(vertices: (map(0, 0), map(4.5, 0)), marks: "->")
    edge(vertices: (map(0, 0), map(0, 3.35)), marks: "->")

    node((rel: (-4mm, 1mm), to: map(0, 3.35)), [$G$], stroke: none)
    node((rel: (2mm, -2mm), to: map(4.5, 0)), [$P$], stroke: none)

    // 竖虚线
    edge(vertices: (map(Pc, 0), map(Pc, 3.45)), dash: "dashed", stroke: 0.5pt)
    node((rel: (-1mm, -5mm), to: map(Pc, 0)), [$P_c$], stroke: none)

    // 在 Pc 处连续、但斜率突变
    let left = P => {
      let d = Pc - P
      Gc - 0.75 * d - 0.05 * d * d
    }
    let right = P => {
      let d = P - Pc
      Gc + 0.08 * d - 0.04 * d * d
    }

    let left_pts = sample_curve(0.40, Pc, 160, left, map)
    let right_pts = sample_curve(Pc, 4.00, 160, right, map)

    edge(vertices: left_pts, stroke: 1.1pt)
    edge(vertices: right_pts, stroke: 1.1pt)

    // 两条切线
    edge(
      vertices: (
        map(0.30, Gc + 0.75 * (0.30 - Pc)),
        map(2.55, Gc + 0.75 * (2.55 - Pc)),
      ),
      dash: "dashed",
      stroke: 0.6pt,
    )
    edge(
      vertices: (
        map(0.55, Gc + 0.08 * (0.55 - Pc)),
        map(3.55, Gc + 0.08 * (3.55 - Pc)),
      ),
      dash: "dashed",
      stroke: 0.6pt,
    )

    node(map(0.62, 0.72), [$V^"I"$], stroke: none)
    node(map(2.78, 1.78), [$V^"II"$], stroke: none)
  },
)

#let fig_gt = diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 0.9pt,
  mark-scale: 110%,

  {
    let x0 = 7mm
    let y0 = 6mm
    let sx = 14mm
    let sy = 12mm
    let Tc = 2.0
    let Gc = 2.00
    let map = (T, G) => (x0 + T * sx, y0 + G * sy)

    // 轴
    edge(vertices: (map(0, 0), map(4.5, 0)), marks: "->")
    edge(vertices: (map(0, 0), map(0, 3.35)), marks: "->")

    node((rel: (-4mm, 1mm), to: map(0, 3.35)), [$G$], stroke: none)
    node((rel: (2mm, -2mm), to: map(4.5, 0)), [$T$], stroke: none)

    // 竖虚线
    edge(vertices: (map(Tc, 0), map(Tc, 3.45)), dash: "dashed", stroke: 0.5pt)
    node((rel: (-1mm, -5mm), to: map(Tc, 0)), [$T_c$], stroke: none)

    // 在 Tc 处连续、但斜率突变
    let left = T => {
      let d = Tc - T
      Gc + 0.18 * d - 0.03 * d * d
    }
    let right = T => {
      let d = T - Tc
      Gc - 0.62 * d - 0.18 * d * d
    }

    let left_pts = sample_curve(0.60, Tc, 160, left, map)
    let right_pts = sample_curve(Tc, 3.05, 160, right, map)

    edge(vertices: left_pts, stroke: 1.1pt)
    edge(vertices: right_pts, stroke: 1.1pt)

    // 两条切线
    edge(
      vertices: (
        map(0.55, Gc - 0.18 * (0.55 - Tc)),
        map(3.70, Gc - 0.18 * (3.70 - Tc)),
      ),
      dash: "dashed",
      stroke: 0.6pt,
    )
    edge(
      vertices: (
        map(0.60, Gc - 0.62 * (0.60 - Tc)),
        map(3.00, Gc - 0.62 * (3.00 - Tc)),
      ),
      dash: "dashed",
      stroke: 0.6pt,
    )

    node(map(0.38, 1.48), [$-S^"I"$], stroke: none)
    node(map(2.18, 0.28), [$-S^"II"$], stroke: none)
  },
)

#let fig_vp = diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 0.9pt,
  mark-scale: 110%,

  {
    let x0 = 7mm
    let y0 = 6mm
    let sx = 14mm
    let sy = 12mm
    let Pc = 2.0
    let VI = 2.35
    let VII = 1.10
    let map = (P, V) => (x0 + P * sx, y0 + V * sy)

    // 轴
    edge(vertices: (map(0, 0), map(4.6, 0)), marks: "->")
    edge(vertices: (map(0, 0), map(0, 3.6)), marks: "->")

    node((rel: (-4mm, 1mm), to: map(0, 3.6)), [$V$], stroke: none)
    node((rel: (2mm, -2mm), to: map(4.6, 0)), [$P$], stroke: none)

    // 竖虚线
    edge(vertices: (map(Pc, 0), map(Pc, 3.7)), dash: "dashed", stroke: 0.5pt)
    node((rel: (-1mm, -5mm), to: map(Pc, 0)), [$P_c$], stroke: none)

    // 水平虚线
    edge(vertices: (map(0, VI), map(Pc, VI)), dash: "dashed", stroke: 0.6pt)
    edge(vertices: (map(0, VII), map(Pc, VII)), dash: "dashed", stroke: 0.6pt)

    node((rel: (-4mm, -1mm), to: map(0, VI)), [$V^"I"$], stroke: none)
    node((rel: (-4mm, -1mm), to: map(0, VII)), [$V^"II"$], stroke: none)

    // 左支、跳变、右支
    let left = P => quad(P, 0.8, 2.95, 1.35, 2.55, Pc, VI)
    let right = P => quad(P, Pc, VII, 2.55, 0.88, 3.2, 0.62)

    let left_pts = sample_curve(0.8, Pc, 120, left, map)
    let right_pts = sample_curve(Pc, 3.2, 120, right, map)

    edge(vertices: left_pts)
    edge(vertices: (map(Pc, VI), map(Pc, VII)))
    edge(vertices: right_pts)

    node(map(2.45, 3.02), [$V = (pdv(G, P))_T$], stroke: none)
  },
)

#let fig_st = diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 0.9pt,
  mark-scale: 110%,

  {
    let x0 = 7mm
    let y0 = 6mm
    let sx = 14mm
    let sy = 12mm
    let Tc = 2.0
    let SI = 2.15
    let SII = 0.95
    let map = (T, S) => (x0 + T * sx, y0 + S * sy)

    // 轴
    edge(vertices: (map(0, 0), map(4.6, 0)), marks: "->")
    edge(vertices: (map(0, 0), map(0, 3.6)), marks: "->")

    node((rel: (-4mm, 1mm), to: map(0, 3.6)), [$S$], stroke: none)
    node((rel: (2mm, -2mm), to: map(4.6, 0)), [$T$], stroke: none)

    // 竖虚线
    edge(vertices: (map(Tc, 0), map(Tc, 3.7)), dash: "dashed", stroke: 0.5pt)
    node((rel: (-1mm, -5mm), to: map(Tc, 0)), [$T_c$], stroke: none)

    // 水平虚线
    edge(vertices: (map(0, SI), map(Tc, SI)), dash: "dashed", stroke: 0.6pt)
    edge(vertices: (map(0, SII), map(Tc, SII)), dash: "dashed", stroke: 0.6pt)

    node((rel: (-4mm, -1mm), to: map(0, SI)), [$S^"I"$], stroke: none)
    node((rel: (-4mm, -1mm), to: map(0, SII)), [$S^"II"$], stroke: none)

    // 左支、跳变、右支
    let left = T => quad(T, 1.1, 0.62, 1.6, 0.80, Tc, SII)
    let right = T => quad(T, Tc, SI, 2.7, 2.45, 3.7, 2.95)

    let left_pts = sample_curve(1.1, Tc, 120, left, map)
    let right_pts = sample_curve(Tc, 3.7, 120, right, map)

    edge(vertices: left_pts)
    edge(vertices: (map(Tc, SII), map(Tc, SI)))
    edge(vertices: right_pts)

    node(map(2.65, 2.82), [$S = -(pdv(G, T))_P$], stroke: none)
  },
)

#grid(
  columns: (1fr, 1fr),
  rows: (auto, auto),
  column-gutter: 10mm,
  row-gutter: 8mm,
  fig_gp, fig_gt,
  fig_vp, fig_st,
)
