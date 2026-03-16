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

#exercise(subname: [3.13])[
  将范氏气体在不同温度下的等温线的极大点$N$与极小点$J$联起来，可以得到一条曲线$N C J$，如右图所示（此处$V_m$为气体的摩尔体积）。试证明这条曲线的方程为
  $
    p V_m^3 = a (V_m - 2b)
  $
  并说明这条曲线划分出来的三个区域I、II、III的含义。
]

#exercise(subname: [3.20])[
  试根据朗道自由能式导出单轴铁磁体的熵函数在无序相和有序相的表达式并证明熵函数在临界点是连续的。
]

#exercise(subname: [选做题])[
  假定朗道自由能写为
  $
    G(T, m) = a(T) + 1/2 b m^2 + 1/3 c m^3 + 1/4 d m^4
  $
  其中，$d>0, c<0$。试证明这一体系有一级相变,并请计算相变潜热。
]
