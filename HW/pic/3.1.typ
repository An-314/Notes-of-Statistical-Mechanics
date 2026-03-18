#import "@preview/fletcher:0.5.8": diagram, edge, node

#set text(size: 11pt)

#let sample-curve(a, b, n, f, map) = range(n + 1).map(i => {
  let t = i / n
  let x = a + (b - a) * t
  map(x, f(x))
})

// 范德华约化等温线
#let vdw(T, v) = 8 * T / (3 * v - 1) - 3 / (v * v)

#diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 1pt,
  mark-scale: 110%,

  {
    let x0 = 8mm
    let y0 = 7mm
    let sx = 15mm
    let sy = 20mm

    let map = (v, p) => (x0 + v * sx, y0 + p * sy)

    // 坐标轴
    edge(vertices: (map(0, 0), map(4.35, 0)), marks: "->")
    edge(vertices: (map(0, 0), map(0, 2.35)), marks: "->")

    node((rel: (-4mm, 1mm), to: map(0, 2.35)), [$p$], stroke: none)
    node((rel: (2mm, -2mm), to: map(4.35, 0)), [$V_m$], stroke: none)
    node((rel: (-3mm, -3mm), to: map(0, 0)), [$O$], stroke: none)

    // -------------------------
    // 两条亚临界等温线
    // -------------------------
    let iso1 = sample-curve(0.55, 3.95, 260, v => vdw(0.96, v), map)
    let iso2 = sample-curve(0.52, 3.95, 260, v => vdw(0.90, v), map)

    edge(vertices: iso1, stroke: 1.1pt)
    edge(vertices: iso2, stroke: 1.1pt)

    // -------------------------
    // 外侧虚线：Maxwell 等面积端点（binodal）
    // 这里用了 T=0.90, 0.96 两条等温线的共存端点，再加临界点 C
    // -------------------------
    let left_binodal = (
      (0.6034, 0.6470), // T=0.90 左端点
      (0.7082, 0.8476), // T=0.96 左端点
      (1.0000, 1.0000), // 临界点
    ).map(pt => map(pt.at(0), pt.at(1)))

    let right_binodal = (
      (1.0000, 1.0000), // 临界点
      (1.6118, 0.8476), // T=0.96 右端点
      (2.3488, 0.6470), // T=0.90 右端点
    ).map(pt => map(pt.at(0), pt.at(1)))

    edge(vertices: left_binodal, dash: "dashed", stroke: 0.75pt)
    edge(vertices: right_binodal, dash: "dashed", stroke: 0.75pt)

    // -------------------------
    // 内侧虚线：极大/极小值点（spinodal）
    // 这里用了 T=0.90, 0.96 两条等温线的极值点，再加临界点 C
    // -------------------------
    let left_spinodal = (
      (0.7186, 0.4198), // T=0.90 左极值
      (0.8059, 0.7981), // T=0.96 左极值
      (1.0000, 1.0000), // 临界点
    ).map(pt => map(pt.at(0), pt.at(1)))

    let right_spinodal = (
      (1.0000, 1.0000), // 临界点
      (1.2867, 0.8732), // T=0.96 右极值
      (1.5285, 0.7240), // T=0.90 右极值
    ).map(pt => map(pt.at(0), pt.at(1)))

    edge(vertices: left_spinodal, dash: "dashed", stroke: 0.75pt)
    edge(vertices: right_spinodal, dash: "dashed", stroke: 0.75pt)

    // 标记点
    node((rel: (0mm, 3mm), to: map(1.0000, 1.0000)), [$C$], stroke: none)
    node((rel: (-1mm, -4mm), to: map(0.6034, 0.02)), [$J$], stroke: none)
    node((rel: (-1mm, -4mm), to: map(2.3488, 0.02)), [$N$], stroke: none)

    // 区域标号
    node(map(0.78, 1.10), [I], stroke: none)
    node(map(1.60, 0.68), [II], stroke: none)
    node(map(2.28, 0.72), [III], stroke: none)
  },
)
