#import "@preview/scripst:1.1.2": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch


#show: scripst.with(
  title: [统计力学第13次作业],
  author: "Anzreww",
  time: "2026年6月",
)

#exercise(subname: [9.4])[
  设分子碰撞方向$vu(n)$平行于$x$轴，试证明
  $
    dd(vb(v), vb(v)_1) = abs(J) dd(vb(v), vb(v)_1)
  $
  中的Jacobian行列式$J=-1$。
]

#proof[
  设
  $
    vu(n) = mat(1, 0, 0)
  $
  对同种分子碰撞，质量相等，碰撞后速度为
  $
    vb(v)' = vb(v) + ((vb(v)_1 - vb(v)) dot vu(n)) vu(n)\
    vb(v)_1' = vb(v)_1 + ((vb(v) - vb(v)_1) dot vu(n)) vu(n)
  $
  从而
  $
    vb(v)' = mat(v_x, v_y, v_z) + (v_(1x) - v_x) mat(1, 0, 0) = mat(v_(1x), v_y, v_z)\
    vb(v)_1' = mat(v_(1x), v_(1y), v_(1z)) + (v_x - v_(1x)) mat(1, 0, 0) = mat(v_x, v_(1y), v_(1z))
  $
  从而
  $
    J = (partial (v'_x, v'_y, v'_z, v'_(1x), v'_(1y), v'_(1z)))/(partial ( v_x, v_y, v_z, v_(1x), v_(1y), v_(1z))) = mat(
      delim: "|",
      0, 0, 0, 1, 0, 0;
      0, 1, 0, 0, 0, 0;
      0, 0, 1, 0, 0, 0;
      1, 0, 0, 0, 0, 0;
      0, 0, 0, 0, 1, 0;
      0, 0, 0, 0, 0, 1;
    ) = -1
  $
]
