#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch

= 近独立粒子系统的统计分布


- 热力学：唯象理论，建立宏观量之间关系及唯象定律
- 统计物理：由宏观系统的组元的动力学研究宏观性质

本章研究的是：粒子间作用微弱的系统处于平衡态时的分布。

*近独立粒子*是相互作用足够弱，或者在某种近似下，可以把体系看成“每个粒子的状态大体独立”然后再去统计整体分布的粒子系统。后面的Maxwell-Boltzmann分布、Bose-Einstein分布、Fermi-Dirac分布都是近独立粒子系统的统计分布。

*平衡态*前面已经定义，是系统的宏观性质不随时间变化的状态。虽然系统处于平衡态，微观态却仍在不断变化，统计物理研究这时各种可能微观状态是如何分布的。

统计物理进一步回答：
- 为什么会有温度、压强、熵这些宏观量？
- 这些量为什么满足热力学定律？
- 这些宏观量能不能从粒子的运动和状态数出发推出来？

== 统计法大意

=== 力学规律与统计规律

单粒子的力学规律是决定论的
- 量子力学：Schrödinger 方程
- 经典力学：正则方程或 Newton II
在某一时刻完全知道系统的初始条件，那么原则上它以后的演化就由方程唯一决定。

#note[
  #set quote(block: true)
  #quote(attribution: [Laplace])[
    一个伟大的智者，只要能够把一切可以考虑的初始条件、自变量与边界条件都通过数据代入一个无所不包的世界方程，那么，无论宇宙间最庞大的物体的运动还是最轻微的原子的运动都没有什么不可确定的，因为将来的一切甚至好像过去的一样永远展现在智者眼前。
  ]
  #quote(attribution: [Einstein])[
    上帝不会掷骰子。
  ]
]
#newpara()

宏观系统统计规律是非决定论的，几率性的。用*宏观量*指定的*宏观状态对应大量不同的微观状态*。因此，微观方程是确定的，宏观层面我们也几乎不可能追踪每一个粒子的详细运动，只能用统计方法来描述系统的行为。

单个粒子的力学方程，通常都具有某种时间反演对称性；但宏观世界中我们看到的很多过程却是明显*不可逆*的。系统趋向于从一个“很特殊、很不均匀”的状态，演化到一个“很普通、很均匀”的状态。

以墨水扩散在水中为例。从统计角度看，“均匀混合”之所以会出现，是因为对应“均匀混合”这一宏观状态的微观状态数，远远多于“染料集中在一小团”对应的微观状态数。

一个离散化的直觉图景是：假设把容器分成很多小格，染料分子可以落在任何格子里。若要求“染料全挤在左边一小块”，满足这个条件的微观排法很少；若只要求“总体上均匀分布”，满足条件的排法极多。因此，高概率宏观态对应的微观实现方式更多，所以系统更可能处于高概率态。

而其不可逆性就在于，系统的特殊状态它对应的微观状态数太少，概率极低，对宏观系统来说几乎不发生。

=== 宏观量的统计性质

两种宏观量：
- *有微观对应*(如$U$)：为微观对应量的统计平均值
  - 如果系统的微观状态记作$r$，每个微观状态对应能量$E_r$，系统处于微观状态$r$的概率为$p_r$，那么系统的平均能量$U$可以表示为
    $
      U = sum_r p_r E_r
    $
- *无微观对应*(如$p, T, S$等)：通过热力学与有微观对应的宏观量相关
  - 这些量是整个体系的集体性质，需要通过热力学定义或统计定义得到

宏观量的测量在宏观小(以得到逐点值)微观大(使统计平均稳定)的空间、时间内进行。宏观量之所以稳定，不是因为微观不波动，而是因为参与平均的自由度太多。

时间平均和系综平均等价性是统计物理的一个重要假设。它认为，在平衡态下，系统的时间平均行为与在同一宏观状态下的所有可能微观状态的平均行为是相同的。这使得我们可以通过统计方法来计算宏观量，而不必追踪系统随时间的演化。
$
  macron(A)^"time" = expval(A)^"ensemble"
$

=== 概率基础知识

==== 几率概念

*随机事件*：可能发生，也可能不发生

*频率*：在大量重复试验中，某事件发生的次数与试验总次数之比。频率是一个经验概念，随着试验次数增加，频率趋近于一个固定值。

*概率*：一个理论概念，表示某事件发生的可能性大小。概率是一个数值，取值范围在0到1之间，满足概率公理。
$
  P_A = lim_(N -> oo) N_A / N
$
考虑一个连续的实验，在$x$和$x + dd(x)$之间的值出现的几率为
$
  P(x) dd(x)
$

==== 互斥事件几率的加法定理

互斥事件的概率满足加法定理
$
  P_(A+B) = lim_(N -> oo) (N_A + N_B) / N = P_A + P_B
$
离散概率与连续概率都必须归一化
$
  sum_j P_j = 1, integral P(x) dd(x) = 1
$

==== 独立事件几率的乘法定理

若事件$A$和事件$B$相互独立，则它们同时发生的概率满足乘法定理
$
  P_(A B) = lim_(N -> oo) N_(A B) / N = lim_(N -> oo) N_A / N (N_(A B)) / N_A = P_A P_B
$

==== 条件概率

事件$A$在事件$B$发生的条件下发生的概率为
$
  P(A|B) = (P(A inter B)) / P(B)
$

==== 联合概率分布与边缘分布

联合概率分布$rho(x, y)$描述了两个随机变量$x$和$y$的同时分布情况
$
  rho(x, y) >= 0, integral rho(x, y) dd(x, y) = 1
$
边缘分布$rho(x)$和$rho(y)$则分别描述了$x$和$y$的单独分布情况
$
  rho(x) dd(x) = dd(x) integral rho(x, y) dd(y)\
  rho(y) dd(y) = dd(y) integral rho(x, y) dd(x)
$
在$x,y$独立的情况下，联合分布可以表示为边缘分布的乘积
$
  rho(x, y) = rho(x) rho(y)
$

==== 统计平均值和涨落

统计平均值是随机变量的期望值，表示在大量重复试验中该变量的平均结果
$
  overline(x) = lim_(N -> oo) (sum_i x_i N_i) / N = sum_i x_i P_i
$
$
  overline(x) = integral x p(x) dd(x)
$
涨落是随机变量偏离其平均值的程度，通常用方差来衡量。绝对涨落定义为
$
  Delta overline(x) = sqrt(overline((x - overline(x))^2)) = sqrt(overline(x^2) - overline(x)^2)
$
相对涨落定义为
$
  delta overline(x) = (Delta overline(x)) / overline(x)
$
对宏观系统，虽然绝对涨落不一定小，但相对涨落通常极小，所以宏观量看起来非常稳定。

==== 二项分布

二项分布描述了在$N$次独立试验中，事件$A$发生$n$次的概率
$
  P(n) = binom(N, n) p^n (1-p)^(N-n)
$

#example(subname: [无规行走])[
  考虑一个粒子在一维空间中的无规行走。每一步粒子以概率$p$向右移动，以概率$1-p$向左移动。经过$N$步后，粒子的位置$x$可以表示为
  $
    x = N_R - N_L
  $
  其中$N_R$和$N_L$分别是向右和向左移动的步数，有
  $
    N_R + N_L = N
  $
  给定$N_1$和$N_2$，粒子位置为$x = N_1 - N_2$的概率为
  $
    P(x) = P(N_R = (N + x) / 2, N_L = (N - x) / 2) = binom(N, (N + x) / 2) p^((N + x) / 2) (1-p)^((N - x) / 2)
  $
  这是一个标准的二项分布，描述了粒子位置的概率分布情况。
]

==== Poisson分布

当事件发生的平均次数$N >> 1$，且每次事件发生的概率$p << 1$时，二项分布可以近似为Poisson分布
$
  P_N (n) = N!/(n! (N-n)!) p^n (1-p)^(N-n) approx (N p)^n / n! e^(-N p) = lambda^n / n! e^(-lambda)
$
是“机会很多，但每次发生概率都很小”的典型场景，其中
$
  lambda = N p
$

==== Gaussian分布

当事件发生的平均次数$N >> 1$，且每次事件发生的概率$p$不太接近0或1时，二项分布可以近似为Gaussian分布。

二项分布在某一大$tilde(n)$处有极大
$
  dv(ln p_N (n), n) = 0
$
二项分布
$
  ln p_N (n) = ln N! - ln n! - ln (N-n)! + n ln p + (N-n) ln (1-p)
$
当$n>>1$有
$
  dv(ln n!, n) approx ln n
$
因此
$
  dv(ln p_N (n), n) = -ln n + ln (N-n) + ln p - ln (1-p) = 0
$
解出
$
  tilde(n) = N p = overline(n)
$
是二项分布的极值点。在极值点展开：
$
  ln p_N (n) = ln p_N (overline(n)) - (n - overline(n))^2 / (2 N p (1-p)) + ...
$
得到Gaussian分布
$
  p_N (n) approx p_N (overline(n)) exp(-(n - overline(n))^2 / (2 N p (1-p))) = 1 / sqrt(2 pi N p (1-p)) exp(-(n - overline(n))^2 / (2 N p (1-p)))
$
也就是
$
  P(x) = 1 / sqrt(2 pi sigma^2) exp(-(x - mu)^2 / (2 sigma^2))
$
其中
$
  mu = overline(n) = N p, sigma^2 = N p (1-p)
$

#example(subname: [Gaussian积分])[
  求积分
  $
    I = integral_(-oo)^oo dd(x) e^(-1/2 a x^2)
  $
  #newpara()
  利用极坐标解决
  $
    I^2 &= integral_(-oo)^oo dd(x) integral_(-oo)^oo dd(y) e^(-1/2 a (x^2 + y^2)) = integral_0^(2 pi) dd(theta) integral_0^oo r dd(r) e^(-1/2 a r^2) = 2 pi integral_0^oo r dd(r) e^(-1/2 a r^2)\
    &= 2 pi integral_0^oo dd(r^2) e^(-1/2 a r^2) = pi integral_0^oo dd(t) e^(-1/2 a t) = (2 pi) / a
  $
  从而Gaussian积分结果为
  $
    integral_(-oo)^oo dd(x) e^(-1/2 a x^2) = sqrt((2 pi) / a) = sqrt(2 pi) e^(-1/2 ln a)
  $
  和Gaussian分布的归一化常数对比
  $
    1 / sqrt(2 pi sigma^2) = sqrt(2 pi) e^(-1/2 ln sigma^2)
  $
]

#newpara()

回到统计力学我们讨论
#note[
  盒中原子的分布，为什么平衡态几乎必然出现？
]
#newpara()

我们考虑$N$个原子在$n$处上半部，$N-n$处下半部的几率
$
  P(n) = binom(N, n) (1/2)^N
$
所有$N$个原子处上半部的几率
$
  P(N) = binom(N, N) (1/2)^N = (1/2)^N
$
和Avagadro数级别的$N_A = 6.022 times 10^23$相比，这个几率是极其微小的。设想原子随机运动，等多长时间，能有原子跑到一边？原子到另一边一次的时间$1/3 times 10^(-8)$s约为$10^(-16)$年。合理的等待时间为
$
  10^(3 times 10^22)/10^16 = 10^(3 times 10^22 - 16) = 10^(3 times 10^22)"年"
$
这比太阳系的寿命还要长得多，因此我们几乎不可能看到所有原子都挤在一边的情况，平衡态几乎必然出现。

== 近独立粒子系统

#definition(subname: [近独立粒子系统])[
  平均意义下，*粒子间作用能$<<$单个粒子能量*的系统，或者在某种近似下可以把体系看成“每个粒子的状态大体独立”然后再去统计整体分布的粒子系统。
]
相互作用要足够弱，这样才能近似看成独立粒子；但又要不为零，这样系统才能实现热化和平衡。这正是很多气体、电子气、声子系统、光子系统能做统计分布的基础。

*“粒子”到底指什么？*
- 真实粒子
  - 分子，原子，电子，原子核
  - 这些都是真实存在的微观客体
  - 未被激发的自由度（冻结自由度）不用考虑，因为对宏观量无贡献；通常到原子层次即可
    - 在很多温度范围内，并不是粒子内部所有自由度都活：例如某些振动、电子激发态如果根本没被热激发出来，那它们对热容、能量分布就几乎没贡献，可以先忽略。这叫*冻结自由度*。
- 准粒子
  - 声子，旋子等
  - 虚拟的、物理模型中的对象，但单粒子态有明确含义
  - 声子
    - 晶体里真正运动的是大量原子，但集体振动模式可以等效成“声子”：有能量，有动量，能被计数，能服从某种统计分布
只要系统可以分解成一组明确的单粒子态或单模态，占据数方法就能用。

*独立*意味着单粒子态有明确含义。例如系统能量
$
  E = sum_i a_i epsilon_i
$
其中$epsilon_i$是单粒子态$i$的能量，$a_i$是占据数。每个单粒子态的能量不受其他粒子占据情况的影响，这就是近独立粒子系统的核心特征。这种视角下，系统的微观状态可以用占据数的集合来描述，而不需要考虑粒子之间复杂的相互作用。

下面我们会介绍三种重要的近独立粒子系统的统计分布：*Maxwell-Boltzmann分布*、*Bose-Einstein分布*和*Fermi-Dirac分布*。这些分布分别适用于经典粒子、Bosion和Fermion系统，反映了不同类型粒子在平衡态下的统计行为。

== 单粒子状态的量子描述

如果系统由很多“近独立粒子”组成，那首先得知道：一个粒子自己可以处在什么量子态上？它的能量取什么值？

回顾量子力学中对单粒子状态的描述。对于一个粒子，量子力学里它的状态由波函数$psi(vb(x), t)$描述，满足Schrödinger方程
$
  i hbar pdv(psi, t) = hat(H) psi
$
对于定态波函数
$
  psi(vb(x), t) = phi(vb(x)) e^((i epsilon t) / hbar)
$
其中$phi(vb(x))$满足定态Schrödinger方程
$
  hat(H) phi = epsilon phi
$
#note[

]
#newpara()

解Schrödinger方程可以得到：波函数$psi_n (vb(x), t)$和对应的能量本征值$epsilon_n$，其中$n$是量子数的集合。每个定态波函数$psi_n$对应一个单粒子态，能量为$epsilon_n$。这些单粒子态构成了系统的Hilbert空间的一个基底。

平衡态统计力学用关注其能量本征值和量子数，即所有的能级和每个能级的简并度，也就是粒子的占据数。

#example(subname: [一维无穷深势阱])[
  宽$L$，粒子质量$m$
  $
    epsilon_n = (h^2 n^2)/(8 m L^2), n = 1, 2, 3, ...
  $
  简并度
  $
    omega_n = 1
  $
  驻波条件为
  $
    k = (2 pi)/lambda = (2 pi)/(2 L) n\
    p = hbar k = (2 pi hbar n)/(2 L)\
    epsilon_n = p^2 / (2 m) = (h^2 n^2)/(8 m L^2)
  $
  考虑到
  $
    Delta epsilon_n = epsilon_(n+1) - epsilon_n = (h^2 (2 n + 1))/(8 m L^2)
  $
  对于宏观系统，$L tilde 10^(-2)$m,$m = 1.67 times 10^(-27)$kg（质子），从而
  $
    h^2/(8 m L^2) 10^(-36) "J"
  $
  而热运动能量
  $
    tilde k_B T 10^(-21) "J"
  $
  从而宏观情况下，离散能级间隔小得几乎分辨不出来，可以近似看成连续谱
  $
    k_B T >> Delta epsilon_n
  $
]

#example(subname: [三维容器中自由粒子])[
  边长$L$，质量是$m$，粒子在$x,y,z$三个方向都形成驻波
  $
    epsilon_(n_1 n_2 n_3) = (h^2 / (8 m L^2)) (n_1^2 + n_2^2 + n_3^2), n_i = 1, 2, 3, ...
  $
  每一个$(n_1, n_2, n_3)$对应一个单粒子态，能量为$epsilon_(n_1 n_2 n_3)$。这就给出*能级简并*，例如$(1,1,2), (1,2,1), (2,1,1)$对应同一能量$epsilon_(1 1 2)$，因此这个能级的简并度为$3$。
]

#example(subname: [谐振子])[
  谐振子的Hamiltonian为
  $
    hat(H) = (hat(p)^2) / (2 m) + (m omega^2 hat(x)^2)/2
  $
  定态Schrödinger方程为
  $
    (hat(p)^2) / (2 m) phi + (m omega^2 hat(x)^2)/2 phi = epsilon phi
  $
  给出的谐振子的量子能级是
  $
    epsilon_n = (n + 1/2) hbar omega = h nu (n + 1/2), n = 0, 1, 2, ...
  $
  简并度
  $
    omega_n = 1
  $
  能级是等间距的，相邻能级差恒为
  $
    Delta epsilon = h nu = hbar omega
  $
  且基态能量不为零，为
  $
    epsilon_0 = 1/2 hbar omega
  $
]

#example(subname: [转子])[
  转子的Hamiltonian为
  $
    hat(H) = (hat(L)^2) / (2 I) = - hbar^2 / (2 I) ( 1/(sin theta) pdv(, theta)( sin theta pdv(, theta)) + 1/(sin^2 theta) pdv(, phi, 2))
  $
  其中转动惯量$I = sum m_i r_i^2$，$hat(L)$是角动量算符，$theta, phi$是转子在空间中的方位角。定态Schrödinger方程为
  $
    hat(H) psi = epsilon psi
  $
  给出的转子的量子能级是
  $
    epsilon_l = (hbar^2) / (2 I) l (l + 1), l = 0, 1, 2, ...
  $
  $
    hat(L)^2 psi = hbar^2 l (l + 1) psi
  $
  $l$为角量子数，简并度
  $
    omega_l = 2 l + 1
  $
  $epsilon$为外参量（$V, H, ...$）的函数。自旋自由度尚未计入
  $
    hat(L)_z = - i hbar pdv(, phi)
  $
  $
    hat(L)_z psi = m hbar psi
  $
  其中$m$为磁量子数，满足$-l <= m <= l$，因此每个$l$态有$2 l + 1$个不同的$m$态，对应同一能量，形成简并。
]

== 系统状态的量子描述

考虑多个*近独立、全同粒子*，它们分别占据单粒子态，整个系统的状态的表示分为微观状态和宏观状态两种：

- *微观状态*
  - 粒子按*量子态*的一个分配方式，称为系统的一个微观状态
  - 即$n_i$个粒子占据状态$k_i$
  #example(subname: [$N$自旋$1/2$粒子])[
    每个粒子有两个自旋态$ket(arrow.t), ket(arrow.b)$，因此单粒子态有两个。对于$N$个粒子，一个微观状态可以表示为
    $
      ket(arrow.t\,arrow.t\,...arrow.b)
    $
  ]
  - 以“微观态”的计数，后面不能随便照经典排列数去数，必须考虑：粒子是否可分辨，同一量子态能不能放多个粒子。这就会导致后面的三种统计：Boltzmann、Bose、Fermi
- *宏观状态*
  - 粒子按*能级*的一个分布称为系统的一个宏观状态
  - 即在能级$epsilon_i$上有$a_i$个粒子占据
  - 不再关心“具体量子态”，只关心“每个能级上有多少粒子”，因此给出一个分布
    $
      {a_i}, sum_i a_i = N
    $
#newpara()
分布与微观状态不同，一组分布对应大量不同微观状态，这是由于能级的简并。

分布与自旋有关，因为自旋会影响：单粒子态的数目、能级是否分裂、简并度是多少、粒子是Boson还是Fermion。比如自旋$1/2$粒子，在磁场里会有上下两个取向，能量不同；所以分布就会和自旋自由度直接相关。

#example(subname: [自旋体系的宏观态与微观态])[
  对于自旋$1/2$粒子，每个粒子有两个自旋态$ket(arrow.t), ket(arrow.b)$，因此单粒子态有两个。加磁场$H$，总能也就是磁矩与磁场的乘积$epsilon_arrow.t = - mu H, epsilon_arrow.b = mu H$，因此能级分裂成两个，分别对应不同的能量。

  对于三个自旋$1/2$粒子，系统的微观状态可以表示为
  #figure(
    three-line-table[
      | 微观态 | 宏观态(总能) |
      | --- | --- |
      | $ket(arrow.t\,arrow.t\,arrow.t)$ | $- 3 mu H$ |
      | $ket(arrow.t\,arrow.t\,arrow.b)$ | $- mu H$ |
      | $ket(arrow.t\,arrow.b\,arrow.t)$ | $- mu H$ |
      | $ket(arrow.b\,arrow.t\,arrow.t)$ | $- mu H$ |
      | $ket(arrow.t\,arrow.b\,arrow.b)$ | $mu H$ |
      | $ket(arrow.b\,arrow.t\,arrow.b)$ | $mu H$ |
      | $ket(arrow.b\,arrow.b\,arrow.t)$ | $mu H$ |
      | $ket(arrow.b\,arrow.b\,arrow.b)$ | $3 mu H$ |
    ],
    caption: [三个自旋$1/2$粒子的微观态与宏观态],
  )
  这就意味着，虽然系统有$2^3 = 8$个微观态，但只有四个不同的宏观态，分别对应总能量$-3 mu H, - mu H, mu H, 3 mu H$。其中总能量为$- mu H$的宏观态有三个微观态对应，总能量为$mu H$的宏观态也有三个微观态对应，而总能量为$-3 mu H$和$3 mu H$的宏观态各只有一个微观态对应。这就是能级简并导致的现象。
]

== 等几率假设

给定宏观条件，其中一组分布${a_i}$对应大量的微观状态。分布${a_i}$的几率是对应各微观态几率之和。

等几率假设认为，在平衡态下，系统处于每个微观状态的几率相等
$
  P("每个允许微观态") = 1 / Omega
$
因此分布${a_i}$的几率与对应的微观状态数成正比
$
  P{a_i} prop Omega{a_i}
$
也就是说，系统更可能处于那些对应更多微观状态的宏观态。

#theorem(subname: [Boltzmann等几率假设])[
  处平衡态的*孤立系统*，各可能*微观状态*出现的*几率相等*。
]

== 分布与微观状态

对全同，近独立粒子体系，单粒子能级为$epsilon_i$，简并度为$omega_i$，在$N,V,E$确定时（$E_i (v)$也确定），考虑分布${a_i}$，其中$a_i$是占据能级$epsilon_i$的粒子数，满足
$
  sum_i a_i = N, sum_i a_i epsilon_i = E
$
分布${a_i}$对应的微观状态数$Omega{a_i}$，也就是满足上述条件的微观状态数。对于不同类型的粒子，$Omega{a_i}$的计算方式不同，这就导致了不同的统计分布。

当$V->oo$，能级趋于连续，$epsilon_i$可以看成连续谱，将能级分组，组内能级数为$omega_i$，每个能级的能量近似为组内能级的平均值$epsilon_i$，从而*分布${a_i}$对应的微观状态数$Omega{a_i}$*可以用占据数方法计算出来
$
  Omega{a_i} = product_i Omega_i
$
其中$Omega_i$是*$a_i$个粒子占据能级$epsilon_i$上$omega_i$个单粒子态的微观状态数*。

$Omega_i$的计算方式取决于粒子类型
- *Boltzmann系统*：粒子可以*分辨*，量子态容纳的粒子数*不受限制*
- *Bose系统*：粒子*不可分辨*，量子态容纳的粒子数*不受限制*
  - 自旋量子数*整数*：光子（$1$），$π$介子（$0$），（电子+电子），复合粒子，声子（准粒子）
- *Fermi系统*：粒子*不可分辨*，量子态容纳的粒子数*最多为1*
  - 自旋量子数*半整数*：电子（$1/2$），质子（$1/2$），中子（$1/2$），$mu$子（$1/2$）

=== Bose系统

对于Bose系统，粒子*不可分辨*，量子态容纳的粒子数*不受限制*。

对于$omega_i$个量子态，$a_i$个粒子占据在这些量子态上的微观状态数可以利用*隔板法*计算出来。

我们把隔板和粒子从左到右排列，隔板把量子态分成$omega_i$组，每组可以有任意个粒子。对于$a_i$个粒子和$omega_i - 1$个隔板的排列数进行计数，得到
$
  Omega_i = binom(a_i + omega_i - 1, a_i) = (a_i + omega_i - 1)! / (a_i ! (omega_i - 1)!)
$
从而Bose系统的分布${a_i}$对应的微观状态数为
$
  Omega{a_i} = product_i binom(a_i + omega_i - 1, a_i) = product_i (a_i + omega_i - 1)! / (a_i ! (omega_i - 1)!)
$

=== Fermi系统

对于Fermi系统，粒子*不可分辨*，量子态容纳的粒子数*最多为1*。Pauli不相容原理要求每个量子态最多只能被一个粒子占据，因此在$omega_i$个量子态中选择$a_i$个来占据的微观状态数为
$
  Omega_i = binom(omega_i, a_i) = (omega_i !) / (a_i ! (omega_i - a_i)!)
$
从而Fermi系统的分布${a_i}$对应的微观状态数为
$
  Omega{a_i} = product_i binom(omega_i, a_i) = product_i (omega_i !) / (a_i ! (omega_i - a_i)!)
$

#theorem(subname: [${a_i}$分布的微观状态数])[
  - 对于Boltzmann系统，分布${a_i}$对应的微观状态数为
    $
      Omega{a_i} = N! / (product_i a_i !) product_i omega_i^(a_i)
    $
  - 对于Bose系统，分布${a_i}$对应的微观状态数为
    $
      Omega{a_i} = product_i binom(a_i + omega_i - 1, a_i) = product_i (a_i + omega_i - 1)! / (a_i ! (omega_i - 1)!)
    $
  - 对于Fermi系统，分布${a_i}$对应的微观状态数为
    $
      Omega{a_i} = product_i binom(omega_i, a_i) = product_i (omega_i !) / (a_i ! (omega_i - a_i)!)
    $
]

== Bose分布与Fermi分布

等几率假设下，分布${a_i}$的几率与对应的微观状态数$Omega{a_i}$成正比。Plank称$Omega{a_i}$为分布${a_i}$的*热力学几率*。

于是平衡态分布就用*最可几方法*来找：把热力学几率最大的那个分布，近似看成平衡态分布，称为*最可几分布*。也就是说，平衡态分布${a_i}$满足
$
  {a_i} = "argmax"_{a_i} Omega{a_i}
$

=== Bose分布

对于Bose系统，分布${a_i}$的微观状态数为
$
  Omega{a_i} = product_i binom(a_i + omega_i - 1, a_i) = product_i (a_i + omega_i - 1)! / (a_i ! (omega_i - 1)!)
$
取对数
$
  ln Omega{a_i} = sum_i (ln (a_i + omega_i - 1)! - ln a_i ! - ln (omega_i - 1)!)
$
对于$a_i >> 1, omega_i >> 1$，利用Stirling公式
$
  ln n! approx n ln n - n
$
得到
$
  ln Omega{a_i} & = sum_i ((a_i + omega_i - 1) ln (a_i + omega_i - 1) - a_i ln a_i - (omega_i - 1) ln (omega_i - 1)) \
                & = sum_i ((a_i + omega_i) ln (a_i + omega_i) - a_i ln a_i -omega_i ln omega_i) \
                & = sum_i (a_i ln(1 + omega_i/a_i) + omega_i ln(1 + a_i/omega_i))
$
$
  pdv(Omega_B, a_i) = ln (1 + omega_i/a_i)
$
求$ln Omega_B {a_i}$的条件极值，即满足条件
$
  sum_i a_i = N, sum_i a_i epsilon_i = E
$
利用Lagrange待定乘子法
$
  pdv(ln Omega_B, a_i) + alpha pdv(, a_i) (N - sum_i a_i) + beta pdv(, a_i) (E - sum_i a_i epsilon_i) = 0
$
即
$
  ln (1 + omega_i/a_i) - alpha - beta epsilon_i = 0
$
得到
$
  a_i = omega_i / (e^(alpha + beta epsilon_i) - 1)
$
这就是*Bose-Einstein分布*，其中$alpha, beta$是待定乘子，后续会证明它们分别与化学势$mu$和温度$T$相关。

我们还需要验证这是极大值，即
$
  pdv(ln Omega_B, a_i, 2) = - omega_i / (a_i (a_i + omega_i)) < 0
$
因此Bose-Einstein分布确实是热力学几率的最大值，对应平衡态分布。

#theorem(subname: [Bose-Einstein分布])[
  Bose系统的平衡态分布为
  $
    a_i = omega_i / (e^(alpha + beta epsilon_i) - 1)
  $
  其中$alpha, beta$是待定乘子，满足
  $
    sum_i a_i = N, sum_i a_i epsilon_i = E
  $
]
- 能量越高，占据越少
  - 因为$epsilon_i$越大，指数项越大，分母越大，所以$a_i$越小
- Bose分布最特殊的地方是分母里的$-1$
  - 反映的是粒子不可分辨，同一量子态允许多个粒子堆积
  - 所以Boson会表现出“喜欢聚到同一态里”的趋势

=== Fermi分布

对于Fermi系统，分布${a_i}$的微观状态数为
$
  Omega{a_i} = product_i binom(omega_i, a_i) = product_i (omega_i !) / (a_i ! (omega_i - a_i)!)
$
取对数
$
  ln Omega{a_i} = sum_i (ln omega_i ! - ln a_i ! - ln (omega_i - a_i)!)
$
对于$a_i >> 1, omega_i >> 1$，利用Stirling公式得到
$
  ln Omega{a_i} & = sum_i (omega_i ln omega_i - a_i ln a_i - (omega_i - a_i) ln (omega_i - a_i)) \
                & = sum_i (a_i ln(omega_i/a_i - 1) - omega_i ln(1 - a_i/omega_i))
$
$
  pdv(ln Omega_F, a_i) = ln (omega_i/a_i - 1)
$
求$ln Omega_F {a_i}$的条件极值，即满足条件
$
  sum_i a_i = N, sum_i a_i epsilon_i = E
$
利用Lagrange待定乘子法
$
  pdv(ln Omega_F, a_i) + alpha pdv(, a_i) (N - sum_i a_i) + beta pdv(, a_i) (E - sum_i a_i epsilon_i) = 0
$
即
$
  ln (omega_i/a_i - 1) - alpha - beta epsilon_i = 0
$
得到
$
  a_i = omega_i / (e^(alpha + beta epsilon_i) + 1)
$
这就是*Fermi-Dirac分布*，其中$alpha, beta$是待定乘子，后续会证明它们分别与化学势$mu$和温度$T$相关。

我们还需要验证这是极大值，即
$
  pdv(ln Omega_F, a_i, 2) = - omega_i / (a_i (omega_i - a_i)) < 0
$
因此Fermi-Dirac分布确实是热力学几率的最大值，对应平衡态分布。

#theorem(subname: [Fermi-Dirac分布])[
  Fermi系统的平衡态分布为
  $
    a_i = omega_i / (e^(alpha + beta epsilon_i) + 1)
  $
  其中$alpha, beta$是待定乘子，满足
  $
    sum_i a_i = N, sum_i a_i epsilon_i = E
  $
]
- Fermi分布最特殊的地方是分母里的$+1$
  - 因为Fermion不能多重占据同一量子态
- 每个单粒子态平均占据数绝不会超过$1$

=== 半经典分布

若取基态能量为$0$，则$epsilon_i >= 0$，$exp(beta epsilon_i) >= 1, beta>0$。当$e^(alpha) >> 1$时
$
  a_i = omega_i / (e^(alpha + beta epsilon_i) plus.minus 1) approx omega_i /(e^(alpha + beta epsilon_i)) = omega_i e^(- alpha - beta epsilon_i)
$
这是*半经典分布*，这里体系本质上还是*量子体系*，单粒子态、简并度这些仍然是量子概念；分布公式和*Maxwell-Boltzmann分布*形式相同，适用于高温、低密度的情况。

*非简并条件*是
$
  e^(alpha) >> 1 <=> a_i << omega_i
$
例如：稀薄气体。各粒子波函数重叠小，无论Boson,Fermion，体系无分别，每个量子态平均几乎都是空的。

#theorem(subname: [半经典分布])[
  当$e^(alpha) >> 1$时，Bose系统和Fermi系统的平衡态分布都近似为
  $
    a_i = omega_i e^(- alpha - beta epsilon_i)
  $
  *非简并条件*是
  $
    e^(alpha) >> 1 <=> a_i << omega_i
  $
  即每个量子态平均占据数远小于其简并度。
]
#newpara()

对应的热力学几率
$
  ln Omega_B {a_i} & = sum_i (a_i ln(omega_i/a_i) + a_i) \
                   & = sum_i (ln omega_i^(a_i) - a_i (ln a_i - 1)) \
                   & = sum_i ln omega_i^(a_i) / (a_i !) \
$
也有
$
  ln Omega_F {a_i} & = sum_i (a_i ln(omega_i/a_i) + a_i) \
                   & = sum_i (ln omega_i^(a_i) - a_i (ln a_i - 1)) \
                   & = sum_i ln omega_i^(a_i) / (a_i !) \
$
这也是*半经典分布*的热力学几率
$
  Omega_S {a_i} = product_i omega_i^(a_i) / (a_i !)
$
这个热力学几率是不同于后面Boltzmann情形的。
#theorem(subname: [${a_i}$分布的微观状态数])[
  - 半经典分布${a_i}$对应的微观状态数为
    $
      Omega_S {a_i} = product_i omega_i^(a_i) / (a_i !)
    $
]

=== 最可几方法误差估计

原则上，所有分布都是可能的；但实际上，对最可几分布的偏离总是很小。

在最可几分布${a_i^*}$处展开
$
  ln Omega{a_i} = ln Omega{a_i^*} + sum_i eval(pdv(ln Omega, a_i))_(a_i^*) (a_i - a_i^*) + 1/2 sum_i eval(pdv(ln Omega, a_i, 2))_(a_i^*) (a_i - a_i^*)^2
$
因为${a_i^*}$是极值点，所以
$
  eval(pdv(ln Omega, a_i))_(a_i^*) = 0, pdv(ln Omega, a_i, 2) = - 1/a_i^* < 0
$
从而
$
  ln (Omega{a})/(Omega{a^*}) = - 1/2 sum_i a_i^* ((delta a_i) / a_i^*)^2
$
其中$delta a_i = a_i - a_i^*$。这就给出了最可几方法的误差估计
$
  Omega{a_i} / Omega{a_i^*} = exp(- 1/2 sum_i a_i^* ((delta a_i) / a_i^*)^2)
$
#theorem(subname: [最可几方法误差估计])[
  对于分布${a_i}$，如果其偏离最可几分布${a_i^*}$的程度为$delta a_i = a_i - a_i^*$，则其对应的微观状态数与最可几分布对应的微观状态数之比为
  $
    Omega{a_i} / Omega{a_i^*} = exp(- 1/2 sum_i a_i^* ((delta a_i) / a_i^*)^2)
  $
]

#newpara()

如果
$
  (delta a_i) / a_i^* tilde 10^(-4), N tilde 10^(23)
$
则有
$
  Omega{a_i} / Omega{a_i^*} approx exp(- 1/2 sum_i a_i^* ((delta a_i) / a_i^*)^2) tilde exp(- 1/2 times 10^(15)) approx 0
$
从而对宏观系统来说，只要偏离最可几分布一点点，其概率就已经几乎为零。

=== $alpha$与$beta$的物理意义

下面以半经典分布为例，其它分布类似。

对于半经典分布
$
  a_i = omega_i e^(- alpha - beta epsilon_i)
$

==== $beta$的物理意义

考虑两个近独立粒子系统构成一复合系统。每个子系统先各自平衡，然后让它们热接触，最后达到总平衡。

两个子系统的分布分别记成${a'_i}, {a''_i}$，则总热力学几率是
$
  Omega_"s" {a'_i, a''_i} = Omega_S {a'_i} Omega_S {a''_i} = product_i omega'_i^(a'_i) / (a'_i !) product_i omega''_i^(a''_i) / (a''_i !)
$
*只允许热交换，不允许粒子交换*，求最可几分布，约束条件为
- 子系统粒子数各自固定
  $
    N' = sum_i a'_i, N'' = sum_j a''_j
  $
- 有热量交换，但总能量守恒
  $
    E = sum_i a'_i epsilon'_i + sum_j a''_j epsilon''_j
  $
引入三个Lagrange乘子$alpha', alpha'', beta$，最可几条件
$
  pdv(ln Omega_S, a'_i) + alpha' pdv(, a'_i) (N' - sum_i a'_i) + alpha'' pdv(, a'_i) (N'' - sum_j a''_j) + beta pdv(, a'_i) (E - sum_i a'_i epsilon'_i - sum_j a''_j epsilon''_j) = 0\
  pdv(ln Omega_S, a''_j) + alpha' pdv(, a''_j) (N' - sum_i a'_i) + alpha'' pdv(, a''_j) (N'' - sum_j a''_j) + beta pdv(, a''_j) (E - sum_i a'_i epsilon'_i - sum_j a''_j epsilon''_j) =
$
给出
$
  a'_i = omega'_i e^(- alpha' - beta epsilon'_i), a''_j = omega''_j e^(- alpha'' - beta epsilon''_j)
$
即，重达平衡后，两子系统有相同的$beta$，因此$beta$与温度相关
$
  beta = beta(T)
$
后面我们将证明$beta = 1/(k_B T)$。

热力学第零定律告诉我们：两个系统若彼此热平衡，就有某个状态参量相同，而这个参量就是温度。现在统计力学推导发现：两个系统达到最可几平衡时，满足$beta$相同。温度高，高能级更容易被占据，分布衰减得慢；温度低，高能级更难被占据，分布衰减得快。

==== $alpha$的物理意义

*两相系统达到平衡，允许粒子交换*，求最可几分布，约束条件为
- 子系统粒子数不固定，但总粒子数守恒
  $
    N = sum_i a'_i + sum_j a''_j
  $
- 有热量交换，但总能量守恒
  $
    E = sum_i a'_i epsilon'_i + sum_j a''_j epsilon''_j
  $
引入两个Lagrange乘子$alpha, beta$，最可几条件为
$
  pdv(ln Omega_S, a'_i) + alpha pdv(, a'_i) (N - sum_i a'_i - sum_j a''_j) + beta pdv(, a'_i) (E - sum_i a'_i epsilon'_i - sum_j a''_j epsilon''_j) = 0\
  pdv(ln Omega_S, a''_j) + alpha pdv(, a''_j) (N - sum_i a'_i - sum_j a''_j) + beta pdv(, a''_j) (E - sum_i a'_i epsilon'_i - sum_j a''_j epsilon''_j) = 0
$
给出
$
  a'_i = omega'_i e^(- alpha - beta epsilon'_i), a''_j = omega''_j e^(- alpha - beta epsilon''_j)
$
即，两相系统达到平衡时，有相同的$alpha$和$beta$。相平衡时$mu, T$相同，因此$alpha$与化学势相关
$
  alpha = alpha(mu, T)
$
后面我们将证明$alpha = - mu / (k_B T)$。

从分布式子看：
$
  a_i prop e^(- alpha - beta epsilon_i)
$
代入
$
  beta = 1/(k_B T), alpha = - mu / (k_B T)
$
得到
$
  a_i prop e^( - (epsilon_i - mu) / (k_B T))
$

== Boltzmann分布

Boltzmann分布是和前面半经典分布很像但又不完全一样的情形。核心对象是：*可分辨的经典粒子*。

对于*定域系统*，每个粒子都被限制在一个特定的空间区域内，因此粒子是可分辨的。每个粒子占据一个单粒子态，整个系统的状态由每个粒子占据哪个单粒子态来描述。例如固体的晶格振动模式，每个模式对应一个单粒子态，粒子占据这些模式的分布决定了系统的状态。

定域系统对粒子可作标记以区分，全同性原理限制性不强，有
$
  N = sum_i a_i, E = sum_i a_i epsilon_i
$
能给出Boltzmann分布的*热力学几率*，即分布${a_i}$对应的微观状态数$Omega{a_i}$，为
$
  Omega{a_i} = binom(N, a_1, a_2, ..., a_n) product_i omega_i^(a_i) = N! / (product_i a_i !) product_i omega_i^(a_i) = N! product_i omega_i^(a_i) / (a_i !)
$
下面求最可几分布，取对数
$
  ln Omega{a_i} = ln N! + sum_i a_i ln omega_i - sum_i ln a_i !\
$
对于$a_i >> 1$，利用Stirling公式
$
  ln Omega{a_i} & approx ln N! + sum_i a_i ln omega_i - sum_i (a_i ln a_i - a_i) \
                & = ln N! + sum_i (a_i ln omega_i - a_i ln a_i + a_i) \
                & = ln N! + sum_i (a_i ln(omega_i/a_i) + a_i)
$
求$ln Omega{a_i}$的条件极值，即满足条件
$
  sum_i a_i = N, sum_i a_i epsilon_i = E
$
引入两个Lagrange乘子$alpha, beta$，最可几条件为
$
  pdv(ln Omega, a_i) + alpha pdv(, a_i) (N - sum_i a_i) + beta pdv(, a_i) (E - sum_i a_i epsilon_i) = 0
$
即
$
  ln (omega_i/a_i) - alpha - beta epsilon_i = 0
$
得到
$
  a_i = omega_i e^(- alpha - beta epsilon_i)
$

#theorem(subname: [Boltzmann分布])[
  Boltzmann系统的平衡态分布为
  $
    a_i = omega_i e^(- alpha - beta epsilon_i)
  $
  其中$alpha, beta$是待定乘子，满足
  $
    sum_i a_i = N, sum_i a_i epsilon_i = E
  $
]

#theorem(subname: [Bose, Fermi, 半经典, Boltzmann 分布的热力学几率和最可几分布])[
  - Bose系统的分布${a_i}$对应的微观状态数为
    $
      Omega{a_i} = product_i binom(a_i + omega_i - 1, a_i) = product_i (a_i + omega_i - 1)! / (a_i ! (omega_i - 1)!)
    $
    平衡态分布为
    $
      a_i = omega_i / (e^(alpha + beta epsilon_i) - 1)
    $
  - Fermi系统的分布${a_i}$对应的微观状态数为
    $
      Omega{a_i} = product_i binom(omega_i, a_i) = product_i (omega_i !) / (a_i ! (omega_i - a_i)!)
    $
    平衡态分布为
    $
      a_i = omega_i / (e^(alpha + beta epsilon_i) + 1)
    $
  - 半经典分布${a_i}$对应的微观状态数为
    $
      Omega{a_i} = product_i omega_i^(a_i) / (a_i !)
    $
    平衡态分布为
    $
      a_i = omega_i e^(- alpha - beta epsilon_i)
    $
  - Boltzmann系统的分布${a_i}$对应的微观状态数为
    $
      Omega{a_i} = N! / (product_i a_i !) product_i omega_i^(a_i)
    $
    平衡态分布为
    $
      a_i = omega_i e^(- alpha - beta epsilon_i)
    $
]
