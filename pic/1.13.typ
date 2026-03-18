#set page(height: auto, margin: 5pt)
#set align(center)
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/physica:0.9.8": *


#let sample_curve(a, b, n, f, map) = range(n + 1).map(i => {
  let t = i / n
  let x = a + (b - a) * t
  map(x, f(x))
})

#let fig_g = diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 0.9pt,
  mark-scale: 110%,
  {
    let x0 = 7mm
    let y0 = 6mm
    let sx = 15mm
    let sy = 11mm
    let xmax = 3.7
    let ymax = 3.2
    let Tc = 1.45

    let map = (T, G) => (x0 + T * sx, y0 + G * sy)
    let gfun = T => 2.75 - 0.55 * T - 0.14 * T * T

    edge(vertices: (map(0, 0), map(xmax, 0)), marks: "->")
    edge(vertices: (map(0, 0), map(0, ymax)), marks: "->")

    node((rel: (-4mm, 1mm), to: map(0, ymax)), [$G$], stroke: none)
    node((rel: (2mm, -2mm), to: map(xmax, 0)), [$T$], stroke: none)

    edge(vertices: (map(Tc, 0), map(Tc, ymax)), dash: "dashed", stroke: 0.5pt)
    node((rel: (-1mm, -5mm), to: map(Tc, 0)), [$T_c$], stroke: none)

    let pts = sample_curve(0.22, 2.75, 220, gfun, map)
    edge(vertices: pts, stroke: 1.1pt)

    node((rel: (-1mm, 3mm), to: map(Tc, gfun(Tc))), [$G$], stroke: none)
    node(map(0.68, 1.34), [i 相], stroke: none)
    node(map(2.05, 1.50), [f 相], stroke: none)
  },
)

#let fig_s = diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 0.9pt,
  mark-scale: 110%,
  {
    let x0 = 7mm
    let y0 = 6mm
    let sx = 15mm
    let sy = 10mm
    let xmax = 3.7
    let ymax = 3.4
    let Tc = 1.45

    let map = (T, S) => (x0 + T * sx, y0 + S * sy)
    let sfun = T => 0.35 + 0.30 * T + 0.22 * T * T

    edge(vertices: (map(0, 0), map(xmax, 0)), marks: "->")
    edge(vertices: (map(0, 0), map(0, ymax)), marks: "->")

    node((rel: (-7mm, 0mm), to: map(0, 2.4)), [$pdv(G, T)$], stroke: none)
    node((rel: (2mm, -2mm), to: map(xmax, 0)), [$T$], stroke: none)

    edge(vertices: (map(Tc, 0), map(Tc, ymax)), dash: "dashed", stroke: 0.5pt)
    node((rel: (-1mm, -5mm), to: map(Tc, 0)), [$T_c$], stroke: none)

    let pts = sample_curve(0.28, 2.62, 220, sfun, map)
    edge(vertices: pts, stroke: 1.1pt)

    node(map(2.45, 2.85), [$S$], stroke: none)
  },
)

#let fig_v = diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 0.9pt,
  mark-scale: 110%,
  {
    let x0 = 7mm
    let y0 = 6mm
    let sx = 15mm
    let sy = 10mm
    let xmax = 3.7
    let ymax = 3.4
    let Tc = 1.45

    let map = (T, V) => (x0 + T * sx, y0 + V * sy)
    let vfun = T => 0.40 + 0.58 * T

    edge(vertices: (map(0, 0), map(xmax, 0)), marks: "->")
    edge(vertices: (map(0, 0), map(0, ymax)), marks: "->")

    node((rel: (-7mm, 0mm), to: map(0, 2.4)), [$pdv(G, p)$], stroke: none)
    node((rel: (2mm, -2mm), to: map(xmax, 0)), [$T$], stroke: none)

    edge(vertices: (map(Tc, 0), map(Tc, ymax)), dash: "dashed", stroke: 0.5pt)
    node((rel: (-1mm, -5mm), to: map(Tc, 0)), [$T_c$], stroke: none)

    let pts = sample_curve(0.28, 2.75, 220, vfun, map)
    edge(vertices: pts, stroke: 1.1pt)

    node(map(2.55, 2.95), [$V$], stroke: none)
  },
)

#let fig_cp = diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 0.9pt,
  mark-scale: 110%,
  {
    let x0 = 7mm
    let y0 = 6mm
    let sx = 15mm
    let sy = 10mm
    let xmax = 3.7
    let ymax = 3.1
    let Tc = 1.65

    let map = (T, C) => (x0 + T * sx, y0 + C * sy)

    let cleft = T => 0.58 + 0.2 * T + 0.22 / (Tc - T + 0.22) - 0.55
    let cjump = 0.62

    edge(vertices: (map(0, 0), map(xmax, 0)))
    edge(vertices: (map(0, 0), map(0, ymax)))

    node((rel: (-6mm, 0mm), to: map(0, 2.45)), [$C_p$], stroke: none)
    node((rel: (2mm, -2mm), to: map(xmax, 0)), [$T$], stroke: none)

    edge(vertices: (map(Tc, 0), map(Tc, ymax)), dash: "dashed", stroke: 0.5pt)
    node((rel: (-1mm, -5mm), to: map(Tc, 0)), [$T_c$], stroke: none)

    let left_pts = sample_curve(0.05, 1.65, 220, cleft, map)
    edge(vertices: left_pts, stroke: 1.1pt)

    edge(vertices: (map(Tc, cleft(1.65)), map(Tc, cjump)), stroke: 1.1pt)
    edge(vertices: (map(Tc, cjump), map(3.00, cjump)), stroke: 1.1pt)
  },
)

#grid(
  columns: (1fr, 1fr),
  rows: (auto, auto),
  column-gutter: 18mm,
  row-gutter: 8mm,

  fig_g, fig_s,
  fig_v, fig_cp,
)
