#set page(width: auto, height: auto, margin: 0pt)
#import "@preview/fletcher:0.5.8": diagram, edge, node

#set text(size: 11pt)

#let sample_curve(a, b, n, f, map) = range(n + 1).map(i => {
  let t = i / n
  let x = a + (b - a) * t
  map(x, f(x))
})

#let fig1 = diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 0.9pt,
  mark-scale: 110%,

  {
    let x0 = 8mm
    let y0 = 7mm
    let sx = 10mm
    let sy = 13mm
    let Tc = 3.0
    let Pc = 1.55

    let map = (T, P) => (x0 + T * sx, y0 + P * sy)

    // 坐标轴
    edge(vertices: (map(0, 0), map(4.0, 0)))
    edge(vertices: (map(0, 0), map(0, 2.9)))

    node((rel: (-4mm, 2mm), to: map(0, 2.9)), [$P$], stroke: none)
    node((rel: (2mm, -2mm), to: map(4.0, 0)), [$T$], stroke: none)

    // 共存曲线
    let coexist = T => 0.42 + (Pc - 0.42) * calc.pow(T / Tc, 1.55)
    let pts = sample_curve(0.35, Tc, 220, coexist, map)
    edge(vertices: pts)

    // 临界点和虚线
    node(map(Tc, Pc), fill: black, radius: 2.2pt, stroke: none)
    edge(vertices: (map(0, Pc), map(Tc, Pc)), dash: "dashed", stroke: 0.6pt)
    edge(vertices: (map(Tc, 0), map(Tc, Pc)), dash: "dashed", stroke: 0.6pt)

    node((rel: (-1mm, -4mm), to: map(Tc, 0)), [$T_c$], stroke: none)

    // 相区标注
    node(map(1.80, 1.72), [liquid], stroke: none)
    node(map(1.95, 0.40), [gas], stroke: none)
  },
)

#let fig2 = diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 0.9pt,
  mark-scale: 110%,

  {
    let x0 = 8mm
    let y0 = 6mm
    let sx = 30mm
    let sy = 35mm
    let Tc = 1.0
    let bet = 0.35
    let Bhat = 1.0

    let map = (T, drho) => (x0 + T * sx, y0 + drho * sy)
    let drho = T => Bhat * calc.pow(1 - T / Tc, bet)

    // 坐标轴
    edge(vertices: (map(0, 0), map(1.18, 0)))
    edge(vertices: (map(0, 0), map(0, 1.08)))

    node((rel: (-5mm, 2mm), to: map(0, 1.08)), [$Delta rho$], stroke: none)
    node((rel: (2mm, -2mm), to: map(1.18, 0)), [$T$], stroke: none)

    // 曲线
    let pts = sample_curve(0.00, Tc, 260, drho, map)
    edge(vertices: pts)

    // Tc 刻度
    edge(vertices: (map(Tc, 0), map(Tc, -0.04)))
    node((rel: (-1mm, -4mm), to: map(Tc, 0)), [$t_c$], stroke: none)

    // 公式与引线
    node(map(0.3, 0.3), [$Delta rho = hat(B)(1 - T/T_c)^beta$], stroke: none)
  },
)

#let fig3 = diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 0.9pt,
  mark-scale: 110%,

  {
    let x0 = 8mm
    let y0 = 6mm
    let sx = 10mm
    let sy = 17mm

    let Pco = 2.0
    let rho_g = 0.42
    let rho_l = 1.78

    let map = (P, rho) => (x0 + P * sx, y0 + rho * sy)

    // 坐标轴
    edge(vertices: (map(0, 0), map(4.1, 0)))
    edge(vertices: (map(0, 0), map(0, 2.35)))

    node((rel: (-4mm, 2mm), to: map(0, 2.35)), [$rho$], stroke: none)
    node((rel: (2mm, -2mm), to: map(4.1, 0)), [$P$], stroke: none)

    // 下支：气体密度
    let lower = P => 0.10 + 0.07 * P + 0.045 * P * P
    let low_pts = sample_curve(0.35, Pco, 180, lower, map)
    edge(vertices: low_pts)

    // 上支：液体密度
    let upper = P => rho_l + 0.18 * (1 - calc.exp(-0.9 * (P - Pco))) + 0.05 * (P - Pco)
    let up_pts = sample_curve(Pco, 4.0, 180, upper, map)
    edge(vertices: up_pts)

    // 共存点之间的跳变
    edge(vertices: (map(Pco, rho_g), map(Pco, rho_l)))
    node(map(Pco, rho_g), fill: black, radius: 2.0pt, stroke: none)
    node(map(Pco, rho_l), fill: black, radius: 2.0pt, stroke: none)

    // x 轴刻度
    edge(vertices: (map(Pco, -0.04), map(Pco, 0.04)))

    // 括号和 Δρ
    let xb = Pco - 0.22
    edge(
      vertices: (
        map(xb, rho_g),
        map(xb - 0.12, rho_g),
        map(xb - 0.12, rho_l),
        map(xb, rho_l),
      ),
      stroke: 0.6pt,
    )
    node(map(1.40, (rho_g + rho_l) / 2 + 0.02), [$Delta rho$], stroke: none)

    // 注释
    node(map(3.72, 1.72), [$rho_"coex"^((2)) = rho_"liquid"$], stroke: none)

    node(map(3.2, 0.42), [$rho_"coex"^((1)) = rho_"gas"$], stroke: none)
  },
)

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 1mm,
  fig1, fig2, fig3,
)
