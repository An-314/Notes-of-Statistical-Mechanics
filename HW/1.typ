#import "@preview/scripst:1.1.1": *

#show: scripst.with(
  title: [统计力学第1次作业],
  author: "Anzreww",
  time: "2026年2月",
)

#exercise(subname: [1.2])[
  证明任何一种具有两个独立参量$T, p$的物质，其物态方程可由实验测得的体胀系数$α$及等温压缩系数$κ_T$，根据下述积分求得：
  $
    ln V = integral (alpha dd(T) - kappa_T dd(p))
  $
  如果$alpha = 1/T, kappa_T = 1/p$，试求物态方程。
]

#solution[
  由题
  $
    dd(ln V) = alpha dd(T) - kappa_T dd(p)
  $
  将$alpha$和$kappa_T$代入上式，得到
  $
    dd(ln V) = 1/T dd(T) - 1/p dd(p)
  $
  对上式两边积分，得到
  $
    ln V = ln T - ln p + C
  $
  即
  $
    V prop T/p
  $
  物态方程为
  $
    p V = C T
  $
]

#exercise(subname: [1.5])[
  描述金属丝的几何参量是长度$L$，力学参量是张力$sigma$，物态方程是
  $
    f(L, sigma, T) = 0
  $
  实验通常在$1 p_n$下进行，其体积变化可以忽略。线胀系数定义为
  $
    alpha = 1/L (pdv(L, T))_sigma
  $
  等温杨氏模量定义为
  $
    Y = L/A (pdv(sigma, L))_T
  $
  其中$A$是金属丝的截面积。一般来说，$alpha$和$Y$是$T$的函数。对$sigma$有微弱的依赖关系。如果温度变化范围不大，可以看成常量，假设金属丝两端固定，试证明，当温度由$T_1$降至$T_2$时，其张力的增加为
  $
    Delta sigma = - Y A alpha (T_2 - T_1)
  $
]

#proof[
  由题，物态方程为
  $
    f(L, sigma, T) = 0
  $
  即
  $
    L = L(sigma, T)
  $
  对上式两边求全微分，得到
  $
    dd(L) = (pdv(L, sigma))_T dd(sigma) + (pdv(L, T))_sigma dd(T)
  $
  由于金属丝两端固定，$dd(L) = 0$，上式可改写为
  $
    dd(sigma) & = - (pdv(L, T))_sigma / (pdv(L, sigma))_T dd(T) \
              & = - (alpha L) / (L/A Y) dd(T) \
              & = - Y A alpha dd(T)
  $
  从而当温度由$T_1$降至$T_2$时，张力的增加为
  $
    Delta sigma = - Y A alpha (T_2 - T_1)
  $
]

#exercise(subname: [1.7])[
  抽成真空的小匣带有活门，打开活门让气体冲入。当压强达到外界压强$p_0$时将活塞门关上。试证明：小匣内的空气在没有与外界交换热量之前，它的内能$U$与原来在大气中的内能之差为$U-U_0=p_0 V_0$，其中$V_0$是它原来在大气中的体积。若气体是理想气体，求它的温度和体积。
]

#solution[
  热力学第一定律
  $
    dd(U) = dd(Q) - p dd(V)
  $
  由于气体与外界没有热交换，$dd(Q) = 0$，上式可改写为
  $
    dd(U) = - p dd(V)
  $
  因为小匣较小，压强可以看成常数$p_0$，从而
  $
    dd(U) = - p_0 dd(V)
  $
  从而
  $
    U - U_0 = - p_0 (V - V_0) = p_0 V_0
  $
  #newpara()
  若气体是理想气体
  $
    p_0 V_0 = n R T_0
  $
  从而
  $
    U_0 = (n R T_0) / (gamma - 1), U = (n R T) / (gamma - 1)
  $
  从而
  $
    T = gamma T_0
  $
  而在气体进小匣后
  $
    p_0 V = n R T = n R gamma T_0 = gamma p_0 V_0
  $
  从而得到
  $
    V = gamma V_0
  $
  综上
  $
    T = gamma T_0 = gamma (p_0 V_0) / (n R), V = gamma V_0
  $
]

#exercise(subname: [1.11])[
  大气温度随高度降低的主要原因是在对流层中的低处与高处之间空气不断发生对流。由于气压随高度而降低，空气上升时膨胀，下降时收缩。空气的导热率很小，膨胀和收缩的过程可以认为是绝热过程。试计算大气温度随高度的变化率$dv(T, z)$，并给出数值结果。

  提示：根据流体静力学可导出气压随高度变化率
  $
    dv(p(z), z) = - rho(z) g
  $
  再利用理想气体的绝热方程求出
  $
    (pdv(T, p))_S = (gamma - 1)/gamma (T(z))/(p(z))
  $
  从而可以求出$dv(T, z)$。
]

#solution[
  $z$与$z+dd(z)$处的压强关系为
  $
    p(z) = p(z + dd(z)) + rho(z) g dd(z)
  $
  从而
  $
    dv(p(z), z) = - rho(z) g
  $
  这给出了由于高度变化引起的压强变化率。

  根据理想气体的物态方程
  $
    p(z) M/(rho (z)) = R T(z)
  $
  从而
  $
    dv(, z) p(z) = - (M g)/(R T(z)) p(z)
  $
  #newpara()
  绝热过程有
  $
    dd(U) = - p dd(V) => C_V dd(T) = - p dd(V)\
    C_V = (n R)/(gamma - 1)
  $
  而
  $
    p V = n R T => dd(p) V + p dd(V) = n R dd(T)
  $
  从而
  $
    V dd(p) + gamma p dd(V) = 0
  $
  给出绝热过程的关系
  $
    p V^gamma = "const" => p^(gamma - 1)/(T^gamma) = "const" => (pdv(T, p))_S = (gamma - 1)/gamma (T(z))/(p(z))
  $
  从而
  $
    dv(, z) T(z) = (gamma - 1)/gamma (T(z))/(p(z)) dv(p(z), z) = - (gamma - 1)/gamma (M g)/(R)
  $
  #newpara()
  查阅资料得到大气的热力学参数
  #three-line-table[
    | $gamma$ | $M$ (g/mol) |
    | --- | --- |
    | 1.41 | 29 |
  ]
  带入数值，得到
  $
    dv(, z) = - (gamma - 1)/gamma (M g)/(R) approx - 10 "K/km"
  $
]
