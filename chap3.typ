#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch


= Boltzmann统计理论

我们在这一章研究理想气体与理想固体的宏观性质。

- *理想气体：*粒子间作用弱，非简并条件$a_i/omega_i << 1$，对应*半经典分布*
- *理想固体：*定域粒子，对应*Boltzmann分布*

== 宏观量的统计表达式

=== 配分函数

#definition(subname: [配分函数])[
  配分函数是系统所有微观状态的统计权重之和。对于一个系统，配分函数$Z$定义为：
  $
    Z(beta, y) = sum_i omega_i e^(- beta epsilon_i) > 0
  $
  其中
  - $omega_i$ 是第$i$个微观状态的简并度
  - $epsilon_i$ 是第$i$个微观状态的能级
  - $y$ 是外参量，单粒子能级一般是$y$的函数
  - $beta$ 是一个与温度相关的参数，后面我们将证明$beta = 1/(k_B T) > 0$
]

=== 宏观量

*总粒子数*
$
  N = sum_i a_i = sum_i omega_i e^(- alpha - beta epsilon_i) = e^(- alpha) sum_i omega_i e^(- beta epsilon_i) = e^(- alpha) Z
$
从而
$
  e^(-alpha) = N / Z
$
#theorem(subname: [配分函数与总粒子数])[
  配分函数$Z$与总粒子数$N$的关系为
  $
    N = e^(- alpha) Z
  $
]

#newpara()

*内能*
$
  U = sum_i a_i epsilon_i = sum_i omega_i epsilon_i e^(- alpha - beta epsilon_i) = - e^(- alpha) pdv(Z, beta) = -N pdv(ln Z, beta)
$
从而
$
  U = - N pdv(ln Z, beta)
$
#theorem(subname: [配分函数与内能])[
  配分函数$Z$与内能$U$的关系为
  $
    U = - N pdv(ln Z, beta)
  $
]
#newpara()

下面求*物态方程与熵*，对于封闭系统
$
  dd(U) = dd(W) + dd(Q)
$
- 宏观表达式
  - 准静态过程
    $
      dd(W) = sum_k Y_k dd(y_k)
    $
    其中$Y$是广义力，$y$是广义坐标即外参量
  - 无限小可逆过程有
    $
      dd(Q) = T dd(S)
    $
- 微观表达式
  $
    dd(U) = dd(sum_i a_i epsilon_i) = sum_i epsilon_i dd(a_i) + sum_i a_i dd(epsilon_i)
  $
  - $y$变引起$epsilon_i$变即能级移动，传热引起分布$a_i$变
从而
$
  sum_k Y_k dd(y_k) = sum_i a_i dd(epsilon_i) = sum_i a_i sum_k pdv(epsilon_i, y_k) dd(y_k)
$
有
$
  Y_k = sum_i a_i pdv(epsilon_i, y_k) = sum_i omega_i e^(- alpha - beta epsilon_i) pdv(epsilon_i, y_k) = -N/beta pdv(ln Z, y_k)
$
这就给出*物态方程*
#theorem(subname: [配分函数与物态方程])[
  配分函数$Z$与物态方程的关系为
  $
    Y_k = -N/beta pdv(ln Z, y_k)
  $
]
例如
$
  p = -N/beta pdv(ln Z, V)
$
#newpara()

$
  T dd(S) & = dd(Q) = dd(U) - sum_k Y_k dd(y_k) \
  & = sum_i epsilon_i dd(a_i) = dd(U) - sum_i a_i dd(epsilon_i) = - N dd((pdv(ln Z, beta))) + N/beta sum_k pdv(ln Z, y_k) dd(y_k)
$
利用
$
  dd(ln Z) = pdv(ln Z, beta) dd(beta) + sum_k pdv(ln Z, y_k) dd(y_k)
$
从而有
$
  T dd(S) = - N dd((pdv(ln Z, beta))) + N/beta (dd(ln Z) - pdv(ln Z, beta) dd(beta)) = N/beta dd((ln Z - beta pdv(ln Z, beta)))
$
给出*熵的表达式*
#theorem(subname: [配分函数与熵])[
  配分函数$Z$与熵$S$的关系为
  $
    dd(S) = N/(beta T) dd((ln Z - beta pdv(ln Z, beta))) = N k_B (ln Z - beta pdv(ln Z, beta))
  $
  两边都是全微分，要求$1/(beta T)$为常数，得到$k_B = 1/(beta T)$，其中$k_B$是Boltzmann常数。
]
可以得到
$
  S- S' = N k_B (ln Z - beta pdv(ln Z, beta))
$
#newpara()
其它宏观量可由以上量表示，例如*自由能*
$
  F = U - T S = - N/beta ln Z - T S'
$
*化学势*
$
  mu = (pdv(F, N))_(T,y)
$
这就说明事实上*配分函数*$Z(beta,y)$是以$beta,y$为变量的*特性函数*。

=== Boltzmann关系

#theorem(subname: [Boltzmann关系])[
  熵与微观状态数的关系为
  $
    S = k ln Omega{a_i}
  $
  其中$Omega{a_i}$是满足分布$a_i$的微观状态数。
]

这是因为熵具有可加性，如果独立系统1,2组成复合系统，那么
$
  Omega_12 = Omega_1 Omega_2
$
而热力学要求
$
  S_12 = S_1 + S_2
$
从而
$
  S prop ln Omega
$
$S$的含义：
- 粒子运动越混乱，分布越广，$Omega{a_i}$越大，熵越大，故$S$是系统混乱程度的度量
- 对非简并基态$Omega=1, S=0$：这就是热力学第三定律的内容，绝对零度时，完美晶体熵趋于0
- 热力学第二定律只适用于大系统，熵偏离极大值的涨落极小；对宏观系统，偏离最大$Omega$的状态概率极低，所以系统几乎总在熵最大的附近

我们刚才有熵用配分函数的表达式
$
  S - S' = N k (ln Z - beta pdv(ln Z, beta))
$
现在确定$S'$

对*半经典分布*
$
  S = k_B ln Omega_s {a_i} & = k_B sum_i (a_i ln omega_i - a_i (ln a_i - 1) ) = k_B sum_i a_i (alpha + beta epsilon_i + 1) \
  & = k_B (N alpha + beta U + N) = k_B (N ln Z/N - N beta pdv(ln Z, beta) + N) \
  & = k_B (N (ln Z - beta pdv(ln Z, beta)) + N(-ln N + 1))
$
从而
$
  S' = N k_B(1 - ln N) = - k_B ln N!
$
#newpara()
对*Boltzmann分布*
$
  S = k_B ln Omega{a_i} = k_B ln N! + k_B ln Omega_s {a_i}
$
就有
$
  S' = 0
$
#newpara()

最终我们对配分函数与宏观量的关系做出总结
#theorem(subname: [配分函数与宏观量])[
  配分函数$Z$与宏观量的关系为
  #figure(
    three-line-table[
      | 宏观量 | 半经典分布 | Boltzmann分布 |
      | --- | --- | --- |
      | 总粒子数 | $N = e^(- alpha) Z$ | < |
      | 内能 | $U = - N pdv(ln Z, beta)$ | < |
      | 物态方程 | $Y_k = -N/beta pdv(ln Z, y_k)$ | < |
      | 熵 | $S = N k_B (ln Z - beta pdv(ln Z, beta)) + N k_B (1 - ln N)$ | $S = N k_B (ln Z - beta pdv(ln Z, beta))$ |
      | 自由能 | $F = - N k_B T ln Z - N k_B T(1 - ln N)$ | $F = - N k_B T ln Z$ |
      | 化学势 | $mu = - alpha k_B T$ | $mu = - k_B T ln Z$ |
    ],
  )
]
注意，化学势推导用到了$ln Z = ln N + alpha$。

== 半经典近似

#theorem(subname: [半经典近似判据])[
  若
  $
    Delta epsilon_i << k_B T
  $
  即单粒子能量间距$Delta epsilon_i$远小于热运动特征能量$k_B T$，能量准连续，可用半经典近似计算$Z$
]

=== 单粒子态的半经典描述——$mu$空间

#definition(subname: [$mu$空间])[
  粒子的广义坐标$q_i$与广义动量$p_i$所张成的空间称为$mu$空间。

  设粒子自由度为$gamma$，则$2 gamma$维相体积元
  $
    dd(omega) = product_(i=1)^gamma dd(q_i, p_i)
  $
]

*经典*情况下一个状态对应$mu$空间中的一点。而对于*半经典*情况，一个状态对应大小为$h^gamma$的相体积元（测不准关系$Delta q Delta p = h$）于是相体积元$dd(omega)$中包含的量子态数大约是
$
  dd(N) = h^(- gamma) dd(omega)
$
这就是半经典近似的核心思想：量子力学指出不能无限精细地区分相空间中的点，每一个独立量子态，大致占据一个最小的相空间体积$h^gamma$。

单粒子能量看成$q, p$的连续函数：
$
  q = {q_1, q_2, ..., q_gamma}, p = {p_1, p_2, ..., p_gamma}
$
能量曲面:
$
  H(q, p, y) = epsilon
$
是$q,p$和外参量$y$的Hamiltonian，维度为$2 gamma$，能量曲面是一个$2 gamma - 1$维的超曲面。

#example(subname: [几个典型体系的Hamiltonian])[
  - 谐振子
    $
      epsilon = 1/(2 m) p_x^2 + 1/2 m omega^2 x^2
    $
  - 转子
    $
      epsilon = 1/(2 I) (p_theta^2 + 1/(sin^2 theta) p_phi^2)
    $
  - 单原子分子
    $
      epsilon = 1/(2m) (p_x^2 + p_y^2 + p_z^2) + U, U =cases(oo "容器外", 0 "容器内",)
    $
]

=== 系统状态的半经典描述

全同粒子的近独立系统$μ$空间也可描述系统的状态。

现在计算*相空间体积元$dd(omega)$中的粒子数*，每个状态上的粒子数
$
  a_i/omega_i = e^(- alpha - beta epsilon_i)
$
从而体积元$dd(omega)$中粒子数
$
  dd(N) = h^(-gamma) e^(- alpha - beta epsilon) dd(omega)
$
从而
$
  N = integral h^(-gamma) e^(- alpha - beta epsilon) dd(omega) = e^(-alpha) Z(beta, y)
$
其中
$
  Z(beta, y) = integral h^(-gamma) e^(- beta epsilon) dd(omega), epsilon = H(q, p, y)
$
在*半经典近似*下
#theorem(subname: [半经典近似下配分函数的表达式])[
  半经典近似下配分函数的表达式为
  $
    Z(beta, y) = integral h^(-gamma) e^(- beta H(q, p, y)) dd(omega)
  $
]
#newpara()
紧接着计算*能量在$epsilon -> epsilon + dd(epsilon)$的粒子数*
$
  a_i = omega_i e^(- alpha - beta epsilon_i) ==> n(epsilon) dd(epsilon) = g(epsilon) e^(- alpha - beta epsilon) dd(epsilon)
$
有
$
  N = integral_0^oo n(epsilon) dd(epsilon) = e^(- alpha) Z(beta, y)
$
从而有
$
  Z(beta, y) = integral_0^oo g(epsilon) e^(- beta epsilon) dd(epsilon)
$
因此
#theorem(subname: [半经典近似下配分函数的表达式2])[
  半经典近似下配分函数的表达式为
  $
    Z(beta, y) = integral_0^oo g(epsilon) e^(- beta epsilon) dd(epsilon)
  $
]
#newpara()
令
$
  Omega(epsilon) = integral_0^epsilon dd(omega)
$
表示能量不超过$epsilon$的状态数，那么
$
  g(epsilon) dd(epsilon) = h^(-gamma) dd(Omega(epsilon))
$
即
$
  g(epsilon) = h^(-gamma) dv(Omega(epsilon), epsilon)
$
#definition(subname: [能态密度])[
  能态密度$g(epsilon)$定义为能量在$epsilon -> epsilon + dd(epsilon)$的状态数，即
  $
    g(epsilon) dd(epsilon) = integral_(epsilon ->epsilon + dd(epsilon)) h^(-gamma) dd(omega)
  $
  有
  $
    g(epsilon) = h^(-gamma) dv(Omega(epsilon), epsilon)
  $
]

#newpara()

#theorem(subname: [极限定理])[
  大量子数的状态在$mu$空间对应$h^gamma$的相体积。
]
对于大量子数状态，量子态在$mu$空间中对应成一个个小单元；在高量子数极限下，用相空间体积除以 $h^gamma$来计数，和真正的量子态计数会趋于一致。

#example(subname: [一维谐振子系统的极限定理])[
  一维谐振子
  $
    p_x^2/(2 m epsilon) + x^2/((2 epsilon)/(m omega^2)) = 1
  $
  可以计算到
  $
    Omega(epsilon) = integral_0^epsilon dd(omega) = pi sqrt(2m epsilon) sqrt((2 epsilon)/(m omega^2)) = (2 pi epsilon) / omega
  $
  从而
  $
    g(epsilon)= h^(-1) dv(Omega(epsilon), epsilon) = (2 pi) / (h omega)
  $
  有
  $
    Delta Omega(epsilon) = (2 pi) / omega Delta epsilon
  $
  #newpara()
  另一方面量子态
  $
    epsilon_n = (n + 1/2) hbar omega, n = 0, 1, 2, ...; omega_n = 1
  $
  $epsilon_(n-1) -> epsilon_n$只有一个状态，从而
  $
    Delta Omega(epsilon) = (2 pi) / omega Delta epsilon = h
  $
]

#example(subname: [二维谐振子系统的极限定理])[
  $
    1/(2m) (p_x^2 + p_y^2) + 1/2 m omega^2 (x^2 + y^2) = epsilon
  $
  给出
  $
    p'_x^2 + p'_y^2 + x'^2 + y'^2 = 1\
    p'_(x,y) = p_(x,y) / sqrt(2 m epsilon), x'_(x,y) = x_(x,y) / sqrt((2 epsilon)/(m omega^2))
  $
  从而
  $
    Omega(epsilon) = integral_0^epsilon dd(vb(omega)) = 2 m epsilon (2 epsilon)/(m omega^2) dot v_4 = (2 pi^2 epsilon^2) / (omega^2)
  $
  其中$v_n$是$n$维单位球的体积
  $
    v_n = (2 pi^(n/2)) / Gamma(n/2 + 1) 1/N R^N
  $
  得到
  $
    g(epsilon) = h^(-2) dv(Omega(epsilon), epsilon) = (4 pi^2) / (h^2 omega^2) epsilon
  $
  另一方面，量子态
  $
    epsilon_(n_x, n_y) = (n_x + n_y + 1) hbar omega, n_x, n_y = 0, 1, 2, ...; omega_n = n_x + n_y + 1\
    epsilon_(n) = (n + 1) hbar omega, n = 0, 1, 2, ...; omega_n = n + 1
  $
  $epsilon_(n-1) -> epsilon_n$有$n + 1$个状态，从而
  $
    (Delta Omega(epsilon))/(n + 1) = (4 pi^2 hbar^2 (n + 1/2))/(n + 1) -> h^2
  $
]

#example(subname: [转子系统的极限定理])[
  转子
  $
    1/(2 I) (p_theta^2 + 1/(sin^2 theta) p_phi^2) = epsilon ==> p_theta^2/(2 I epsilon) + p_phi^2/(2 I epsilon sin^2 theta) = 1
  $
  从而
  $
    Omega(epsilon) = integral_0^epsilon dd(omega) = integral dd(theta, phi) integral dd(p_theta, p_phi) = integral dd(theta, phi) pi sqrt(2 I epsilon) sqrt(2 I epsilon sin^2 theta) = 8 pi^2 I epsilon
  $
  从而
  $
    g(epsilon) = h^(-2) dv(Omega(epsilon), epsilon) = (8 pi^2 I) / (h^2)
  $
  另一方面，量子态
  $
    epsilon_l = l(l + 1) hbar^2/(2 I), l = 0, 1, 2, ...; omega_n = (2 l + 1)
  $
  $epsilon_(l-1) -> epsilon_l$有$2 l + 1$个状态，从而
  $
    (Delta Omega(epsilon))/(2 l + 1) = (8 pi^2 I hbar^2 l) / (2 l + 1) -> h^2
  $
]


#example(subname: [单原子分子的极限定理])[
  单原子分子
  $
    1/(2m) (p_x^2 + p_y^2 + p_z^2) + U(x, y, z) = epsilon
  $
  从而
  $
    Omega(epsilon) = integral_0^epsilon dd(vb(omega)) = V integral_0^sqrt(2 m epsilon) 4 pi p^2 dd(p) = 4/3 pi (2 m epsilon)^(3/2) V
  $
  从而
  $
    g(epsilon) = h^(-3) dv(Omega(epsilon), epsilon) = (4 pi (2 m)^(3/2)) / (3 h^3) epsilon^(1/2) V
  $
  另一方面，量子态
  $
    epsilon_n = (n_x^2 + n_y^2 + n_z^2) hbar^2/(2 m), n_x, n_y, n_z = 0, 1, 2, ...
  $
  近似计算$omega_n$：小方格体积为$1$，故：能量曲面与坐标平面所夹体积=包含的状态数$G(epsilon)$
  $
    G(epsilon) = 4/3 pi ((8 m L^2 epsilon) / hbar^2)^(3/2) 1 / 8 = 4/3 pi (2 m epsilon)^(3/2) V / h^3
  $
  每个状态的相体积
  $
    Omega(epsilon) / G(epsilon) = h^3
  $
  $epsilon -> epsilon + dd(epsilon)$状态数为
  $
    g(epsilon) dd(epsilon) = dd(G(epsilon)) = (2 pi V)/h^3 (2 m)^(3/2) epsilon^(1/2) dd(epsilon)
  $
  考虑自旋后，应乘以自旋简并度$g_s = 2 s + 1$，其中$s$是自旋量子数
  $
    g(epsilon) dd(epsilon) = g_s (2 pi V)/h^3 (2 m)^(3/2) epsilon^(1/2) dd(epsilon)
  $
]

== 理想气体

理想气体在常$T$，常$p$下满足非简并条件
$
  e^alpha >> 1
$
数值估计见后，满足*非简并条件*，因此可以使用*半经典分布*描述。

分子运动可以分成*质心平动*和*内部运动*，两种运动彼此独立。两种运动之间无能量交换，否则就没法分别给出平动和内部自由度的温度分布描述
$
  epsilon_a = epsilon_t + epsilon_i, omega_a = omega_t omega_i
$
*配分函数*
$
  Z(beta, V) = sum_a omega_a e^(- beta epsilon_a) = sum_t omega_t e^(- beta epsilon_t) sum_i omega_i e^(- beta epsilon_i) = Z_t (beta, V) Z_i (beta)
$
*粒子数*
$
  N = e^(- alpha) Z(beta, V) = sum_a omega_a e^(- alpha - beta epsilon_a)
$
*能量*
$
  U = - N pdv(ln Z, beta) = - N (pdv(ln Z_t, beta) + pdv(ln Z_i, beta)) = U_t + U_i
$
*物态方程*
$
  p = -N/beta pdv(ln Z, V) = -N/beta pdv(ln Z_t, V)
$
与内部运动无关，*熵*
$
    S & = N k_B (ln Z - beta pdv(ln Z, beta)) + N k_B (1 - ln N) = S_t + S_i \
  S_t & = N k_B (ln Z_t - beta pdv(ln Z_t, beta)) + N k_B (1 - ln N) \
  S_i & = N k_B (ln Z_i - beta pdv(ln Z_i, beta))
$
$S_t$有$1-ln N$是因为质心平动的粒子是不可区分的，而$S_i$没有$1-ln N$是因为内部运动的粒子是可区分的。*自由能*
$
    F & = - N k_B ln Z - N k_B T(1 - ln N) = F_t + F_i \
  F_t & = - N k_B ln Z_t - N k_B T(1 - ln N) \
  F_i & = - N k_B ln Z_i
$
*化学势*
$
  mu = - alpha k_B T
$

=== 质心平动

从单原子分子的平动能量出发，$epsilon_t$准连续
$
  epsilon_t = (p_x^2 + p_y^2 + p_z^2) / (2 m) + U(x, y, z)
$
则有半经典配分函数
$
  Z_t (beta, V) &= integral h^(-3) e^(- beta epsilon_t) dd(omega) = h^(-3) integral dd(x, y, z) e^(- beta U(x, y, z)) dd(x, y, z) integral e^(- beta (p_x^2 + p_y^2 + p_z^2) / (2 m)) dd(p_x, p_y, p_z) \
  &= h^(-3) V integral_0^oo 4 pi p^2 e^(- beta p^2 / (2 m)) dd(p) = V (2 pi m k_B T)^(3/2) / h^3
$

#theorem(subname: [理想气体质心平动的配分函数])[
  理想气体质心平动的配分函数为
  $
    Z_t (beta, V) = V (2 pi m k_B T)^(3/2) / h^3
  $
]

==== 单原子分子

单原子分子没有内部自由度，只有质心平动
$
  N = e^(- alpha) Z_t (beta, V) => e^alpha = V/N ((2 pi m k_B T)/ (h^2))^(3/2)
$
在常$T$，常$p$下，一般$e^alpha tilde 10^5 >> 1$，满足*非简并条件*，因此可以使用*半经典分布*描述。稀薄、高温、粒子质量较大时：de Broglie波长较短，粒子波函数重叠很弱，粒子更容易区分，满足非简并条件。

由配分函数可以得到
- *内能*
  $
    U = E_t = - N pdv(ln Z_t, beta) = 3/2 N k_B T
  $
  能量均分：每个自由度平均分配$1/2k_B T$的能量，单原子分子有三个平动自由度，所以内能为$3/2 N k_B T$
- *定容热容*
  $
    C_V = (pdv(U, T))_V = 3/2 N k_B
  $
- *物态方程*
  $
    p = -N/beta pdv(ln Z_t, V) = (N k_B T) / V
  $
  这是理气状态方程
- *熵*（Sackur-Tetrode equation）
  $
    S & = S_t = N k_B (ln Z_t - beta pdv(ln Z_t, beta)) + N k_B (1 - ln N) \
      & = N k_B (ln (V/N ((2 pi m k_B T)/ (h^2))^(3/2))) + 5/2 N k_B
  $
  - 熵是广延量
  - 它自然避免了Gibbs悖论：只有在正确考虑$N!$和量子不可分辨性之后，熵才会有正确的广延性，不会出现混合相同气体还产生额外熵的假悖论
  - 经典统计只能给出一些热力学关系，但要给出熵的绝对值，必须引入量子统计的概念，考虑粒子不可区分性，才能得到正确的Sackur-Tetrode方程
- *自由能*
  $
    F & = F_t = - N k_B T ln Z_t - N k_B T(1 - ln N) \
      & = - N k_B T ln (V/N ((2 pi m k_B T)/ (h^2))^(3/2)) - N k_B T
  $
- *化学势*
  $
    mu = (pdv(F, N))_(T,V) = - k_B T ln (V/N ((2 pi m k_B T)/ (h^2))^(3/2))
  $

==== Maxwell速度分布律

Maxwell速度分布律描述了理想气体中粒子质心平动速度分布，与内部运动无关。

相空间体积元$dd(vb(omega))$中的粒子数
$
  dd(N) = h^(-gamma) e^(- alpha - beta epsilon) dd(vb(omega))
$
积分去除坐标变量，得到按动量的分布
$
  h^(-3) dd(p_x, p_y, p_z) integral dd(x, y, z) e^(- alpha - beta epsilon) &= h^(-3) V e^(- alpha) e^(- beta ((p_x^2 + p_y^2 + p_z^2) / (2 m) + U)) dd(p_x, p_y, p_z)\
  &= h^(-3) dd(p_x, p_y, p_z) e^(- alpha - beta (p_x^2 + p_y^2 + p_z^2) / (2 m)) integral dd(x, y, z) e^(- beta U) \
  &= V/h^3 dd(p_x, p_y, p_z) e^(- alpha - beta (p_x^2 + p_y^2 + p_z^2) / (2 m))\
  &= N (1/(2 pi m k_B T))^(3/2) e^(- beta (p_x^2 + p_y^2 + p_z^2) / (2 m)) dd(p_x, p_y, p_z)
$
如果用速度做变量，$v_x, v_y, v_z$是速度的三个分量
$
  p_k = m v_k, k = x, y, z
$
由此可得到在速度空间$dd(v_x, v_y, v_z)$范围内的分子数为
$
  N (m/(2 pi k_B T))^(3/2) e^(- 1/2 m (v_x^2 + v_y^2 + v_z^2) beta) dd(v_x, v_y, v_z)
$
设$n = N/V$为粒子数密度，则单位体积内，速度在$dd(v_x, v_y, v_z)$范围内的分子数为
$
  f(v_x, v_y, v_z) dd(v_x, v_y, v_z) = n (m/(2 pi k_B T))^(3/2) e^(- 1/2 m (v_x^2 + v_y^2 + v_z^2) beta) dd(v_x, v_y, v_z)
$
速度分布满足归一化条件
$
  integral f(v_x, v_y, v_z) dd(v_x, v_y, v_z) = n
$

- 速率的分布
  $
    integral dd(v_x, v_y, v_z) f(v_x, v_y, v_z) = integral dd(v) f(v)
  $
  所以可以写成
  $
    f(v) = 4 pi v^2 (m/(2 pi k_B T))^(3/2) e^(- 1/2 m v^2 beta)
  $
  - $4 pi v^2$是速度空间中半径为$v$的球壳面积因子
  - 所以速率的分布是有峰值的
- 最可几速率$v_m$
  $
    dv(f(v), v) = 0 => v_m = sqrt((2 k_B T) / m)
  $
  也就是最可能测量到的速率，也是速率分布的峰值位置
- 平均速率$overline(v)$
  $
    overline(v) = integral v f(v) dd(v) = sqrt((8 k_B T) / (pi m))
  $
- 方均根速率$v_"rms"$
  $
    v_"rms" = sqrt(overline(v^2)) = sqrt(integral v^2 f(v) dd(v)) = sqrt((3 k_B T) / m)
  $
  - 能量均分定理：每个自由度平均分配$1/2 k_B T$的能量，单原子分子有三个平动自由度，所以平均动能为$3/2 k_B T$，从而方均根速率为$v_"rms" = sqrt((3 k_B T) / m)$
- 有大小关系
  $
    v_m < overline(v) < v_"rms"
  $

对于#ch("H_2")，在$T=273$K，下$sqrt(overline(v^2)) = 10^3 "m/s"$

气体分子通过碰撞使气体达致平衡，考虑*气体分子碰壁数*，定义$Gamma$为单位时间内碰到单位面积器壁上的分子数。

考虑$vb(v) -> vb(v) + dd(vb(v))$的分子贡献$dd(Gamma)$，$dd(t)$内打到$dd(A)$上的分子数：
$
  dd(Gamma) dd(t) dd(A) & = f(vb(r), vb(v), t) dd(vb(v)) underbrace(v_x dd(t) dd(A), "柱体积") \
              dd(Gamma) & = f(vb(r), vb(v), t) dd(vb(v)) v_x
$
从而
$
  Gamma(vb(r), t) & = integral dd(vb(v)) v_x f(vb(r), vb(v), t) \
                  & = integral_0^oo dd(v_x) integral_(-oo)^oo dd(v_y) integral_(-oo)^oo dd(v_z) v_x f(vb(r), vb(v), t)
$
这对任意非平衡态也成立，对于平衡态，满足Maxwell分布
$
  f(vb(v)) = n (m/(2 pi k_B T))^(3/2) e^(- m (v_x^2 + v_y^2 + v_z^2)/(2 k_B T))
$
$
  Gamma &= n (m/(2 pi k_B T))^(3/2) integral_0^oo dd(v_x) integral_(-oo)^oo dd(v_y) integral_(-oo)^oo dd(v_z) v_x e^(- m (v_x^2 + v_y^2 + v_z^2)/(2 k_B T)) \
  & = n (m/(2 pi k_B T))^(1/2) integral_0^oo dd(v_x) v_x e^(- m/(2 k_B T) v_x^2) (m/(2 pi k_B T))^(1/2) integral_(-oo)^oo dd(v_y) e^(- m/(2 k_B T) v_y^2) (m/(2 pi k_B T))^(1/2) integral_(-oo)^oo dd(v_z) e^(- m/(2 k_B T) v_z^2) \
$
积分得到
$
  Gamma & = n ((k_B T) / (2 pi m))^(1/2) = 1/4 n overline(v)
$
其中
$
  overline(v) = integral_0^oo dd(v) v f(v) = sqrt((8 k_B T) / (pi m))
$
是平均速率。

例如#ch("N2")，1atm，$0℃$下
$
  n = p/(k_B T) = (1 times 760 times 133 "Pa")/(1.38 times 10^(-23) "J/K" times 273 "K") = 2.68 times 10^25 "m"^(-3)\
  overline(v) = sqrt((8 k_B T) / (pi m)) = sqrt((8 times 1.38 times 10^(-23) "J/K" times 273 "K") / (pi times 4.65 times 10^(-26) "kg")) = 4.53 times 10^2 "m/s"\
  Gamma = 1/4 n overline(v) tilde 3.03 times 10^27 "m"^(-2) "s"^(-1)
$

=== 内部运动

