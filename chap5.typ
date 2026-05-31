#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch

= 系综理论

前面几章主要研究的是近独立粒子系统，也就是粒子之间相互作用可以忽略，所以可以用单粒子能级、单粒子态分布来描述系统。

例如理想气体、自由电子气，我们常写：$macron(n)_l = 1/(e^(alpha + beta epsilon_l) + 1)$。这类公式的核心是：系统状态可以由各个单粒子态的占据数描述。

比如真实气体、液体、固体中，粒子之间有明显相互作用，这时单个粒子的能量不再只是它自己的动能，而还与其他粒子的位置有关。所以单粒子态不再有明确意义。

如果粒子间作用不能忽略，单粒子态无确切含义。系综理论研究：整个系统作为一个整体处于哪些微观状态？各状态概率是多少？

== 系统微观状态的描述与统计系综

=== 系统微观状态的描述

==== 经典描述：$Gamma$空间

对于一个经典力学系统，系统的微观状态由所有粒子的广义坐标$q$和广义动量$p$决定。$mu$空间是单粒子态空间，能够描述单个粒子的状态。

如果系统有$N$个粒子，每个粒子有$gamma$个自由度，那么总自由度为：
$
  f = N gamma
$
于是系统的微观状态可以写成：
$
  (q_1, ..., q_F; p_1, ..., p_F)
$
是一个$2f$维空间，叫做$Gamma$空间，也为相空间。一个微观状态就是$Gamma$空间中的一个点。

如果系统总能量固定：
$
  H(q, p) = E
$
那么系统的微观状态就被限制在$Gamma$空间中的一个超曲面上，叫做能量曲面。

==== 量子描述：量子态

量子情况下，系统的微观状态不是相空间中的点，而是由一组完备力学量的量子数描述。

对于力学量完备集
$
  {hat(L), hat(M), ...}
$
系统的微观状态可以用这些量子数来标记，例如：
$
  {l, m, ...}
$
也就是说，系统的一个微观状态就是一个确定的量子态。

经典和量子的联系是，每个量子态在$Gamma$空间中占据相体积$h^f$，从而
$
  (dd(q_1)...dd(q_f) dd(p_1)...dd(p_f)) / h^f
$
表示这一小块相空间中包含多少个量子态。

=== 系统微观状态的几率分布

给定宏观条件，有大量微观态与之对应。宏观测量时间相对于分子运动时间尺度很长，所以系统会经历大量微观态。例如分子运动特征时间大约是：$10^(-14)"s"$所以一次宏观测量实际上已经包含了大量微观状态的平均。

因此宏宏观量是各微观态对应量的统计平均值。

==== 经典情况

设系统处在$(q,p)$附近体积元中的概率为：
$
  rho(q, p) product_(i=1)^f dd(q_i, p_i)
$
其中$rho(q, p)$称为分布函数，满足归一化条件：
$
  integral rho(q, p) product_(i=1)^f dd(q_i, p_i) = 1
$
如果宏观量$B$对应的微观力学量是$B(q,p)$，那么宏观观测值为：
$
  macron(B) = integral B(q, p) rho(q, p) product_(i=1)^f dd(q_i, p_i)
$
这就是经典统计平均。

==== 量子情况

系统处于微观态$s$的概率为：
$
  rho_s, s = {l, m, ...}
$
满足归一化条件：
$
  sum_s rho_s = 1
$
如果微观态$s$中物理量$B$的值是$B_s$，那么宏观平均值为：
$
  macron(B) = sum_s B_s rho_s
$

=== 统计系综（Ensemble）

#definition(subname: [统计系综])[
  统计系综是大量微观结构相同，并且处在相同宏观条件下的系统的集合。若处平衡态，称稳定系综。
]
#newpara()
也就是说，我们想象有很多个完全相同的系统副本。这样就可以用很多系统的平均代替一个系统长时间演化的平均。

- 类比一是掷骰子：一个人掷很多次，和很多人同时各掷一次，统计结果是一样的。
- 类比二是双缝实验：一个电子一个电子地打，时间足够长会形成干涉图样；也可以大量相同状态的电子同时入射，短时间内也形成相同图样。

所以系综平均的思想是：
$
  "时间平均" <-> "系综平均"
$
这就是平衡态统计物理的重要基础。

#definition(subname: [三种重要系综])[
  #figure(
    three-line-table[
      | 统计系综 | 宏观条件 | 适用系统 |
      | :---: | :---: | :---: |
      | 微正则系综 | 内能$U$、体积$V$、粒子数$N$固定 | 孤立系统 |
      | 正则系综 | 温度$T$、体积$V$、粒子数$N$固定 | 封闭系统 |
      | 巨正则系综 | 温度$T$、体积$V$、化学势$mu$固定 | 开放系统 |
    ],
    caption: [三种重要系综],
  )
]

== 微正则分布

#definition(subname: [微正则系综])[
  *微正则系综是*指系统的内能$U$、体积$V$、粒子数$N$固定的系综。适用于孤立系统。

  平衡的孤立系统服从的分布叫*微正则分布*（Micro-Canonical）。
]
#newpara()

Boltzmann等几率假设说处平衡态的*孤立系统*各可能*微观状态*出现的几率相等。因为所有可能微观态等概率，所以设系统处于第$s$个微观态的概率为：
$
  rho_s = "constant" = 1/ Omega
$
$Ω$表示：能量在$E$到$E+Delta E$范围内的微观状态数。

因为经典情况下，严格能量面$H(q,p)=E$的体积为零；实际统计中取一个很窄但宏观上不可分辨的能量壳：
$
  E≤H(q,p)≤E+Δ E
$
这个$Δ E$宏观上很小，但包含的微观态数仍然极大。

所以微正则分布的意思是：系统只在能量壳内活动，并且能量壳内各微观态等概率。能量壳外的状态概率为零。

== 微正则分布的热力学公式

如何从微正则分布得到热力学。最关键的公式是 Boltzmann 熵公式：
$
  S(N, E, V) = k_B ln Omega(N, E, V)
$
这条公式把统计物理和热力学连接起来
$
  rho_s = 1/ Omega
$
一个宏观态对应的微观态数越多，熵越大。

熵是微正则系综最自然的热力学函数，也叫*特性函数*。它的全微分为：
$
  dd(S) = 1/T dd(U) + p/T dd(V) - mu/T dd(N)
$
几个常见特性函数如下表。

#figure(
  three-line-table[
    | 特性函数 | 定义 | 自变量 | 基本关系 |
    | :---: | :---: | :---: | :---: |
    | 熵 | $S$ | $N$、$U$、$V$ | $dd(S) = 1/T dd(U) + p/T dd(V) - mu/T dd(N)$ |
    | 内能 | $U$ | $S$、$N$、$V$ | $dd(U) = T dd(S) - p dd(V) + mu dd(N)$ |
    | 焓 | $H = U + p V$ | $S$、$N$、$p$ | $dd(H) = T dd(S) + V dd(p) + mu dd(N)$ |
    | 自由能 | $F = U - T S$ | $T$、$N$、$V$ | $dd(F) = -S dd(T) - p dd(V) + mu dd(N)$ |
    | 自由焓 | $G = U - T S + p V$ | $T$、$N$、$p$ | $dd(G) = -S dd(T) + V dd(p) + mu dd(N)$ |
    | 巨热力势 | $J = U - T S - mu N$ | $T$、$V$、$mu$ | $dd(J) = -S dd(T) - p dd(V) - N dd(mu)$ |
  ],
  caption: [微正则分布的热力学公式],
)

== 正则分布

#definition(subname: [正则系综])[
  $N$、$V$恒定，并与恒$T$热源接触而达到平衡的系统服从的分布叫*正则分布*（Canonical）。

  $N$、$V$、$T$恒定的系统组成的统计系综，称为*正则系综*。
]

=== 系统与热源之间的平衡

设我们研究的小系统为$A:E_s, T$，它与一个大热源$A_r: E_r, T$接触。

整体$A+A_r$是孤立系统，所以总能量固定：
$
  E^((0)) = E_s + E_r
$
因此：
$
  E_s << E_r approx E^((0))
$
也就是说，小系统吸收或放出一点能量，对热源温度几乎没有影响。

下面求小系统$A$处于某一个指定微观态$s$的概率$rho_s$。如果$A$固定在态$s$，那么它的能量就是$E_s$。这时热源必须有能量：$E_r = E^((0)) - E_s$。热源在这个能量下可能的微观状态数是：
$
  Omega_r(E_r)
$
由于整体$A+A_r$是孤立系统，可以用微正则系综的等概率假设
$
  rho_s = Omega_r (E^((0)) - E_s)
$
因为热源状态数$Omega_r$非常大，直接处理它不方便，所以处理它的对数，在$E^((0))$展开
$
  ln Omega_r(E^((0)) - E_s) = ln Omega_r(E^((0))) + beta (-E_s)
$
其中
$
  beta = eval(dd(ln Omega_r) / dd(E_r))_(E^((0)))
$
从而
$
  rho_s prop e^(-beta E_s)
$

#example(subname: [理想气体的$Omega(E)$])[
  理想气体
  $
    S = N k_B ln(V/N ((2 pi m k_B T)/h^2)^(3/2)) + 5/2 N k_B
  $
  微观状态数大致满足
  $
    Omega(E) = B V^N E^((3N)/2) approx E^f
  $
  $f ~ 10^23$很大
  $
    (1 - E_s/E^((0)))^f approx 1 - (f E_s)/E^((0))
  $
  $(f E_s)/E^((0))$可以不是小量，但是取对数后
  $
    ln Omega(E) tilde k ln E
  $
  它的展开变得温和得多
  $
    ln Omega(E^((0)) - E_s) = ln Omega(E^((0))) + beta (-E_s)
  $
  状态数本身变化太剧烈，应该展开它的对数。
]

#newpara()

前面得到
$
  rho_s prop e^(-beta E_s)
$
为了让所有微观态概率之和等于$1$，需要归一化：
$
  rho_s = e^(-beta E_s) / (sum_s e^(-beta E_s)) = Z^(-1) e^(-beta E_s)
$
于是定义配分函数：
$
  Z = sum_s e^(-beta E_s)
$
由定义，$beta$只与热源有关，不同系统达到平衡时有相同$T$
$
  beta = beta(T)
$

=== 在正则系综里的一个系统

正则系综中，每一个成员都是一个完整的研究系统。比如我们研究一个$N,V,T$固定的气体系统，那么正则系综就是很多个这样的气体系统的集合。

把每一个系统称作一个巨分子，这些系统之间相互作用可以忽略，但它们处在相同的宏观条件下。于是整个正则系综可以看成：*由大量可区分的巨分子组成的近独立系统*。

注意这里“可区分”是因为系综中的不同副本可以编号：第 1 个系统、第 2 个系统、第 3 个系统……它们不是全同粒子意义下的不可区分对象。

设正则系综中有：
$
  M >> 1
$
个系统副本，也就是$M$个巨分子。如果一个系统可以处于微观态$s$，其能量为$E_s$。令$M_s$是处于微观态$s$的系统数
$
  sum_s M_s = M, sum_s M_s E_s = epsilon
$
这里的$epsilon$是整个系综的总能量，不是单个系统的能量。

分布${M_s}$对应的体系微观态数
$
  Omega({M_s}) = M! / (product_s M_s !)
$
求$Omega({M_s})$满足两条件的极大值
$
  pdv(Omega(M_s), M_s) + alpha pdv((M - sum_s M_s), M_s) + beta pdv((epsilon - sum_s M_s E_s), M_s) = 0
$
其中$alpha$、$beta$是拉Lagrange乘子。解出$M_s$，得到
$
  M_s prop e^(-beta E_s)
$
所以最可几分布中，处于能量$E_s$的系统数与 Boltzmann 因子成正比。分布几率$rho_s$为
$
  rho_s = M_s / M = e^(-beta E_s) / (sum_s e^(-beta E_s)) = Z^(-1) e^(-beta E_s)
$
以上对系综内每个系统（巨分子）成立，平衡时它们有相同$T$
$
  beta = beta(T)
$

#newpara()
考虑有简并时的正则分布；若能级简并将不同能级记为$E_i$，简并度为$Gamma_i$，则
$
  rho(E_i) = Z^(-1) Gamma_i e^(-beta E_i)
$
那么配分函数可以改写为对能级求和
$
  Z = sum_i Gamma_i e^(-beta E_i)
$

=== 近独立系统$Z$与单粒子$z_0$的关系

对于一个由$N$个近独立粒子组成的系统，系统某个微观态$s$的总能量可以写成各粒子能量之和：
$
  E_s = sum_(i=1)^N epsilon_i
$
这里$epsilon_i$是第$i$个粒子的单粒子能量。也就是说，如果粒子之间相互作用可以忽略，总能量可以分解为单粒子能量的和。

而对于可区分粒子。单粒子配分函数定义为：
$
  z_0 = sum_j e^(-beta epsilon_j)
$
其中$j$遍历单粒子的所有可能状态。系统配分函数为：
$
  Z & = sum_s e^(-beta E_s) \
    & = sum_s e^(-beta sum_(i=1)^N epsilon_i) = sum_{j_1, ..., j_N} e^(-beta sum_(i=1)^N epsilon_(j_i)) \
    & = sum_(j_1) e^(-beta epsilon_(j_1)) sum_(j_2) e^(-beta epsilon_(j_2)) ... sum_(j_N) e^(-beta epsilon_(j_N)) \
    & = (sum_j e^(-beta epsilon_j))^N = z_0^N
$
这个结果只适用于近独立、可区分粒子。

量子情形，量子关联（Pauli原理、全同粒子特性）使得没有这种简单分解，只有单粒子态占据方式独立，即半经典或经典情形（非简并），才能有这种分解。只有在经典极限、非简并条件下，也就是量子交换效应可以忽略时，才可以近似使用这种分解。

对不可区分粒子，系统配分函数为
$
  Z = sum_s e^(-beta E_s) = sum_(j_1 < j_2 < ... < j_N) e^(-beta sum_(i=1)^N epsilon_(j_i)) = 1/N! (sum_j e^(-beta epsilon_j))^N = z_0^N / N!
$
这就是 Gibbs 修正因子。这个公式也是经典非简并极限下的公式。严格的量子 Bose/Fermi 系统，不能简单写成$Z = z_0^N / N!$，而要用占据数分布或巨正则系综来处理。

#theorem(subname: [近独立粒子系统的配分函数])[
  对于一个由$N$个近独立粒子组成的系统
  - 可区分粒子：系统配分函数$Z = z_0^N$
  - 不可区分经典粒子：系统配分函数$Z = z_0^N / N!$
]

== 正则分布的热力学公式

$N,T,V$（或$y$）恒定的正则系综，正则分布的宏观量是对应微观量对系统所有微观态的平均。

=== 热力学

系统的*内能*就是能量的平均值
$
  U = macron(E) = sum_s E_s rho_s
$
代入正则分布
$
  U = 1/Z sum_s E_s e^(-beta E_s)
$
从而
$
  U = - pdv(ln Z, beta)
$
#newpara()

如果系统能级$E_s$依赖某个外参量$y_i$，例如体积$V$，那么改变$y_i$会使能级发生变化
$
  E_s = E_s(y_i)
$
正则系综中，与$y_i$共轭的广义力为
$
  sum_i Y_i dd(y_i) = sum_i pdv(E_s, y_i) dd(y_i) => Y_i = pdv(E_s, y_i)
$
平均的广义力为
$
  macron(Y)_i = sum_s rho_s pdv(E_s, y_i) = 1/Z sum_s pdv(E_s, y_i) e^(-beta E_s) = - 1/beta pdv(ln Z, y_i)
$
这就是从配分函数推出*物态方程*的方法。

比如理想气体最后会推出：
$
  p = 1/beta pdv(ln Z, V)
$
#newpara()
热力学有
$
  T dd(S) & = dd(Q) = dd(U) - sum_i macron(Y)_i dd(y_i) \
          & = - dd(pdv(ln Z, beta)) + 1/beta sum_i pdv(ln Z, y_i) dd(y_i)
$
利用
$
  dd(ln Z) = pdv(ln Z, beta) dd(beta) + sum_i pdv(ln Z, y_i) dd(y_i)
$
消去求和项得
$
  T dd(S) = 1/beta dd((ln Z - beta pdv(ln Z, beta)))
$
两边全微分要求
$
  beta T = 1/k_B = "constant"
$
且
$
  S - S' = k_B (ln Z - beta pdv(ln Z, beta)) = k_B (ln Z + beta macron(E))
$
由Boltzmann关系系综总的熵为
$
  k_B ln Omega{M_s} & = k_B ln M! - sum_s k_B ln M_s! \
                    & approx k_B M (ln M - 1) - k_B sum_s M_s (ln M_s - 1) \
$
注意到
$
  M_s = Z^(-1) M e^(-beta E_s)\
  ln M_s = ln M - ln Z - beta E_s
$
得到
$
  k_B ln Omega{M_s} & = k_B M (ln Z + beta macron(E))
$
每个系统平均熵为
$
  k_B (ln Z + beta macron(E))
$
也得到上面的
$
  S' = 0
$
#newpara()
下面我们考察$S$的微观对应量，考虑到
$
  rho_s = Z^(-1) e^(-beta E_s)
$
则有
$
  overline(ln rho) = - ln Z - beta macron(E)
$
并且
$
  S = - k_B overline(ln rho)
$
得到$S$对应的微观量为
$
  - k_B ln rho
$
所以熵的统计表达式是：
$
  S = - k_B sum_s rho_s ln rho_s
$
这就是*Gibbs熵公式*。它比微正则的Boltzmann熵公式更一般。

也能得到*自由能*
$
  F = U - T S = - k_B T ln Z
$

=== 能量涨落

在正则系综中，系统与热源接触，可以交换能量。因此，某个系统的瞬时能量$E_s$不是固定的。

但是系综平均能量是确定的
$
  U = overline(E) = sum_s E_s rho_s
$
也就是我们通常说的内能。

能量涨落是单个系统实际能量会偏离平均能量，绝对涨落为
$
  Delta overline(E) = sqrt(overline((E - U)^2)) = sqrt(overline(E)^2 - U^2)
$
相对涨落为
$
  delta overline(E) = (Delta overline(E)) / overline(E)
$
能量涨落热力学公式为
$
  overline(E)^2 & = sum_s E_s^2 rho_s = 1/Z sum_s E_s^2 e^(-beta E_s) = Z^(-1) pdv(Z, beta, 2) \
                & = pdv(ln Z, beta, 2) + (pdv(ln Z, beta))^2 = - pdv(U, beta) + overline(E)^2 \
                & = k_B T^2 C_V + overline(E)^2
$
绝对涨落为
$
  Delta overline(E) = sqrt(k_B T^2 C_V)
$
相对涨落为
$
  delta overline(E) = sqrt(k_B T^2 C_V) / overline(E)
$

#example(subname: [单原子分子理想气体的涨落])[
  理想气体的内能为
  $
    U = 3/2 N k_B T
  $
  定容热容为
  $
    C_V = dd(U, T) = 3/2 N k_B
  $
  能量绝对涨落为
  $
    Delta overline(E) = sqrt(k_B T^2 C_V) = sqrt(3/2 N) k_B T
  $
  能量相对涨落为
  $
    delta overline(E) = sqrt(3/2 N) k_B T / (3/2 N k_B T) = sqrt(2/(3N)) tilde 10^(-11)
  $
  涨落对宏观系统量很小的，因而$overline(E)$可看作是孤立系统的能量$E$，而用正则分布研究孤立系统。
]

== 正则分布的连续形式

=== $Gamma$空间分布

前面讲正则分布时，写的是离散能级形式：
$
  rho_s = Z^(-1) e^(-beta E_s), Z = sum_s e^(-beta E_s)
$
这适合量子能级离散的情况。但如果系统能量准连续，比如经典气体，就要改成相空间积分。

经典系统的微观状态用$Gamma$空间中的点表示，相空间中一个小体积元为
$
  product_(i=1)^f dd(q_i, p_i)
$
这个相空间体积元中包含的态数为
$
  (product_(i=1)^f dd(q_i, p_i)) / h^f
$
系统处$product_i dd(q_i, p_i)$的几率为
$
  rho(q, p) product_i dd(q_i, p_i)
$
其中$rho(q, p)$是分布函数，系统状态在$Gamma$空间的密度
$
  rho(q, p) = Z^(-1) e^(-beta E(q, p, y))
$
全同粒子不可分，还要除以$N!$，所以配分函数为
$
  Z = 1/(N! h^f) integral e^(-beta E(q, p, y)) product_i dd(q_i, p_i)
$

=== 按能量的分布


定义：
$
  vb(Omega)(E) = integral_(H(q, p) <= E) product_i dd(q_i, p_i)
$
表示能量曲面$H(q,p)=E$所包围的相空间体积。如果考虑全同粒子和量子态计数，则能量小于$E$的状态数为：
$
  Gamma(E) = 1/(N! h^f) vb(Omega)(E)
$
那么能量位于$E$到$E+dd(E)$之间的状态数为
$
  Gamma(E) dd(E) = dd(Gamma(E)) = 1/(N! h^f) dd(vb(Omega)(E))
$
系统能量在$E$到$E+dd(E)$之间的几率为
$
  rho(E) dd(E) = 1/Z e^(-beta E) Gamma(E) dd(E)
$
其中$Z$是配分函数
$
  Z = integral_0^oo e^(-beta E) Gamma(E) dd(E) = integral_0^oo e^(-beta E) 1/(N! h^f) vb(Omega)'(E) dd(E)
$

=== 最可几能量分布

一方面$e^(-beta E)$是随$E$增大的减函数，另一方面态密度$Gamma'(E)$
通常是随$E$增大的函数。

二者相乘
$
  rho(E) = 1/Z e^(-beta E) Gamma'(E)
$
就会出现一个峰值。峰值对应的能量叫做最可几能量，记为$E_m$，也就是系统最有可能出现的能量。

#figure(
  image("pic/2026-05-31-16-31-32.png", width: 50%),
  caption: [最可几能量分布],
)

#example(subname: [计算单原子分子理想气体的$E_m$])[
  单原子分子理想气体的平动动能
  $
    E = sum_(i=1)^3N p_i^2/(2m)
  $
  得到$vb(Omega)(E)$
  $
    vb(Omega)(E) = integral_(H <= E) product_i dd(p_i) dd(q_i) = V^N integral_(sum_i p_i^2 <= 2m E) product_i dd(p_i)
  $
  考虑到$n$维球体积为
  $
    V_n(R) = (2 pi^(pi/2))/Gamma(n/2) 1/n R^n = (pi^(n/2) R^n) / Gamma(n/2 + 1)
  $
  得到
  $
    vb(Omega)(E) = V^N (2 pi m E)^((3N)/2) / Gamma((3N)/2 + 1)
  $
  态密度为
  $
    Gamma(E) = 1/(N! h^f) vb(Omega)'(E)
  $
  能量分布为
  $
    rho(E) = 1/Z e^(-beta E) Gamma(E) = 1/Z e^(-beta E) 1/(N! h^f) vb(Omega)'(E)
  $
  求极值
  $
    eval(pdv(rho, E))_(E_m) = 0 => - beta e^(-beta E_m) vb(Omega)'(E_m) + e^(-beta E_m) vb(Omega)''(E_m) = 0
  $
  得到
  $
    E_m = ((3N)/2 - 1) k_B T approx 3N/2 k_B T
  $
  最可几能量几乎等于系综平均能量
]

=== 广义能量均分原理

#theorem(subname: [广义能量均分原理])[
  设$xi$是$E(q,p,y)$中某一个广义坐标或广义动量，且当$xi → plus.minus oo$或上下限时，$E → oo$，则
  $
    overline(xi pdv(E, xi)) = k_B T
  $
]
注意：在*能量准连续近似*下得到的，故低温时不适用，这时要考虑能量分立性。

#proof[
  注意到
  $
    overline(xi pdv(E, xi)) & = (integral product dd(q_i, p_i) xi pdv(E, xi) e^(-beta E)) / (integral product dd(q_i, p_i) e^(-beta E)) \
  $
  分子
  $
    integral product dd(q_i, p_i) xi pdv(E, xi) e^(-beta E)
  $
  注意到
  $
    pdv(e^(-beta E), xi) = - beta e^(-beta E) pdv(E, xi)
  $
  把$dd(q_i, p_i)$中的$xi$单独拿出来
  $
      & integral product dd(q_i, p_i) integral xi pdv(E, xi) e^(-beta E) \
    = & integral product dd(q_i, p_i) -1/beta integral xi dd(e^(-beta E), xi) \
    = & -1/beta integral product dd(q_i, p_i) (eval(xi e^(-beta E))_(xi=-oo)^(xi=+oo) - integral e^(-beta E) dd(xi)) \
    = & 1/beta integral product dd(q_i, p_i) e^(-beta E)
  $
  从而得到
  $
    overline(xi pdv(E, xi)) = k_B T
  $
]

#newpara()

普通能量均分定理是特例：当$E(q,p,y)$中某个广义坐标或动量$xi_i$的幂次为$1$时，能量均分定理就变成了
#theorem(subname: [能量均分定理])[
  设
  $
    E(q, p, y) = sum_(i=1)^n C_i xi_i^l
  $
  其中$C_i$是常数，则有
  $
    overline(E) = n/l k_B T
  $
]

#proof[
  可知
  $
    xi_i pdv(E, xi_i) = l C_i xi_i^l
  $
  以及
  $
    sum_(i=1)^n xi_i pdv(E, xi_i) = l E
  $
  从而
  $
    sum_(i=1)^n overline(xi_i pdv(E, xi_i)) = l overline(E) = n k_B T
  $
]

#example(subname: [近独立粒子系统，$N$个粒子的能量均分])[
  - 非相对论情形
    $
      E prop p^2
    $
    有
    $
      overline(E) = 3/2 N k_B T
    $
    其中$n=3N,l=2$
  - 极端(超)相对论情形
    $
      epsilon = c p = c sqrt(p_x^2 + p_y^2 + p_z^2)\
      E = sum_(i=1)^N epsilon_i = c sum_(i=1)^N sqrt(p_(x,i)^2 + p_(y,i)^2 + p_(z,i)^2)
    $
    则有
    $
      pdv(E, p_(i,j)) = c p_(i,j) / sqrt(p_(i,x)^2 + p_(i,y)^2 + p_(i,z)^2)
    $
    从而
    $
      sum_(i=1)^N sum_(j=x,y,z) p_(i,j) pdv(E, p_(i,j)) = c sum_(i=1)^N sqrt(p_(i,x)^2 + p_(i,y)^2 + p_(i,z)^2) = E
    $
    两边平均，用原理得
    $
      overline(E) = 3 N k_B T
    $
]

== 实际气体（非理想气体）的物态方程

考虑$N$个全同分子，体积$V$，压强$p$。体系能量可以分成三部分：
$
  E = E_((t)) + E_((i)) + Phi
$
其中：
- $
    E_((t)) = sum_(i=1)^(3N) p_i^2/(2m)
  $
是分子质心平动能，只和动量$p_i$有关；
- $Phi$是分子间相互作用势，只和分子位置$x_i$有关；
- $E_((i))$是分子内部运动能量，比如转动、振动、电子激发等，与$x_i,p_i$无关。

所以正则配分函数可以分解成几部分：
$
  Z = 1/(N! h^(3N)) integral product_(i=1)^(3N) dd(p_i) e^(-beta E_((t))) integral product_(i=1)^(3N) dd(q_i) e^(-beta Phi) Z_((i))
$
真正决定物态方程中压强修正的是位置积分
$
  Q = integral product_(i=1)^(3N) dd(q_i) e^(-beta Phi)
$
#newpara()
$
  p = 1/beta pdv(ln Z, V) = 1/beta pdv(ln Q, V)
$
也就是说，非理想气体相对于理想气体的修正，主要来自分子间相互作用势$Phi$。只考虑分子间两两相互作用，其作用势$u$只与分子间距离有关：
$
  Phi = sum_(1<=i<j<=N) phi(r_(i,j)) = sum_(i<j) phi_(i j)
$
其中
$
  r_(i,j) = sqrt((x_i - x_j)^2 + (y_i - y_j)^2 + (z_i - z_j)^2)
$
典型分子间势，例如Lennard-Jones型势为
$
  phi(r) = epsilon ((sigma/r)^12 - 2(sigma/r)^6)
$
它有重要特征：
- 当$r$很小时，势能迅速变为正无穷，表示强排斥；
- 当$r$稍大时，势能为负，表示吸引；
- 当$r→∞$时，势能趋于0，说明分子间作用是短程的。

引入 Mayer 函数
$
  f_(i j) = f(r_(i j)) = e^(-beta phi_(i j)) - 1 -> cases(
    0 & " "r_(i j)->oo (phi_(i j)->0),
    -1 & " "r_(i j)->0 (phi_(i j)->oo),
  )
$
从而
$
  e^(-beta Phi) = product_(i<j) (1 + f_(i j))
$
Mayer函数的物理意义是：它衡量分子$i,j$之间相互作用对理想气体情形的偏离。

展开$Q$
$
  Q & = integral product_i dd(q_i) product_(i<j) (1 + f_(i j)) \
    & = integral product_i dd(q_i) (1 + sum_(i<j) f_(i j) + sum_(i<j, k<l, (i,j)!=(k,l)) f_(i j) f_(k l) + ...)
$
$f_(i j)$是两分子接近程度的量度，第三项仅当两个分子对分别很接近时、或三个分子都很接近时才有贡献，通常可以忽略。于是只保留前两项
$
  Q = V^N + 1/2N(N-1) V^(N-2) integral f(r_12) dd(vb(r)_1, vb(r)_2)
$
引入分子1与2的质心坐标$vb(R)$和相对位置$vb(r)$
$
  vb(R) = (m_1 vb(r)_1 + m_2 vb(r)_2) / (m_1 + m_2), vb(r) = vb(r)_1 - vb(r)_2
$
则可证
$
  dd(vb(r)_1, vb(r)_2) = dd(vb(R), vb(r))
$
从而
$
  integral f(r_12) dd(vb(r)_1, vb(r)_2) = integral f(r) dd(vb(R), vb(r)) = V integral f(r) dd(vb(r)) = V dot (-2 a_2 (T))
$
其中
$
  a_2(T) = - 1/2 integral dd(vb(r)) f(r) = - 2 pi integral_0^oo r^2 (e^(-beta phi(r)) - 1) dd(r)
$
是第二级Virial系数，不含$V$，因为$r->oo, phi->0$，该项无贡献。

由此可以推出非理想气体物态方程
$
  Q = V^N (1 - N^2/V a_2(T))
$
在低密度条件下
$
  N^2/V a_2(T) << 1
$
取对数有
$
  ln Q = N ln V + ln(1 - N^2/V a_2(T)) approx N ln V - N^2/V a_2(T)
$
压强为
$
  p = 1/beta pdv(ln Q, V) = 1/beta (N/V + N^2/V^2 a_2(T))
$
得到
$
  (p v)/(k_B T) = 1 + (a_2(T))/v, v = V/N
$
这就是低密度非理想气体的virial方程到第二项的形式。

可以用用一个简化的 van der Waals型势来计算$a_2(T)$
$
  phi(r) = cases(
    oo & " "r < r_0,
    - phi_0 (r_0/r)^n & " "r > r_0,
  ), phi_0 > 0, n > 6
$
这是London 1930年证明的瞬时电偶极矩之间力。代入有
$
  a_2(T) & = - 2 pi integral_0^oo r^2 (e^(-beta phi(r)) - 1) dd(r) \
         & = - 2 pi integral_0^r_0 [0-1] - 2 pi integral_(r_0)^oo r^2 (e^(-beta phi(r)) - 1) dd(r) \
         & = b - (a(T))/(k_B T)
$
其中$b$来自硬核排斥，表示排除体积
$
  b = (2pi)/3 r_0^3 = 4 v_0, v_0 = (4pi)/3 r_0^3
$
$a$来自分子间吸引，表示引力强度。

由此可以得到Van der Waals方程
$
  (p v)/(k_B T) = 1 + b/v - a(T)/(k_B T v)
$
当$b/v << 1$有
$
  1 + b/v = 1/(1 - b/v)
$
从而
$
  (p v)/(k_B T) = v/(v - b) - a(T)/(k_B T v)
$
即
$
  (p + a(T)/v^2) (v - b) = k_B T
$

== Ising模型

铁磁性物质，比如：Fe, Ni, Co在低温下会出现自发磁化。也就是说，即使外磁场为零，系统仍然可以有非零磁矩：$M!=0$，这种现象叫自发磁化。

但是当温度升高到某个临界温度以上时，自发磁化消失：
$
  T > T_c => M = 0
$
这里$T_c$叫Curie温度。
- 高温$T>T_c$时，自旋方向比较混乱，总磁矩平均为零
- 低温$T<T_c$时，自旋趋向同向排列，总磁矩非零。
Ising模型就是为了用一个尽量简单的模型解释这种现象。

=== Ising模型

Ising 模型把磁性物质看成一个晶格。每个格点上有一个自旋变量：
$
  S_i = plus.minus 1
$
其中$+1$表示自旋向上，$-1$表示自旋向下。所以一个微观状态就是所有格点自旋取值的集合：
$
  {S_i} = (S_1, S_2, ..., S_N)
$
对应能量
$
  E{S_i} = - sum_(i j "最近邻对相互作用") epsilon_(i j) S_i S_j - mu_0 mu H sum_i S_i
$
#newpara()

Ising模型在一、二维严格是可解的，由Ising和Onsager给出。

设各间同性，则
$
  epsilon_(i j) = epsilon
$
则
$
  E{S_i} = - epsilon sum_{i j} S_i S_j - mu_0 mu H sum_i S_i
$
如果
- $epsilon > 0$，表示铁磁性，基态相邻自旋倾向于同向排列；
- $epsilon < 0$，表示反铁磁性，基态相邻自旋倾向于反向排列。

配分函数
$
  Z(H, beta) = sum_{S_i} e^(-beta E{S_i})
$
能量中有$S_i S_j$这种相互作用项，自旋之间不是独立的，所以配分函数不能简单分解成：
$
  Z = z_0^n
$
只有在某些特殊情形下，比如一维、二维无外场，可以严格求解。三维 Ising 模型一般没有简单解析解。

有配分函数既可以计算宏观量
- 能量
  $
    overline(E)(H, T) = - pdv(ln Z, beta)
  $
- 热容
  $
    C_H (H,T) = dv(overline(E), T)_H
  $
- 磁矩
  $
    M(H, T) = mu overline(sum_i S_i) = 1/(beta mu_0) pdv(ln Z, H)
  $
  若$M(0,T)!=0$，称自发磁化，铁磁性

=== 平均场近似(Bragg-Williams)近似

真实Ising模型中，每个自旋受到周围邻居自旋的影响。作用于$S_i$的力为
$
  - pdv(E, S_i) = mu_0 mu H + sum_j epsilon_(i j) S_j
$
作用于$S_i$的等效磁场$H_i$为
$
  H_i = H + 1/(mu_0 mu) sum_j epsilon_(i j) S_j
$
平均场近似的关键一步是：
$
  S_j -> macron(S_j) = sum_j S_j / z
$
也就是不再关心每个邻居自旋的具体涨落，而是假设它们都等于平均自旋。其平均值
$
  overline(H_i) = h + 1/(mu_0 mu) sum_j epsilon_(i j) overline(S_j) = H + z epsilon overline(S_j) / (mu_0 mu)
$
其中$z$是任一给定格点的最近邻格点数：对二维方阵是4、对三维简单立方是6、对三维体心立方是8。由于$overline(S_j)$与$j$无关，$overline(H_i)$也与$i$无关，记为$overline(H)$，则
$
  overline(H) = H + (z epsilon overline(S)) / (mu_0 mu)
$
用其代替$H_i$而忽略其涨落就是*平均场近似*。这样就把*相互作用自旋系统化为近独立的自旋系统*。

平均场近似下，配分函数
$
  Z = sum_{S_i} e^(-beta E{S_i}) = product_i sum_{S_i} e^(beta mu_0 mu overline(H) S_i)
$
或者
$
  Z = z_0^N, z_0 = e^(beta mu_0 mu overline(H)) + e^(- beta mu_0 mu overline(H)) = 2 cosh(beta mu_0 mu overline(H))
$
#newpara()
磁矩为
$
  M & = 1/beta pdv(ln Z, mu_0 H) = N/beta pdv(, mu_0 H) ln z_0\
  & = N mu (e^(beta mu_0 mu overline(H)) - e^(- beta mu_0 mu overline(H))) / (e^(beta mu_0 mu overline(H)) + e^(- beta mu_0 mu overline(H))) \
  & = N mu tanh(beta mu_0 mu overline(H)) = N mu overline(S)
$
得到自洽方程
$
  overline(S) = tanh(beta mu_0 mu (H + z epsilon overline(S) / (mu_0 mu)))
$
它的意思是：平均自旋$overline(S)$决定有效磁场，而有效磁场又决定平均自旋。所以$overline(S)$不能直接给出，而要解这个自洽方程。

自发磁化$H = 0, overline(S) != 0$，自洽方程变为
$
  overline(S) = tanh(beta z epsilon overline(S))
$
超越方程，总有一个$overline(S) = 0$的解，对应没有磁化。但是否存在非零解，取决于温度。
- $beta epsilon z < 1$：只有$overline(S) = 0$一个解，系统没有自发磁化，顺磁态
- $beta epsilon z > 1$：有三个解，$overline(S) = 0$是一个局部极小值，对应不稳定态；另外两个非零解是局部极大值，对应稳定态，系统有自发磁化，铁磁态。
临界温度为
$
  beta epsilon z = 1 => T_c = (epsilon z) / k_B
$
#figure(
  grid(columns: (1fr, 1fr))[
    #figure(
      image("pic/2026-05-31-18-20-28.png", width: 100%),
      numbering: none,
    )
  ][
    #figure(
      image("pic/2026-05-31-18-20-49.png", width: 100%),
      numbering: none,
    )
  ],
  caption: [自发磁化$overline(S)$和比热随着$T$的变化],
)

平均场近似不考虑涨落，所以会高估有序相的稳定性。因为涨落会破坏自旋有序排列，尤其在低维系统中非常重要。不同维度下的临界温度如下：
#figure(
  three-line-table[
    | \ | 平均场 | 严格解 |
    | --- | --- | --- |
    | 一维晶格 | $T_c = (2 epsilon)/k_B$ | $T_c = 0$ |
    | 二维方阵 | $T_c = (4 epsilon)/k_B$ | $T_c = (2.3 epsilon)/k_B$ |
    | 三维简单立方 | $T_c = (6 epsilon)/k_B$ | $T_c = (4 epsilon)/k_B$ |
    | \ | 不考虑涨落 | 考虑涨落 |
  ],
)
有
$
  T_(c)^"平均场" > T_(c)
$
涨落破坏有序。
