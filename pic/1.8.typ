#set page(height: auto, margin: 5pt)
#set align(center)
#import "@preview/fletcher:0.5.8": diagram, edge, node

#let vdw(T, v) = 8 * T / (3 * v - 1) - 3 / (v * v)

#let sample(va, vb, n, f, map) = range(n + 1).map(i => {
  let t = i / n
  let v = va + (vb - va) * t
  map(v, f(v))
})

// 给定温度 T 和上边界压强 ptop，求满足 vdw(T, v) = ptop 的左端起点 v
#let left_start(T, ptop, lo: 0.334, hi: 1.20, n: 50) = {
  if n == 0 {
    (lo + hi) / 2
  } else {
    let mid = (lo + hi) / 2
    if vdw(T, mid) > ptop {
      left_start(T, ptop, lo: mid, hi: hi, n: n - 1)
    } else {
      left_start(T, ptop, lo: lo, hi: mid, n: n - 1)
    }
  }
}

#let left_fig = diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 0.9pt,
  mark-scale: 110%,

  {
    let x0 = 9mm
    let y0 = 7mm
    let sx = 18mm
    let sy = 30mm

    let ptop = 2.3
    let xmax = 4.55
    let map = (v, p) => (x0 + v * sx, y0 + p * sy)

    // 坐标轴
    edge(vertices: (map(0, 0), map(xmax, 0)), marks: "->")
    edge(vertices: (map(0, 0), map(0, ptop)), marks: "->")

    node((rel: (2mm, -1mm), to: map(xmax, 0)), [$V_m$], stroke: none)
    node((rel: (-3mm, 1mm), to: map(0, ptop)), [$p$], stroke: none)

    // 温度取值：疏一些
    let Ts = (0.85, 0.90, 0.96, 1.00, 1.10, 1.22)
    let names = ($T_1$, $T_2$, $T_3$, $T_c$, $T_4$, $T_5$)

    // 等温线：每条都从 p = ptop 开始
    for i in range(Ts.len()) {
      let T = Ts.at(i)
      let vstart = left_start(T, ptop)
      let pts = sample(vstart, 4.25, 240, v => vdw(T, v), map)
      edge(vertices: pts)

      let vlab = 3.95
      let plab = vdw(T, vlab)
      node((rel: (2.5mm, 0mm), to: map(vlab, plab)), names.at(i), stroke: none)
    }

    // 共存曲线（binodal）：平台两端点
    let left_binodal = (
      (0.5453, 0.4786), // T1 = 0.85
      (0.6034, 0.6470), // T2 = 0.90
      (0.7082, 0.8476), // T3 = 0.96
      (1.0000, 1.0000), // Tc
    ).map(pt => map(pt.at(0), pt.at(1)))

    let right_binodal = (
      (1.0000, 1.0000), // Tc
      (1.6118, 0.8476), // T3 = 0.96
      (2.3488, 0.6470), // T2 = 0.90
      (3.3113, 0.4786), // T1 = 0.85
    ).map(pt => map(pt.at(0), pt.at(1)))

    edge(vertices: left_binodal, dash: "dashed", stroke: 0.6pt)
    edge(vertices: right_binodal, dash: "dashed", stroke: 0.6pt)

    node((rel: (-2mm, 3mm), to: map(1.00, 1.00)), [$C$], stroke: none)

    // Maxwell 平台
    edge(vertices: (map(0.5453, 0.4786), map(3.3113, 0.4786)), stroke: 0.5pt)
    edge(vertices: (map(0.6034, 0.6470), map(2.3488, 0.6470)), stroke: 0.5pt)
    edge(vertices: (map(0.7082, 0.8476), map(1.6118, 0.8476)), stroke: 0.5pt)
  },
)

#let right_fig = diagram(
  spacing: (0pt, 0pt),
  node-stroke: none,
  edge-stroke: 0.9pt,
  mark-scale: 110%,

  {
    let x0 = 9mm
    let y0 = 7mm
    let sx = 16mm
    let sy = 44mm
    let map = (v, p) => (x0 + v * sx, y0 + p * sy)

    // 坐标轴
    edge(vertices: (map(0, 0), map(5.30, 0)), marks: "->")
    edge(vertices: (map(0, 0), map(0, 1.55)), marks: "->")

    node((rel: (2mm, -1mm), to: map(5.30, 0)), [$V_m$], stroke: none)
    node((rel: (-3mm, 1mm), to: map(0, 1.55)), [$p$], stroke: none)

    // 一条亚临界等温线
    let T = 0.90
    let iso = sample(0.55, 5.00, 260, v => vdw(T, v), map)
    edge(vertices: iso)

    // 两个极值点（这条等温线）
    let vm1 = 0.7186
    let pm1 = 0.4198
    let vm2 = 1.5285
    let pm2 = 0.7240

    // 三条辅助压强线（按教材示意取）
    let p1 = 0.45
    let p4 = 0.62
    let p2 = pm2

    // 一些交点位置（用于放字）
    let Mv = 0.591
    let Av = 0.617
    let Dv = 0.968
    let Bv = 2.886
    let Jv = vm1
    let Kv = 4.208

    // 水平虚线
    edge(vertices: (map(0, p2), map(3.65, p2)), dash: "dashed", stroke: 0.5pt)
    edge(vertices: (map(0, p4), map(3.65, p4)), dash: "dashed", stroke: 0.5pt)
    edge(vertices: (map(0, p1), map(3.65, p1)), dash: "dashed", stroke: 0.5pt)

    // 竖直虚线
    edge(vertices: (map(vm1, 0), map(vm1, pm1)), dash: "dashed", stroke: 0.5pt)
    edge(vertices: (map(vm2, 0), map(vm2, pm2)), dash: "dashed", stroke: 0.5pt)

    // 压强标签
    node((rel: (-3mm, 0mm), to: map(0, p2)), [$p_2$], stroke: none)
    node((rel: (-3mm, 0mm), to: map(0, p4)), [$p_4$], stroke: none)
    node((rel: (-3mm, 0mm), to: map(0, p1)), [$p_1$], stroke: none)

    // 体积标签
    node((rel: (-2mm, -3mm), to: map(vm1, 0)), [$V_(m 1)$], stroke: none)
    node((rel: (-2mm, -3mm), to: map(vm2, 0)), [$V_(m 2)$], stroke: none)

    // 点标签
    node((rel: (-2mm, 2mm), to: map(0.55, vdw(T, 0.55))), [$R$], stroke: none)
    node((rel: (-2mm, 2mm), to: map(Mv, p2)), [$M$], stroke: none)
    node((rel: (-2mm, 2mm), to: map(Av, p4)), [$A$], stroke: none)
    node((rel: (-2mm, 2mm), to: map(Dv, p4)), [$D$], stroke: none)
    node((rel: (-1mm, 2mm), to: map(vm2, pm2)), [$N$], stroke: none)
    node((rel: (2mm, 2mm), to: map(Bv, p4)), [$B$], stroke: none)
    node((rel: (-1mm, -3mm), to: map(Jv, pm1)), [$J$], stroke: none)
    node((rel: (2mm, -3mm), to: map(Kv, p1)), [$K$], stroke: none)
    node((rel: (2mm, -2mm), to: map(4.02, 0.05)), [$O$], stroke: none)
  },
)


#grid(
  columns: (1fr, 1fr),
  left_fig, right_fig,
)
