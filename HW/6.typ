#import "@preview/scripst:1.1.1": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch
#import "@preview/physica:0.9.8": *

#show: scripst.with(
  title: [统计力学第6次作业],
  author: "Anzreww",
  time: "2026年4月",
)

#exercise(subname: [7.11])[
  表面活性物质的分子在液面上作二维自由运动，可以看作二维气体。试写出在二维气体中分子的速度分布和速率分布，并求平均速率$overline(v)$、最概然速率$v_m$和方均根速率$v_s$。
]

#solution[
  二维气体中分子的速度分布为
  $
    f(v_x, v_y) dd(v_x, v_y) = m/(2 pi k T) e^(-m (v_x^2 + v_y^2)/(2 k T) )dd(v_x, v_y)
  $
  从而速率分布为
  $
    f(v) dd(v) = 2 pi v f(v_x, v_y) dd(v_x, v_y) = (m v)/(k T) e^(-(m v^2)/(2 k T)) dd(v)
  $
  从而
  - 平均速率
    $
      overline(v) = integral_0^oo v f(v) dd(v) = sqrt((pi k T)/(2 m))
    $
  - 最概然速率
    $
      pdv(f(v), v) = (m/(k T) - (m^2 v^2)/(k^2 T^2)) e^(-(m v^2)/(2 k T)) = 0 \
      v_m = sqrt((k T)/m)
    $
  - 方均根速率
    $
      v_s = sqrt(overline(v^2)) = sqrt(integral_0^oo v^2 f(v) dd(v)) = sqrt((2 k T)/m)
    $

]

#exercise(subname: [7.12])[
  试根据麦氏速度分布律导出两分子的相对速度$vb(v)_r=vb(v)_2-vb(v)_1$和相对速率$v_r=abs(vb(v)_r)$的概然分布，并求相对速率的平均值$overline(v_r)$。
]

#solution[
  Maxwell速度分布律给出两个分子的联合速度分布为
  $
    (m_1/(2 pi k T))^3 e^(- (m_1 v_1^2 + m_2 v_2^2)/(2 k T)) dd(vb(v)_1, vb(v)_2)
  $
  换成相对速度和质心速度
  $
    vb(v)_r = vb(v)_2 - vb(v)_1 \
    vb(v)_c = (m_1 vb(v)_1 + m_2 vb(v)_2)/(m_1 + m_2)
  $
  从而
  $
    1/2 m_1 v_1^2 + 1/2 m_2 v_2^2 = 1/2 mu v_r^2 + 1/2 M v_c^2
  $
  其中
  $
    mu = (m_1 m_2)/(m_1 + m_2) \
    M = m_1 + m_2
  $
  从而换成相对速度和质心速度的分布律为
  $
    (M/(2 pi k T))^(3/2) (mu/(2 pi k T))^(3/2) e^(- (M v_c^2 + mu v_r^2)/(2 k T)) dd(vb(v)_c, vb(v)_r)
  $
  其中相对速度的分布为
  $
    (mu/(2 pi k T))^(3/2) e^(- (mu v_r^2)/(2 k T)) dd(vb(v)_r)
  $
  从而相对速率的分布为
  $
    4 pi v_r^2 (mu/(2 pi k T))^(3/2) e^(- (mu v_r^2)/(2 k T)) dd(v_r)
  $
  #newpara()
  平均值为
  $
    overline(v_r) = integral_0^oo v_r 4 pi v_r^2 (mu/(2 pi k T))^(3/2) e^(- (mu v_r^2)/(2 k T)) dd(v_r) = sqrt((8 k T)/(pi mu))
  $
]

#exercise(subname: [7.14])[
  分子从器壁的小孔射出，求在射出的分子束中，分子的平均速率、方均根速率和平均能量。
]

#solution[
  先计算单位时间内，碰到单位面积器壁上，速率在$v$到$v+dd(v)$范围的分子数
  $
    dd(Gamma) & = f(v) v_x dd(v_x, v_y, v_z) = f v cos theta v^2 sin theta dd(theta, phi, v) \
  $
  对$theta$和$phi$积分得到单位时间内，碰到单位面积器壁上，速率在$v$到$v+dd(v)$范围的分子数为
  $
    dd(Gamma) = pi v^3 f(v) dd(v) = pi n (m/(2 pi k T))^(3/2) v^3 e^(- (m v^2)/(2 k T)) dd(v)
  $
  当小孔足够小，对容器内分子的平衡分布影响可以忽略时，单位时间内逸出的分子数就等于碰到小孔面积上的分子数。从而射出分子束中分子的速率分布为
  $
    overline(v) = (integral_0^oo v dd(Gamma))/(integral_0^oo dd(Gamma)) = (integral_0^oo v^4 e^(- (m v^2)/(2 k T)) dd(v))/(integral_0^oo v^3 e^(- (m v^2)/(2 k T)) dd(v)) = sqrt((9 pi k T)/(8 m))
  $
  速率平方的平均值为
  $
    overline(v^2) = (integral_0^oo v^2 dd(Gamma))/(integral_0^oo dd(Gamma)) = (integral_0^oo v^5 e^(- (m v^2)/(2 k T)) dd(v))/(integral_0^oo v^3 e^(- (m v^2)/(2 k T)) dd(v)) = (4 k T)/m
  $
  从而方均根速率为
  $
    v_s = sqrt(overline(v^2)) = sqrt((4 k T)/m)
  $
  平均动能为
  $
    1/2 m overline(v^2) = 2 k T
  $
]

#exercise(subname: [7.17])[
  气柱的高度为$H$，处在重力场中，试证明此气柱的内能和热容量为
  $
    U = U_0 + N k T - (N m g H)/(e^((m g H)/(k T)) - 1) \
    C_V = C^0_V + N k - (N (m g H)^2 e^((m g H)/(k T)))/(k T^2 (e^((m g H)/(k T)) - 1)^2)
  $
]

#proof[
  在重力场中分子的能量为
  $
    epsilon = 1/(2 m) (p_x^2 + p_y^2 + p_z^2) + m g z
  $
  配分函数为
  $
    Z & = 1/h^3 integral e^(- beta epsilon) dd(x, y, z, p_x, p_y, p_z) \
      & = 1/h^3 ((2 pi m)/beta)^(3/2) integral dd(x, y) integral_0^H e^(-beta (m g z)) dd(z) \
      & = 1/h^3 ((2 pi m)/beta)^(3/2) S 1/(beta m g) (1 - e^(- beta m g H)) \
  $
  对数为
  $
    ln Z = - 3/2 ln beta - ln beta + ln(1 - e^(- beta m g H)) + "const"
  $
  从而内能为
  $
    U & = - N pdv(ln Z, beta) = 3/2 N k T + N k T - (N m g H)/(e^((m g H)/(k T)) - 1) \
      & = U_0 + N k T - (N m g H)/(e^((m g H)/(k T)) - 1)
  $
  气体的热容为
  $
    C_V & = pdv(U, T) = C^0_V + N k - (N (m g H)^2 e^((m g H)/(k T)))/(k T^2 (e^((m g H)/(k T)) - 1)^2)
  $
]
