#import "@preview/scripst:1.1.1": *
#import "@preview/fletcher:0.5.8": diagram, edge, node

#show: scripst.with(
  title: [统计力学第3次作业],
  author: "Anzreww",
  time: "2026年3月",
)

#exercise(subname: [3.7])[
  试证明在相变中物质摩尔内能的变化为
  $
    Delta U_m = L (1 - p/T dv(T, p))
  $
  如果一相是气相，可看作理想气体，另一相是凝聚相，试将公式化简。
]

#proof[
  设两相分别为$alpha$和$beta$，则
  $
    Delta U_m = U_m^beta - U_m^alpha = (H_m^beta - p V_m^beta) - (H_m^alpha - p V_m^alpha) = L - p (V_m^beta - V_m^alpha)
  $
  Clapeyron方程给出
  $
    dv(p, T) = L/(T (V_m^beta - V_m^alpha))
  $
  从而
  $
    Delta U_m = L (1 - p/T dv(T, p))
  $
  #newpara()
  对于理想气体
  $
    p V_m^beta = R T => dv(p, T) = V_m^beta/T = (R p)/T
  $
  上式化简为
  $
    Delta U_m = L (1 - R p/T)
  $
]

#exercise(subname: [3.10])[
  试证明，相变潜热随温度的变化率为
  $
    dv(L, T) = c_p^beta - c_p^alpha + L/T - ((pdv(V_m^beta, T))_p - (pdv(V_m^alpha, T))_p) L/(V_m^beta - V_m^alpha)
  $
  如果$beta$相是气相，$alpha$相是凝聚相，试证明上式可简化为
  $
    dv(L, T) = c_p^beta - c_p^alpha
  $
]

#proof[
  潜热是两相的摩尔焓之差，即
  $
    L = H_m^beta - H_m^alpha
  $
  因此
  $
    dv(L, T) = dv(H_m^beta, T) - dv(H_m^alpha, T) = (pdv(H_m^beta, T))_p + (pdv(H_m^beta, p))_T dv(p, T) - (pdv(H_m^alpha, T))_p - (pdv(H_m^alpha, p))_T dv(p, T)
  $
  而热容
  $
    c_p = (pdv(Q_m, T))_p = (pdv(H_m, T))_p
  $
  从而
  $
    dv(L, T) = c_p^beta - c_p^alpha + ((pdv(H_m^beta, p))_T - (pdv(H_m^alpha, p))_T) dv(p, T)
  $
  另外由于
  $
    (pdv(H_m, p))_T & = (pdv((U_m + p V_m), p))_T = V_m + (pdv(U_m, p))_T \
                    & = V_m + (pdv(U_m, V_m))_T (pdv(V_m, p))_T + (pdv(U_m, T))_V (pdv(T, p))_T = V_m - p (pdv(V_m, T))_p
  $
  以及Clapeyron方程
  $
    dv(p, T) = L/(T (V_m^beta - V_m^alpha))
  $
  就得到
  $
    dv(L, T) &= c_p^beta - c_p^alpha + (V_m^beta - V_m^alpha - p ((pdv(V_m^beta, T))_p - (pdv(V_m^alpha, T))_p)) L/(T (V_m^beta - V_m^alpha)) \
    &= c_p^beta - c_p^alpha + L/T - ((pdv(V_m^beta, T))_p - (pdv(V_m^alpha, T))_p) L/(V_m^beta - V_m^alpha)
  $
  #newpara()
  对于$beta$是气相，$alpha$是凝聚相的情况，凝聚相的体积远小于气相的体积，因此
  $
    V_m^alpha, pdv(V_m^alpha, T) -> 0\ p V_m^beta = R T
  $
  带入有
  $
    dv(L, T) = c_p^beta - c_p^alpha + L/T - (pdv(V_m^beta, T))_p L/V_m^beta = c_p^beta - c_p^alpha
  $
]

#exercise(subname: [3.13])[
  将范氏气体在不同温度下的等温线的极大点$N$与极小点$J$联起来，可以得到一条曲线$N C J$，如右图所示（此处$V_m$为气体的摩尔体积）。试证明这条曲线的方程为
  $
    p V_m^3 = a (V_m - 2b)
  $
  并说明这条曲线划分出来的三个区域I、II、III的含义。
]

#figure(
  image("pic/3.2.png", width: 40%),
  numbering: none,
)

#proof[
  $J, N$是极值点，因此满足
  $
    (pdv(p, V_m))_T = 0
  $
  而Van der Waals方程为
  $
    p = (R T)/(V_m - b) - a/V_m^2
  $
  从而
  $
    (pdv(p, V_m))_T = - (R T)/(V_m - b)^2 + (2 a)/V_m^3 = 0
  $
  解得
  $
    a/V_m^3 = (R T)/(2 (V_m - b)^2)
  $
  其中
  $
    R T = (p + a/V_m^2) (V_m - b)
  $
  带入得到
  $
    a/V_m^3 = (p + a/V_m^2)/(2 (V_m - b)) => p V_m^3 = a (V_m - 2b)
  $
  #newpara()

  - I,III满足
    $
      (pdv(p, V_m))_T < 0
    $
    仍满足平衡稳定性，仍可作为亚稳态(过热液体、过饱和蒸气)单相存在
  - II满足
    $
      (pdv(p, V_m))_T > 0
    $
    不满足平衡稳定性，无法单相存在
]

#exercise(subname: [3.20])[
  试根据Landau自由能式导出单轴铁磁体的熵函数在无序相和有序相的表达式并证明熵函数在临界点是连续的。
]

#proof[
  Landau自由能式为
  $
    F(T, m) = F_0 + 1/2 a(T) m^2 + 1/4 b m^4
  $
  其中，$a(T) = a_0 (T - T_c)/T_c$，$a_0, b > 0$。给出无序相$T > T_c$和有序相$T < T_c$的$m$为
  $
    m = cases(
      0 & T > T_c,
      plus.minus sqrt(-a/b) " " & T < T_c
    )
  $
  给出对应的自由能
  $
    F(T, m) = cases(
      F_0 & T > T_c,
      F_0 - a^2/(4 b) " " & T < T_c
    )
  $
  从而熵函数为
  $
    S(T) = (pdv(F, T))_m = cases(
      (pdv(F_0, T))_m && T > T_c,
      (pdv(F_0, T))_m - (a/(2 b)) (pdv(a, T))_m & = (pdv(F_0, T))_m + 1/2 (a_0^2 (T - T_c))/(b T_c^2) " " & T < T_c
    )
  $
  可以看到在$T = T_c$处，熵函数的左右极限相等，因此熵函数在临界点是连续的。
]

#exercise(subname: [选做题])[
  假定Landau自由能写为
  $
    G(T, m) = a(T) + 1/2 b m^2 + 1/3 c m^3 + 1/4 d m^4
  $
  其中，$d>0, c<0$。试证明这一体系有一级相变,并请计算相变潜热。
]

#solution[
  稳定平衡条件为
  $
    (pdv(G, m))_T = 0
  $
  即
  $
    b m + c m^2 + d m^3 = m(b + c m + d m^2) = 0
  $
  得到
  $
    m = cases(
      0 & "无序相",
      plus.minus sqrt((c^2 - 4 b d)/(4 d^2)) - c/(2 d) & "有序相"
    )
  $
  一阶相变，关键是看在某个转变温度$T_c$ 处，系统的平衡序参量是否从0突然跳到非零值。相变点上，两相自由能必须相等：
  $
    G(T_c, 0) = G(T_c, m) => Delta G = 1/2 b m^2 + 1/3 c m^3 + 1/4 d m^4 = 0
  $
  且有
  $
    b + c m + d m^2 = 0
  $
  对比有
  $
    - 1/2 (c m + d m^2)m^2 + 1/3 c m^3 + 1/4 d m^4 & = 0 \
                           - 1/6 c m^3 - 1/4 d m^4 & = 0 \
  $
  得到
  $
    m = - (2 c)/(3 d)
  $
  这说明在相变点上，序参量从0跳到$- (2 c)/(3 d)$，因此是一级相变。此时
  $
    b = - (c m + d m^2) = (2 c^2)/(9 d)
  $

  临界温度时，Landau自由能为
  $
    G(T, m) = cases(
      a + 1/2 b m^2 + 1/3 c m^3 + 1/4 d m^4 & "有序相",
      a & "无序相"
    )
  $
  计算熵函数
  $
    S = - (pdv(G, T))_m = cases(
      - (pdv(a, T))_m - 1/2 (pdv(b, T))_m m^2 & "有序相",
      - (pdv(a, T))_m & "无序相"
    )
  $
  从而
  $
    Delta S = - 1/2 (pdv(b, T))_m m^2 = (c^2)/(9 d) (pdv(b, T))_m
  $
  则潜热为
  $
    L = T_c Delta S = (T_c c^2)/(9 d) (pdv(b, T))_m
  $
]

