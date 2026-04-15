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
