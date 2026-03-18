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
    let x0 = 7mm
    let y0 = 20mm
    let sx = 10mm
    let sy = 12mm
    let map = (T, H) => (x0 + T * sx, y0 + H * sy)

    let Tc = 3.0

    // 坐标轴
    edge(vertices: (map(0, -1.35), map(0, 1.55)))
    edge(vertices: (map(0, 0), map(4.1, 0)))

    node((rel: (-4mm, 2mm), to: map(0, 1.55)), [$H$], stroke: none)
    node((rel: (2mm, -2mm), to: map(4.1, 0)), [$T$], stroke: none)

    // Tc 点
    node(map(Tc, 0), shape: circle, radius: 2pt, fill: black)
    node((rel: (-1mm, -4mm), to: map(Tc, 0)), [$T_c$], stroke: none)

    // 区域文字
    node(map(0.80, 0.18), [Ferro], stroke: none)
    node(map(3.60, 0.72), [Para], stroke: none)

    // 自发磁化方向
    edge(vertices: (map(1.45, 0.02), map(1.45, 0.72)), marks: "->")
    edge(vertices: (map(1.45, -0.02), map(1.45, -0.72)), marks: "->")

    node(map(1.02, 0.7), [$M > 0$], stroke: none)
    node(map(0.98, -0.7), [$M < 0$], stroke: none)
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
    let sx = 26mm
    let sy = 26mm
    let map = (T, M) => (x0 + T * sx, y0 + M * sy)

    let Tc = 1.0
    let bet = 0.35
    let Ms = T => calc.pow(1 - T / Tc, bet)

    // 坐标轴
    edge(vertices: (map(0, 0), map(1.18, 0)))
    edge(vertices: (map(0, 0), map(0, 1.12)))

    node((rel: (-5mm, 2mm), to: map(0, 1.12)), [$M_s$], stroke: none)
    node((rel: (2mm, -2mm), to: map(1.18, 0)), [$T$], stroke: none)

    // 曲线：在 T -> Tc^- 时斜率发散
    let pts = sample_curve(0.00, 1.00, 260, T => Ms(T), map)
    edge(vertices: pts)

    // Tc 标记
    edge(vertices: (map(Tc, 0), map(Tc, -0.04)))
    node((rel: (-1mm, -4mm), to: map(Tc, 0)), [$T_c$], stroke: none)

    // 公式与引线
    node(map(0.7, 0.9), [$M_s = hat(B)(1 - T/T_c)^beta$], stroke: none)
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
    let sx = 14mm
    let sy = 14mm
    let map = (H, M) => (x0 + (H + 1.2) * sx, y0 + (M + 1.2) * sy)

    let Ms = 0.78

    // 分支：保证在 H=0 处严格接到 ±Ms
    let upper = H => Ms + 0.18 * (1 - calc.exp(-2.4 * H))
    let lower = H => -Ms - 0.18 * (1 - calc.exp(2.4 * H))

    // 坐标轴
    edge(vertices: (map(-1.2, -1.2), map(-1.2, 1.18)))
    edge(vertices: (map(-1.2, -1.2), map(1.38, -1.2)))

    node((rel: (-4mm, 2mm), to: map(-1.2, 1.18)), [$M$], stroke: none)
    node((rel: (2mm, -2mm), to: map(1.38, -1.2)), [$H$], stroke: none)

    // M=0 虚线
    edge(
      vertices: (map(-1.2, 0), map(0, 0)),
      dash: "dashed",
      stroke: 0.6pt,
    )

    // 左下分支、右上分支
    let lower_pts = sample_curve(-0.95, 0.0, 180, lower, map)
    let upper_pts = sample_curve(0.0, 1.05, 180, upper, map)

    edge(vertices: lower_pts)
    edge(vertices: upper_pts)

    // H=0 处跳变
    edge(vertices: (map(0, -Ms), map(0, Ms)))

    // 端点
    node(map(0, Ms), fill: black, radius: 3pt, stroke: none)
    node(map(0, -Ms), fill: black, radius: 3pt, stroke: none)

    // 原点标签
    node((rel: (-3mm, -3mm), to: map(0, -1.2)), [$0$], stroke: none)
    node((rel: (-4mm, -1mm), to: map(-1.2, 0)), [$0$], stroke: none)

    // ±Ms 标签
    node((rel: (3mm, 2mm), to: map(0, Ms)), [$+M_s$], stroke: none)
    node((rel: (3mm, -3mm), to: map(0, -Ms)), [$-M_s$], stroke: none)
  },
)

#grid(
  columns: (1.1fr, 1.15fr, 1.1fr),
  column-gutter: 1mm,
  fig1, fig2, fig3,
)
