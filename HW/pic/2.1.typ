#import "@preview/fletcher:0.5.8": diagram, edge, node

#set text(size: 12pt)

#diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 1pt,

  {
    let x0 = 16mm
    let y0 = 16mm
    let sx = 20mm
    let sy = 20mm
    let map = (V, p) => (x0 + V * sx, y0 + p * sy)

    edge(vertices: (map(0, 0), map(5.0, 0)), marks: "->")
    edge(vertices: (map(0, 0), map(0, 3.4)), marks: "->")
    node((rel: (3mm, -1mm), to: map(5.0, 0)), [$V$], stroke: none)
    node((rel: (-4mm, 2mm), to: map(0, 3.4)), [$p$], stroke: none)
    node((rel: (-3mm, -2mm), to: map(0, 0)), [$O$], stroke: none)

    let VA = 2.0
    let pA = 2.4
    let VB = 2.4
    let pB = 2.0
    let VC = 3.9
    let pC = 0.55

    let A = map(VA, pA)
    let B = map(VB, pB)
    let C = map(VC, pC)

    node((rel: (-3mm, 1mm), to: A), [$A$])
    node((rel: (2mm, 1mm), to: B), [$B$])
    node((rel: (2mm, -2mm), to: C), [$C$])

    // ---- 采样工具 ----
    let N = 140
    let sample = (Va, Vb, f) => range(N + 1).map(i => {
      let t = i / N
      let V = Va + (Vb - Va) * t
      map(V, f(V))
    })

    let T = pA * VA
    let iso = sample(VA, VB, V => T / V)
    edge(vertices: iso)

    let g1 = 1.55
    let g2 = 1.25

    let denom1 = (1 / calc.pow(VA, g1)) - (1 / calc.pow(VC, g1))
    let K1 = (pA - pC) / denom1
    let b1 = pA - K1 / calc.pow(VA, g1)
    let ad1 = sample(VA, VC, V => K1 / calc.pow(V, g1) + b1)
    edge(vertices: ad1)

    let denom2 = (1 / calc.pow(VB, g2)) - (1 / calc.pow(VC, g2))
    let K2 = (pB - pC) / denom2
    let b2 = pB - K2 / calc.pow(VB, g2)
    let ad2 = sample(VB, VC, V => K2 / calc.pow(V, g2) + b2)
    edge(vertices: ad2)
  },
)
