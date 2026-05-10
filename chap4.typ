#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch

= Bose统计与Fermi统计

== 非简并条件与简并气

理想气体满足非简并条件
$
  e^alpha = 1/n ((2 pi m k_B T)/h^2)^(3/2) = 1/(n lambda_T^3) >> 1
$
其中
$
  lambda_T = h/sqrt(2 pi m k_B T)
$
是与$k_B T$对应的de Brogie波长
$
  k = (2pi)/lambda, p = hbar k, E = (hbar^2 k^2)/(2m) = (h/lambda)^2/(2m) tilde k_B T
$
粒子间距离为$(1/n)^(1/3)$，非简并条件等价于
$
  e^alpha = 1/(n lambda_T^3) >> 1
$
即
$
  (1/n)^(1/3) >> lambda_T = h/sqrt(2 pi m k_B T)
$
给出量子浓度(quantum concentration)
$
  n_Q = 1/lambda_T^3 = (2 pi m k_B T/h^2)^(3/2)
$
当原子之间的平均距离与热de Broglie波长相当时，气体便进入*简并态*。此时，*量子统计学*开始起作用。这时Bose统计和Fermi统计都被近似为半经典Boltzmann统计。

不满足非简并条件的气体称为*简并气*或*量子气*，当
$
  n lambda_T^3 < 1
$
时，非简并态，宏观量可对$n lambda_T^3$作展开
- 零次项：半经典
- 高次项：量子效应
而当
$
  n lambda_T^3 > 1
$
Bose气与Fermi气性质完全不同。

== Bose系统与Fermi系统的宏观量统计表达式

与前面的配分函数不同，Bose系统与Fermi系统的配分函数是*巨配分函数*$ln Xi$。

平衡分布为
$
  a_i = omega_i/(e^alpha e^(beta epsilon_i) plus.minus 1)
$
其中$-$对应Bose系统，$+$对应Fermi系统。定义巨配分函数
#definition(subname: [巨配分函数])[
  巨配分函数$Xi$定义为
  $
    Xi(alpha, beta, y) = product_i (1 plus.minus e^(- alpha - beta epsilon_i))^(plus.minus omega_i)
  $
  其中$-$对应Bose系统，$+$对应Fermi系统。有
  $
    Xi = product Xi_i
  $
]
其对数写为
$
  ln Xi = plus.minus sum_i omega_i ln (1 plus.minus e^(- alpha - beta epsilon_i))
$
可以看出*$ln Xi$是以$alpha, beta, y$为参量的特性函数*。

由此可以得到宏观量的统计表达式
- *粒子数*
  $
    N = sum_i a_i = sum_i omega_i/(e^(alpha + beta epsilon_i) plus.minus 1) = - pdv(ln Xi, alpha)
  $
- *能量*
  $
    U = sum_i a_i epsilon_i = sum_i (omega_i epsilon_i)/(e^(alpha + beta epsilon_i) plus.minus 1) = - pdv(ln Xi, beta)
  $
- *物态方程*
  $
    Y_k = sum_i a_i pdv(epsilon_i, y_k) = sum_i (omega_i pdv(epsilon_i, y_k))/(e^(alpha + beta epsilon_i) plus.minus 1) = - 1/beta pdv(ln Xi, y_k)
  $
- *熵*
  $
          dd(U) & = T dd(S) + sum_k Y_k dd(y_k) + mu dd(N) \
    ==> T dd(S) & = - dd(pdv(ln Xi, beta)) + 1/beta sum_k pdv(ln Xi, y_k) dd(y_k) - mu dd(N)
  $
  利用
  $
    dd(ln Xi) = pdv(ln Xi, alpha) dd(alpha) + pdv(ln Xi, beta) dd(beta) + sum_k pdv(ln Xi, y_k) dd(y_k)
  $
  就得到
  $
    T dd(S) = 1/beta dd((ln Xi - alpha pdv(ln Xi, alpha) - beta pdv(ln Xi, beta))) - (mu + alpha/beta) dd(N)
  $
  - 封闭系统$dd(N) = 0$
    $
      beta T dd(S) = dd((ln Xi - alpha pdv(ln Xi, alpha) - beta pdv(ln Xi, beta)))
    $
    由全微分关系得到
    $
      beta T = 1/k_B = "const"
    $
    积分得到
    $
      S - S' = k_B (ln Xi - alpha pdv(ln Xi, alpha) - beta pdv(ln Xi, beta))
    $
  - 开放系统$dd(N) != 0$
    $
      beta T dd(S) = dd((ln Xi - alpha pdv(ln Xi, alpha) - beta pdv(ln Xi, beta))) + (alpha/beta + mu) dd(N)
    $
    由全微分关系得到
    $
      beta T = 1/k_B = "const", alpha/beta + mu = 0 => alpha = mu/(k_B T)
    $
    积分得到
    $
      S - S' = k_B (ln Xi - alpha pdv(ln Xi, alpha) - beta pdv(ln Xi, beta)) + (alpha/beta + mu) N
    $
  其中$k_B$是Boltzmann常数。现在确定$S'$，由Boltzmann关系
  $
    S &= k_B ln Omega{a_i} = k_B sum_i (a_i ln(omega_i/a_i minus.plus) minus.plus omega_i ln(1 minus.plus a_i/omega_i))\
    &= k_B sum_i (a_i ln(alpha + beta epsilon_i) minus.plus omega_i ln(1 plus.minus e^(- alpha - beta epsilon_i)))\
    &= k_B (alpha sum_i a_i + beta sum_i a_i epsilon_i plus.minus sum_i omega_i ln(1 plus.minus e^(- alpha - beta epsilon_i))) = k_B (alpha N + beta E + ln Xi)\
    & = k_B (ln Xi - alpha pdv(ln Xi, alpha) - beta pdv(ln Xi, beta))
  $
  因此$S' = 0$。$S$是态函数，状态一定，其值完全确定，以上利用封闭系统得到

#note[
  $ln Xi$是以$alpha, beta, y$为参量的特性函数， 计算宏观量步骤: $epsilon_i , omega_i -> ln Xi ->$ 宏观量。但$mu$不可测，原则上可由$N = - pdv(ln Xi, alpha)$反解出$alpha(beta, y)$，得到用可测量表示的宏观量。
]

== 弱简并理想Bose气体和Fermi气体

在$n lambda_T^3 < 1$的条件下，气体处于弱简并状态。宏观量可对$n lambda_T^3$展开。此时，Bose气体和Fermi气体的性质与经典气体有显著差异。

例如单原子气体，只有平动，能量准连续。

先求巨配分函数
$
  ln Xi(alpha, beta, V) & = plus.minus integral_0^oo g(epsilon) dd(epsilon) ln(1 plus.minus e^(- alpha - beta epsilon))
$
其中利用半经典分布的态密度
$
  g(epsilon) dd(epsilon) = g_s (2 pi V)/h^3 (2 m)^(3/2) epsilon^(1/2) dd(epsilon)
$
有
$
  ln Xi(alpha, beta, V) = plus.minus C V integral_0^oo dd(epsilon) sqrt(epsilon) ln (1 plus.minus e^(- alpha - beta epsilon)), C = g_s (2 pi)/h^3 (2 m)^(3/2)
$
由于$e^(- alpha)< 1$，用展开式
$
  ln (1 plus.minus x) = plus.minus sum_(n = 1)^oo (minus.plus)^(n-1) (x^n)/n
$
从而
$
  integral_0^oo dd(epsilon) sqrt(epsilon) ln (1 plus.minus e^(- alpha - beta epsilon)) &= plus.minus sum_(n = 1)^oo (minus.plus)^(n-1) (e^(- n alpha))/n integral_0^oo dd(epsilon) sqrt(epsilon) e^(- n beta epsilon)\
  &= plus.minus sum_(n = 1)^oo (minus.plus)^(n-1) (e^(- n alpha))/n sqrt(pi/(n beta)) 1/(2 n beta)\
  &= plus.minus sqrt(pi/beta) 1/(2 beta) f(alpha)
$
其中
$
  f(alpha) = sum_(n = 1)^oo (minus.plus)^(n-1) (e^(- n alpha))/n^(5/2)
$
从而
$
  ln Xi(alpha, beta, V) = C V sqrt(pi/beta) beta^(-3/2) f(alpha) = ((2 pi m)/(beta h^2))^(3/2) V g_s f(alpha) = lambda_T^(-3) V g_s f(alpha)
$
#newpara()
*反解出$e^(-alpha)$*
$
  N = pdv(ln Xi, alpha) = -((2 pi m)/(beta h^2))^(3/2) V g_s f'(alpha)\
  f'(alpha) = - sum_(n = 1)^oo (minus.plus)^(n-1) (e^(- n alpha))/n^(3/2)
$
可由迭代法求出$e^(- alpha)$
$
  1/g_s n lambda_T^3 = sum_(n = 1)^oo (minus.plus)^(n-1) (e^(- n alpha))/n^(3/2) = e^(-alpha) (1 minus.plus 2^(-3/2) e^(- alpha) + ...)
$
$
  e^(- alpha) = 1/g_s n lambda_T^3 (1 plus.minus 2^(-3/2) 1/g_s n lambda_T^3 + ...)
$
从而
$
  alpha = - ln (n lambda_T^3)/g_s minus.plus 2^(-3/2) (n lambda_T^3)/g_s + ...
$
从而
$
  f(alpha) = e^(-alpha) (1 minus.plus 1/2^(5/2) e^(- alpha) + ...) = 1/g_s n lambda_T^3 (1 plus.minus 1/2^(5/2) 1/g_s n lambda_T^3 + ...)
$
#newpara()
进一步可以求解*宏观量*
$
  U &= - pdv(ln Xi, beta) = - ln Xi pdv(ln ln Xi, beta) = 3/2 (ln Xi)/beta = 3/2 n k_B (1 + plus.minus 2^(-5/2) 1/g_s n lambda_T^3 + ...)
$
我们说$1$是半经典近似，$2^(-5/2) 1/g_s n lambda_T^3$是量子修正项。

以及热容
$
  C_V & = (pdv(U, T))_V = 3/2 n k_B (1 + plus.minus 2^(-7/2) 1/g_s n lambda_T^3 + ...)
$
与物态方程
$
  p = 1/beta pdv(ln Xi, V) = (ln Xi)/(beta V) = 2/3 U/V = (N k_B T)/V (1 + plus.minus 2^(-5/2) 1/g_s n lambda_T^3 + ...)
$
其中用到了
$
  ln Xi prop V, ln Xi = 2/3 U beta
$
以及熵
$
  S & = k_B (ln Xi - alpha pdv(ln Xi, alpha) - beta pdv(ln Xi, beta)) = k_B (5/3 beta U + N alpha) \
    & = N k_B ((ln g_s/(n lambda_T^3) + 5/2) plus.minus 2^(-7/2) 1/g_s n lambda_T^3 + ...)
$
#newpara()
- 对于半经典修正和量子修正
  - $(n lambda_T^3)^0$是半经典近似
  - $(n lambda_T^3)^1$是一级量子修正
  其中$lambda_T prop 1/sqrt(m T)$，如果$T$较低或者$m$较小$n$较大，则量子修正较大。
- Fermi气的$E,P,S$比半经典的大；而Bose气的$E,P,S$比半经典的小
  - 由于Pauli不相容，两个Fermion不能占据同一个量子态，相斥；对应波函数是反对称的。
  - Boson可以占据同一个量子态，相吸；对应波函数是对称的。

$
    U & = 3/2 n k_B T (1 + plus.minus 2^(-5/2) 1/g_s n lambda_T^3 + ...) \
  C_V & = 3/2 n k_B (1 + minus.plus 2^(-7/2) 1/g_s n lambda_T^3 + ...) \
    p & = (N k_B T)/V (1 + plus.minus 2^(-5/2) 1/g_s n lambda_T^3 + ...) \
    S & = N k_B ((ln g_s/(n lambda_T^3) + 5/2) plus.minus 2^(-7/2) 1/g_s n lambda_T^3 + ...)
$

Bose分布的奇异性会导致*Bose-Einstein凝聚*。

== Bose-Einstein凝聚

1924年 Bose 用一种新的数态方法重新导出 Planck 黑体辐射公式。Einstein 认为这个方法很重要，把它推广到实物粒子，于是在 1924–1925 年建立了 Bose-Einstein 统计，并预言了后来被称为 Bose-Einstein condensation, BEC 的现象。

Bose 本人主要处理的是光子气体，真正把这种统计推广到有质量粒子并预言凝聚的是 Einstein。

理论预言很早，但真正实验实现很晚。1995 年，稀薄碱金属原子气体中实现了 BEC，比如 Rb、Na、Li 等。2001 年 Nobel 物理奖授予 Cornell、Wieman、Ketterle，表彰他们在稀薄碱金属气体 BEC 方面的工作。

要同时做到：$T$足够低，$n$足够大，$n lambda_T^3 > 1$，才能观察到 BEC。但密度太高又容易液化或发生非弹性碰撞，所以实验上要靠激光冷却、蒸发冷却等技术。

BEC的直观图像：高温时，粒子像经典小球，各自运动，热波长很短；降温后，热de Broglie波长变长，粒子越来越像“波包”；当
$
  lambda_T tilde d tilde n^(-1/3)
$
即当热 de Broglie 波长与平均粒子间距相当或更大时，波包开始重叠，系统进入量子简并区；继续降温，许多玻色子会占据同一个最低能态，形成一个宏观量级的量子态。

讨论$n lambda_T^3 ~ 1$的简并Bose气体，热de Broglie波长为
$
  lambda_T = (h^2/(2 pi m k_B T))^(1/2)
$
量子密度为
$
  n_Q = 1/lambda_T^3 = ((m k_B T)/(2 pi hbar^2))^(3/2)
$
简并温度为
$
  T_"deg" = (2 pi hbar^2)/(m k_B) n^(2/3)
$
也就是说温度低到使粒子的热波长和平均间距同量级时，量子统计效应变得重要。

下面我们考虑简并Bose气体。

=== Bose气体的化学势

考虑到
$
  alpha = mu/(k_B T) = beta mu
$
有
$
  a_i = omega_i/(e^(beta (epsilon_i - mu)) - 1)
$
为了保证平均占有数非负且有限，分母必须大于零
$
  e^(beta (epsilon_i - mu)) - 1 >= 0 => mu <= epsilon_i
$
若把基态能量取为
$
  epsilon_0 = 0
$
则必须有
$
  mu <= 0
$
$
  N = sum a_i = sum_i omega_i/(e^(beta (epsilon_i - mu)) - 1)
$
对于Bose气体，随着温度降低，为了保持总粒子数$N$不变，化学势$mu$会逐渐升高，但它不能超过$0$。当$T$降到某个临界温度$T_c$时，
$
  mu -> 0^-
$
这就是BEC发生的前兆。

下面求在$mu -> 0$时，所有激发态最多能容纳多少粒子。如果总粒子数超过激发态能容纳的最大数，多出来的粒子只能进入基态，于是发生凝聚。对于三维自由粒子，单粒子能量为
$
  epsilon = p^2/(2m)
$
能态密度满足
$
  g(epsilon) = C V sqrt(epsilon), C = g_s (2 pi)/h^3 (2 m)^(3/2)
$
有粒子数为
$
  N & = integral_0^oo dd(epsilon) g(epsilon)/(e^(alpha + beta epsilon) - 1) \
    & = C V integral_0^oo sqrt(epsilon) dd(epsilon) 1/(e^(alpha + beta epsilon) - 1) \
$
在BEC发生时，$alpha -> 0$，有
$
  N & = C V integral_0^oo sqrt(epsilon) dd(epsilon) 1/(e^(epsilon/(k_B T_c)) - 1) \
    & = C V (k_B T_c)^(3/2) integral_0^oo sqrt(x)/(e^x - 1) dd(x)
$
其中
$
  I(n) = integral_0^oo x^(n-1)/(e^x - 1) dd(x) = Gamma(n) zeta(n)
$
这里
$
  Gamma(n) = integral_0^oo x^(n-1) e^(-x) dd(x)\
  zeta(n) = sum_(k = 1)^oo 1/k^n = product_p (1 - p^(-n))^(-1)
$
则有
$
  N & = C V (k_B T_c)^(3/2) Gamma(3/2) zeta(3/2) \
    & = C V (k_B T_c)^(3/2) sqrt(pi)/2 times 2.612 \
$
得到
$
  T_c = h^2/(2 pi m k_B) ((N/V)/(g_s zeta(3/2)))^(2/3)
$

=== Bose-Einstein凝聚

$T -> T_c$时$mu->0$，$epsilon_0 = 0$上的粒子数显著增加；另一方面，准连续近似时，$g(epsilon) prop epsilon^(1/2)$是忽略了$ε = 0$态。故：
$
  N = N_(epsilon = 0) + N_(epsilon > 0), T<T_c
$
其中
$
  N_(epsilon > 0) = C V (k_B T)^(3/2) Gamma(3/2) zeta(3/2) (n lambda_T^3)/g_s = N (T/T_c)^(3/2)
$
就有
$
  N_(epsilon = 0) = N - N_(epsilon > 0) = N (1 - (T/T_c)^(3/2))
$

#figure(
  image("pic/2026-05-10-16-18-10.png", width: 30%),
  caption: [$mu/(k_B T_c)$-$T/T_c$的关系],
)

它说明：
- $T = T_c$时，$N_0 = 0$开始凝聚
- $T < T_c$时，$N_0$迅速增加，趋近于$N$，即大部分粒子凝聚到基态
- $T -> 0$时，$N_0 -> N$，所有粒子都凝聚到基态
即越来越多的粒子处基态，称Bose-Einstein凝聚。

因为
$
  epsilon = 0 <=> abs(vb(p)) = 0
$
所以不是普通意义上气体变液体的空间凝聚，而是大量粒子进入同一个动量态；可看成是动量空间的凝聚。

#figure(
  image("pic/2026-05-10-16-21-20.png", width: 60%),
  caption: [凝聚分数图像],
)

#figure(
  stack(dir: ltr)[
    #figure(
      image("pic/2026-05-10-16-22-11.png", width: 30%),
      numbering: none,
    )
  ][
    #figure(
      image("pic/2026-05-10-16-22-19.png", width: 30%),
      numbering: none,
    )
  ],
  caption: [Rb-87 原子的 Bose-Einstein 凝聚实验图像],
)
Rb-87原子的Bose-Einstein凝聚实验图像。温度降低到$T_c$附近时，动量分布中心出现尖峰。这说明大量原子具有非常接近零的动量，即进入同一个低能量量子态。

=== 凝聚后的宏观性质

- $epsilon = 0$粒子的贡献
  - $epsilon = 0 => U=0, p=0$
  - $
      G = N mu = U + p V - S T = 0
    $
  则有
  $
    S = 1/T (U + p V - N mu) = 0
  $
  - $epsilon=0$态对$U, p, S$无贡献，系统的内能、压强、熵、热容等宏观量，主要由激发态粒子贡献
  - $epsilon=0$处粒子起粒子源作用，使得化学势$mu$保持在$0$，从而使得激发态的粒子数保持在$N (T/T_c)^(3/2)$，即使温度继续降低，激发态粒子数也不会减少
- $epsilon > 0$粒子的贡献
  Bose 气体的巨配分函数为：
  $
    ln Xi & = - sum_i omega_i ln (1 - e^(- alpha - beta epsilon_i)) \
          & = - C V integral_0^oo sqrt(epsilon) dd(epsilon) ln (1 - e^(- alpha - beta epsilon)) \
          & = - C V integral_0^oo sqrt(epsilon) dd(epsilon) ln (1 - e^(- beta epsilon)) \
          & = 2/3 C V beta integral dd(epsilon) epsilon^(3/2) dd(epsilon) 1/(e^(beta epsilon) - 1) \
          & = 2/3 C V beta^(-3/2) Gamma(5/2) zeta(5/2) \
          & = 2/3 C V (k_B T)^(3/2) (3 sqrt(pi))/4 times 1.341
  $
  则有
  $
    U & = - pdv(ln Xi, beta) = C V beta^(-5/2) (3 sqrt(pi))/4 times 1.341 prop m^(3/2) g_s V T^(5/2) \
  $
  $
    p = 1/beta pdv(ln Xi, V) = 2/3 C beta^(-5/2) (3 sqrt(pi))/4 times 1.341 prop m^(3/2) g_s T^(5/2)
  $
  #figure(
    stack(dir: ltr)[
      #figure(
        image("pic/2026-05-10-17-22-50.png", width: 30%),
        numbering: none,
      )
    ][
      #figure(
        image("pic/2026-05-10-17-23-13.png", width: 30%),
        numbering: none,
      )
    ],
    caption: [$E, p V$-$T$的关系图像],
  )
  $
    S = k_B (ln Xi + alpha N + beta U) = 5/3 k_B C V beta^(-3/2) (3 sqrt(pi))/4 times 1.341 prop m^(3/2) g_s V T^(3/2)
  $
  $
    C_V = (pdv(U, T))_V = 5/2 k_B C V beta^(-3/2) (3 sqrt(pi))/4 times 1.341 = 1.926 N k_B (T/T_c)^(3/2)
  $
  它说明 BEC 凝聚相低温热容不是经典理想气体的常数，而是随温度降低而降低的函数，且在$T=0$时趋近于零。这是因为随着温度降低，越来越多的粒子进入基态，激发态粒子数减少，系统的热容也随之减少

关于BEC的讨论：
- 当$T -> 0$时，$U, p, S$都趋于零
- $C_V$
  - 在$T < T_c$时
    $
      C_V = 1.926 N k_B (T/T_c)^(3/2)
    $
    所以从$T=0$开始，热容按$T^(3/2)$增加。
  - 在$T > T_c$时，热容接近经典理想气体的常数$3/2 N k_B$，但随着温度降低，热容会逐渐增加，在$T=T_c$时达到峰值，然后在$T < T_c$时迅速下降。
    #figure(
      image("pic/2026-05-10-17-29-50.png", width: 60%),
      caption: [热容$C_V$-$T$的关系图像],
    )
- $p-V$
  #figure(
    image("pic/2026-05-10-17-30-50.png", width: 60%),
    caption: [物态方程图像],
  )
  - 对于普通经典理想气体，半经典极限$p prop 1/(V T)$
  - 对于BEC凝聚相，$p prop T^(5/2)$，与体积无关
    - 因为凝聚相中的压强来自激发态粒子，而不是基态粒子
    - 固定$T$时，激发态能容纳的粒子数已经达到饱和，继续压缩系统时，额外的粒子不是增加激发态压强，而是进入基态
- $V_c$
  - 前面我们是固定体积$V$，降低温度，得到临界温度$T_c$
  - 现在也可以反过来：固定温度$T$，降低体积$V$，得到临界体积$V_c$
    $
      N = C V integral_0^oo sqrt(epsilon) dd(epsilon) 1/(e^(beta (epsilon - mu)) - 1)
    $
    $N, beta$固定，$V$减小时，$mu$逐渐升高，直到$mu -> 0$时达到临界体积$V_c$，此时
    $
      T = h^2/(2 pi m k_B) ((N/V_c)/(g_s zeta(3/2)))^(2/3)
    $
    也就是说当体积减小到$V_c$
    $
      V_c = N/(g_s zeta(3/2)) (h^2/(2 pi m k_B T))^(3/2) = N/(g_s zeta(3/2)) lambda_T^3
    $
    继续压缩系统时，$mu$无法再升高，$V < V_c$时，额外的粒子只能进入基态，形成凝聚相
  - $T -> oo$时，$V_c -> 0$，系统总是处于非简并态，无法发生凝聚
  - $V-> oo$时，$T_c -> 0$，低温时即使体积较大，也容易满足凝聚条件

#note(subname: [Einstein 的困惑])[
  气体凝聚成液体需要依靠分子之间的相互作用力。对理想气体，粒子之间的相互作用已被忽略，如何发生凝聚？
]

由于历史条件，当时还不知道全同多粒子系存在（量子起源的）*统计关联*：对bosons是有效吸引；而fermions是有效排斥。因此，即使没有动力学相互作用，仍可在一定条件下由于有效相互作用而发生凝聚现象。这是一种*纯粹量子起源的相变*。

实现BEC极困难。原则上，要将气体冷到使
$
  lambda_T >= overline(d)
$
但大多数情况下，在远高于BEC的到达以前，已发生液化甚至固化的相变。为了实现原子气体的BEC，必须用极稀薄的气体，且要求二体弹性碰撞的弛予时间远小于形成分子或原子集团的非弹性碰撞的弛予时间。对于碱金属原子气体
$
  tau_"elastic" << tau_"inelastic"
$
$tau_"elastic" approx 10 "ms", tau_"inelastic" approx 1 "s"$。因此，碱金属原子气体是实现BEC的理想系统。

Fermion不能直接像Boson全部凝聚到同一个单粒子态，因为它们受到 Pauli 不相容原理限制。但是两个Fermion可以配对。一个Fermion对的总自旋可以是整数，因此这个“对”整体可以看作Boson，进而发生Bose-Einstein凝聚。这就是超导和超流现象的微观机制。
- BEC 极限
  - 两个Fermion强配对成一个紧束缚的分子，这个分子作为一个Boson发生凝聚
- BCS 极限
  - 两个费米子之间吸引较弱，不形成紧束缚分子，而是形成Cooper pair，这就是超导理论中的 BCS 配对机制
- BEC-BCS crossover 研究的是：从紧束缚分子 BEC 到松散 Cooper 对 BCS 态之间，是否可以连续过渡；实验上可以通过 Feshbach 共振调节相互作用强度

Feshbach共振的核心作用是：用外磁场调节原子间散射长度$a$。散射长度$a$描述低能碰撞中相互作用的强弱和性质。一般来说：$a>0$对应有效吸引足够强，可以形成束缚分子态；$a<0$对应没有真正束缚分子，但仍可能形成Cooper对。

在Feshbach共振附近，散射长度可以变得非常大，甚至从正无穷跳到负无穷。实验上通过调节磁场$B$，让一个闭合通道中的束缚态能量接近开放通道的散射态能量。两者发生耦合，导致散射性质强烈改变。

#figure(
  image("pic/2026-05-10-18-02-18.png", width: 80%),
  caption: [Feshbach共振示意图],
)
- 从分子 BEC 到简并 Fermi 气体
  - #ch("^6 Li")是Fermion，但两个#ch("^6 Li")原子可以形成分子，这个分子由两个Fermion组成，是一个Boson，可以发生Bose-Einstein凝聚
  - 实验通过缓慢跨越Feshbach共振，使系统从分子BEC一侧连续转到Fermi气体一侧
  - 如果这个过程是绝热且平滑的，就说明 BEC 和 BCS 之间没有明显的热力学相变，而是一个连续crossover
  - 这对理解超流、超导、强关联费米气体非常重要
- 旋转 Bose-Einstein 凝聚体中的涡旋晶格
  - 当普通经典流体旋转时，可以像刚体一样整体旋转。
  - 但是超流体不一样。BEC 是宏观量子态，其速度场满足量子化条件，不能任意旋转。旋转超流体时，它会形成量子涡旋。
  - 当旋转速度增加，涡旋数量变多，并排列成规则的三角晶格，也叫 Abrikosov vortex lattice。
  - 这说明 BEC 具有：宏观相干性；超流性质；量子化环流；类似超导体中磁通涡旋晶格的行为。

=== 液态#ch("^4 He")与超流

#ch("^4 He")原子总自旋为整数，通常看作$S=0$的Boson。

它在2.17K时发生液化，在2.17K以下发生超流转变，形成一个宏观量级的量子态。
- $T > T_c = 2.17 "K"$
  - 正常液体 液He I
- $T < T_c$
  - 超流体 液He II
  - 流动性极强，导热率极大

#figure(
  image("pic/2026-05-10-18-16-24.png", width: 40%),
  caption: [#ch("^4 He")的相图],
)

液态#ch("^4 He")的热容图在$T_c$处有一个$lambda$型的尖峰，所以这个相变叫$lambda$相变；这个热容峰说明在$T_c$附近，体系的热涨落非常强，是连续相变的重要特征。

液态#ch("^4 He")的超流转变和理想Bose气体的BEC有联系，但不是完全一样。理想 Bose气体的BEC是无相互作用Boson的动量空间凝聚；液态#ch("^4 He")是强相互作用量子液体，它的超流性不能只靠理想BEC公式完全描述。

超流氦的*喷泉效应*或热机械效应是：一个小容器通过很细的通道或多孔介质与外部液氦相连。当对容器内部加热时，超流组分会向热的一侧流动，导致容器内压力升高，液氦从细管中喷出，形成喷泉。

这个现象在普通液体里很难出现，但在超流氦中可以出现，因为超流氦不是一个普通单一流体，而是可以分成：
$
  rho = rho_"normal" + rho_"super"
$
喷泉效应是两流体模型的重要实验表现之一。

如果直接旋转或搅拌超流体：一方面，体系如果被旋转或搅拌，需要获得角动量；另一方面，超流体有一个特殊性质：它的速度场通常是无旋的。超流速度可以写成相位梯度：
$
  vb(v)_s = hbar/m grad phi
$
所以一般有：
$
  curl vb(v)_s = 0
$
这说明超流体不能像普通液体一样做刚体旋转。超流体通过*量子涡旋*携带角动量，在涡旋中心，相位奇异，环流量子化：
$
  integral.cont vb(v)_s dot dd(vb(l)) = n h/m
$
所以超流体被旋转时，不是整体连续旋转，而是出现一根根量子化涡旋；旋转越强，涡旋越多，最后会形成涡旋晶格。

#figure(
  image("pic/2026-05-10-18-34-06.png", width: 80%),
  caption: [#ch("^3 He")的相图],
)

因为在极低温下，两个#ch("^3 He")原子可以配对，形成类似 Cooper pair 的Fermion对。一个“对”整体是Boson，可以发生Bose-Einstein凝聚，形成超流态。这和超导中的 BCS 配对很类似。#ch("^3 He")超流相出现在非常低的温度，大约是毫开尔文量级，比#ch("^4 He")的超流转变温度低得多。

Landau两流体模型
$
  rho = rho_"normal" + rho_"super"
$
低温液态#ch("^4 He")不是简单地看成一种普通液体，而是看成两部分叠加：
- 正常组分，具有黏滞性，携带熵和热量
- 超流组分，无黏滞性，不携带熵，可以无摩擦流动
随着温度变化，两部分比例不同:
- $T -> 0$时，$rho_"super" -> rho$，系统几乎完全是超流态
- $T -> T_c$时，$rho_"super" -> 0$，系统几乎完全是正常态

$lambda$相变和理想 Bose 气体的 BEC 有相似性，但不能完全等同
- 热容峰不同
  - 理想 Bose 气体的 BEC 中，热容在$T_c$处有一个有限的跳跃，但没有真正的尖峰
  - 液态#ch("^4 He")的$lambda$相变中，热容在$T_c$处有一个真正的尖峰，理想情况下接近发散
- 临界温度
  - 理想 Bose 气体的 BEC 临界温度 $T_c = 3.31 "K"$
  - 液态#ch("^4 He")的$lambda$相变临界温度 $T_c = 2.17 "K"$
- 体系不同
  - 理想 Bose 气体是无相互作用的量子气体，发生的是动量空间的凝聚
  - 液态#ch("^4 He")是强相互作用的量子液体，发生的是空间上的凝聚

== 光子气体
