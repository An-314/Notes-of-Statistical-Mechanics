#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch


= Boltzmann统计理论

我们在这一章研究理想气体与理想固体的宏观性质。

- *理想气体：*粒子间作用弱，非简并条件$a_i/omega_i << 1$，对应*半经典分布*
- *理想固体：*定域粒子，对应*Boltzmann分布*

== 宏观量的统计表达式

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
#newpara()

*内能*
$
  U = sum_i a_i epsilon_i = sum_i omega_i epsilon_i e^(- alpha - beta epsilon_i) = - e^(- alpha) pdv(Z, beta) = -N pdv(ln Z, beta)
$
从而
$
  U = - pdv(ln Z, beta)
$
下面求物态方程与熵，对于封闭系统
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
