#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch

= 非平衡态统计理论初步

前面几章主要研究平衡态，比如正则分布、巨正则分布、理想气体、量子气体等。平衡态的核心特点是*宏观量不随时间变化*，系统可以用配分函数来描述。

但实际中大量现象是非平衡的，例如热传导、扩散、黏滞、气体从一边流向另一边等。这些过程通常是不可逆的。本章主要讨论：
- 稀薄气体的非平衡性质
- 分子运动论方法
本章的中心问题是：$f(vb(r),vb(v),t)$，即在位置$vb(r)$、速度$vb(v)$、时间$t$时，单位体积内具有速度$vb(v)$的粒子数密度，即分布函数。非平衡统计理论的目标，就是研究这个分布函数如何随时间变化。后面会引出 Boltzmann 方程和 H 定理。

== 气体分子的碰撞频率

气体分子通过碰撞使气体达致平衡态。碰撞频率是非平衡统计理论的一个重要参数。我们先来估算一下碰撞频率。

=== 碰壁数

#definition(subname: [碰壁数])[
  $Gamma$为单位时间内碰到单位面积器壁上的分子数，叫碰壁数。
]

#definition(subname: [分布函数])[
  $f(vb(r),vb(v),t) dd(vb(v), 3)$是在位置$vb(r)$、时间$t$时，单位体积内具有速度$vb(v) -> vb(v) + dd(vb(v), 3)$的粒子数密度。
]

#newpara()
如果器壁的法向取为$x$方向，那么只有速度满足$v_x > 0$的分子才能撞到这面墙。于是碰壁数为

$
  Gamma(vb(r,), t) = integral_(v_x > 0) v_x f(vb(r), vb(v), t) dd(vb(v), 3)
$
#newpara()

如果气体处于平衡态，速度服从 Maxwell 分布，则可以算出经典结果：
$
  f(vb(v)) = n (m/(2 pi k_B T))^(3/2) e^(- m vb(v)^2/(2 k_B T))\
  Gamma = n overline(v) / 4
$
其中$n$是分子数密度，$overline(v) = sqrt((8 k_B T)/(pi m))$是平均速率。

=== 碰撞频率

考虑稀薄气体，只计两体碰撞。也就是说，每次碰撞只涉及两个分子，三体同时碰撞的概率很小，可以忽略。

采用模型：弹性刚球模型。也就是把分子看成硬球：无摩擦、无形变、弹性碰撞。

考虑两类分子的质量、直径、速度
- 分子1：$m_1, sigma_1, vb(v)_1$
- 分子2：$m_2, sigma_2, vb(v)_2$
单位时间内，平均一个分子1与分子2的碰撞次数$theta_12$，称*碰撞频率*。

先考虑指定速度的分子1的碰撞。

单位时间内，一个速度$vb(v)_1$的分子1与任意速度的分子2碰撞次数
$
  theta_12 (vb(r), vb(v)_1, t)
$
碰撞只与相对速度$vb(g)_12 = vb(v)_1 - vb(v)_2$有关。打中分子1条件，分子2位于柱体内；即发生碰撞的有效截面积
$
  pi sigma_12^2, sigma_12 = (sigma_1 + sigma_2)/2
$
各向同性，即适用于所有方向的。在单位时间内，分子2相对于分子1扫过一个柱体，柱体体积为
$
  pi sigma_12^2 abs(vb(g)_12)
$
所以，一个速度为$vb(v)_1$的分子1，在单位时间内与速度在$vb(v)_2 -> vb(v)_2 + dd(vb(v)_2, 3)$范围内的分子2碰撞次数为
$
  theta_12 (vb(v)_1) = pi sigma_12^2 Gamma = pi sigma_12^2 integral abs(vb(g)_12) f_2 (vb(r), vb(v)_2, t) dd(vb(v)_2, 3)
$
注意：以上采用了*分子混沌假设*（Stosszahlansatz），即分子速度分布是独立的。它的物理含义是：在稀薄气体中，两分子在碰撞前彼此没有记忆，速度分布可以看作独立。
$
  f(vb(r), vb(v)_1, vb(v)_2, t) = f_1 (vb(r), vb(v)_1, t) f_2 (vb(r), vb(v)_2, t)
$
严格应该用$f(vb(r), vb(v)_1, vb(v)_2, t)$，但分子混沌假设使得它可以分解成两个单分子分布函数的乘积。

现在单位时间内，平均一个分子1与分子2碰撞次数
$
  theta_12 (vb(r), t) &= (integral dd(vb(v)_1, 3) theta_12 (vb(r), vb(v)_1, t) f_1 (vb(r), vb(v)_1, t)) / (integral dd(vb(v)_1, 3) f_1 (vb(r), vb(v)_1, t))\
  &= 1/(n_1 (vb(r), t)) integral dd(vb(v)_1, 3) theta_12 (vb(r), vb(v)_1, t) f_1 (vb(r), vb(v)_1, t)\
  &= (pi sigma_12^2) / n_1 (vb(r), t) integral dd(vb(v)_1, 3) integral dd(vb(v)_2, 3) abs(vb(g)_12) f_1 (vb(r), vb(v)_1, t) f_2 (vb(r), vb(v)_2, t)
$
碰撞截面积$×$相对速度$×$对方分子密度，就是碰撞频率的来源。

=== 两体碰撞运动学

考虑两个分子弹性碰撞：
$
  (m_1, vb(v)_1) + (m_2, vb(v)_2) -> (m_1, vb(v)'_1) + (m_2, vb(v)'_2)
$
有动量守恒
$
  m_1 vb(v)_1 + m_2 vb(v)_2 = m_1 vb(v)'_1 + m_2 vb(v)'_2
$
以及能量守恒
$
  1/2 m_1 vb(v)_1^2 + 1/2 m_2 vb(v)_2^2 = 1/2 m_1 vb(v)'_1^2 + 1/2 m_2 vb(v)'_2^2
$
一共6个未知数。动量守恒给3个方程，能量守恒给1个方程，总共只有4个约束。所以末态速度不能仅靠守恒律完全确定，还需要指定碰撞方向，比如单位矢量$vu(n)$或者散射角$theta, phi$，它表示两球接触时球心连线的方向，也等价于指定散射方向。

对于*无摩擦弹性硬球*，碰撞冲量沿着两球心连线方向，也就是沿着$vb(n)$。因此速度变化只能沿$vu(n)$方向：
$
  vb(v)'_1 - vb(v)_1 = lambda_1 vu(n) \
  vb(v)'_2 - vb(v)_2 = lambda_2 vu(n)
$
这里$lambda_1,lambda_2$是待定系数。代入动量守恒方程，得到
$
  m_1 lambda_1 + m_2 lambda_2 = 0
$
代入能量守恒方程，得到
$
  m_1 lambda_1 (vb(v)'_1 + vb(v)_1) dot vu(n) + m_2 lambda_2 (vb(v)'_2 + vb(v)_2) dot vu(n) = 0
$
从而
$
  (lambda_1 + 2 vb(v)_1 dot vu(n)) - (lambda_2 + 2 vb(v)_2 dot vu(n)) = 0
$
从而解得
$
  lambda_1 = (2 m_2)/(m_1 + m_2) (vb(v)_2 - vb(v)_1) dot vu(n) \
  lambda_2 = (2 m_1)/(m_1 + m_2) (vb(v)_1 - vb(v)_2) dot vu(n)
$
从而有
$
  vb(v)'_1 = vb(v)_1 + (2 m_2)/(m_1 + m_2) ((vb(v)_2 - vb(v)_1) dot vu(n)) vu(n) \
  vb(v)'_2 = vb(v)_2 + (2 m_1)/(m_1 + m_2) ((vb(v)_1 - vb(v)_2) dot vu(n)) vu(n)
$
其有对称性：
- 碰撞前后相对速度不变
  $
    vb(v)'_1 - vb(v)'_2 = vb(v)_1 - vb(v)_2 + 2((vb(v)_2 - vb(v)_1) dot vu(n)) vu(n)
  $
  从而
  $
    (vb(v)'_1 - vb(v)'_2)^2 = (vb(v)_1 - vb(v)_2)^2
  $
  即
  $
    g'_21 = g_21
  $
- 碰撞前后相对速度沿碰撞方向变号，垂直方向不变
  $
    (vb(v)'_1 - vb(v)'_2) dot vu(n) = - (vb(v)_1 - vb(v)_2) dot vu(n)\
    (vb(v)'_1 - vb(v)'_2) times vu(n) = (vb(v)_1 - vb(v)_2) times vu(n)
  $
- 原碰撞与逆碰撞
  $
    vb(v)_1 = vb(v)'_1 + (2 m_2)/(m_1 + m_2) ((vb(v)'_2 - vb(v)'_1) dot vu(n)') vu(n)' \
    vb(v)_2 = vb(v)'_2 + (2 m_1)/(m_1 + m_2) ((vb(v)'_1 - vb(v)'_2) dot vu(n)') vu(n)'
  $
  其中
  $
    vu(n)' = - vu(n)
  $
  因此有如下对称性
  $
    (m_1, vb(v)_1) + (m_2, vb(v)_2) ->^vu(n) (m_1, vb(v)'_1) + (m_2, vb(v)'_2) \
    (m_1, vb(v)'_1) + (m_2, vb(v)'_2) ->^(-vu(n)) (m_1, vb(v)_1) + (m_2, vb(v)_2)
  $

== Boltzmann输运方程

我们下面讨论分布函数如何随时间变化。
$
  f(vb(r), vb(v), t) dd(vb(v), 3) dd(vb(r), 3)
$
就描述了$(vb(r), vb(v))$处$mu$空间体积元$dd(vb(r), 3) dd(vb(v), 3)$内的粒子数。

我们将分子作为经典粒子处理，从而只适用于高$T$情形
$
  n lambda_T^3 << 1, lambda_T = h/sqrt(2 pi m k_B T)
$
所以 Boltzmann 输运方程主要适用于*高温、低密度的稀薄气体*。

*稀薄气体近似*：分子除碰撞短时间隔处是自由的，只有很短时间发生碰撞。

因此$f$随时间的变化分成两部分：
$
  pdv(f, t) = (pdv(f, t))_"drift" + (pdv(f, t))_"collision"
$
- 漂移项：分子运动导致位置$vb(r)$改变，外场导致速度$vb(v)$改变。
- 碰撞项：分子碰撞导致速度$vb(v)$改变。
碰撞造成的变化被分为自由运动造成的变化以及外力造成的变化。

=== 漂移项

$t$时刻$(vb(r),vb(v))$处$dd(vb(r), 3) dd(vb(v), 3)$中分子，在$t+dd(t)$时刻：
- 有的已离开该区间
- 有的从别区间进入该区间
下面求净变化，考虑$mu$空间$dd(x, y, z, v_x, v_y, v_z)$体积元。

先只考虑位置变化，即分子以速度$vb(v)$穿过相空间体积元。



在时间$dd(t)$内，由左侧$x$处垂直$x$轴的平面进入体积元的分子数为
$
  f(x,y,z,v_x,v_y,v_z,t) dd(vb(v)) dd(y, z) v_x dd(t)
$
从右侧$x+dd(x)$面离开的分子数为
$
  f(x+dd(x),y,z,v_x,v_y,v_z,t) dd(vb(v)) dd(y, z) v_x dd(t)
$
净增加
$
    & (f(x,y,z,v_x,v_y,v_z,t) - f(x+dd(x),y,z,v_x,v_y,v_z,t)) dd(vb(v)) dd(y, z) v_x dd(t) \
  = & - (pdv(f, x) dd(x)) dd(vb(v)) dd(y, z) v_x dd(t) = - v_x pdv(f, x) dd(vb(v)) dd(vb(r)) dd(t)
$
把$x,y,z$三个方向都加起来，得到位置漂移项：
$
  - vb(v) dot grad f dd(vb(r)) dd(vb(v)) dd(t)
$
这项的物理意义是：如果某处$f$在空间中有梯度，分子流动会把分布函数搬运走。

再考虑速度变化造成的漂移项。

如果存在外力
$
  vb(F)=m vb(a)
$
分子的速度会随时间改变。类似地，在速度空间中，分子会穿过$dd(v_x, v_y, v_z)$的边界。

在$dd(t)$内，由左侧$v_x$处垂直$v_x$轴的平面进入体积元的分子数为
$
  f(x,y,z,v_x,v_y,v_z,t) dd(vb(r)) dd(v_y, v_z) eval(a_x)_(v_x) dd(t)
$
从右侧$v_x+dd(v_x)$面离开的分子数为
$
  f(x,y,z,v_x+dd(v_x),v_y,v_z,t) dd(vb(r)) dd(v_y, v_z) eval(a_x)_(v_x+dd(v_x)) dd(t)
$
净增加
$
  & (f(x,y,z,v_x,v_y,v_z,t) eval(a_x)_(v_x) - f(x,y,z,v_x+dd(v_x),v_y,v_z,t) eval(a_x)_(v_x+dd(v_x))) dd(vb(r)) dd(v_y, v_z) dd(t) \
  = & - pdv(, v_x) (a_x f) dd(vb(r)) dd(vb(v)) dd(t)
$
三个速度分量合起来：
$
  - grad_v dot (vb(a) f) dd(vb(r)) dd(vb(v)) dd(t)
$
因此漂移项总共是
$
  (pdv(f, t))_"drift" = - vb(v) dot grad_r f - grad_v dot (vb(a) f)
$
如果满足
$
  grad_v dot vb(a) = 0
$
例如外力与速度无关，或者Lorentz力这种对速度散度为零的力，则
$
  (pdv(f, t))_"drift" = - vb(v) dot grad_r f - vb(a) dot grad_v f
$

=== 碰撞项

碰撞项要统计两种过程。

- 一种叫*原碰撞*：
  $
    vb(v), vb(v)_1 -> vb(v)', vb(v)'_1
  $
  $dd(vb(r), vb(v))$中的分子以速度$vb(v)$碰撞后变为$vb(v)'$，这使得$f(vb(r) ,vb(v),t)$减少。
- 另一种叫*逆碰撞*：
  $
    vb(v)', vb(v)'_1 -> vb(v), vb(v)_1
  $
  也就是别的速度状态的分子碰撞后进入$vb(v)$，这使得$f(vb(r) ,vb(v),t)$增加。
所以碰撞项一定有结构：进入项−离开项(gain−loss)。如上所示考虑弹性刚球碰撞模型以及分子混沌假设。

先考虑原碰撞

$dd(t)$内，$dd(vb(r), vb(v))$中的分子以速度$vb(v)$与速度在$vb(v)_1 -> vb(v)_1 + dd(vb(v)_1, 3)$范围内的分子发生碰撞。方向为$vu(n)$，相对速度$vb(g)$和$vu(n)$的夹角为$theta$，分子直径为$sigma$，则单位时间内碰撞扫过的有效体积正比于
$
  g dd(t) sigma^2 cos theta dd(omega)
$
于是定义
$
  Lambda = sigma^2 abs(vb(v)_1 - vb(v)) cos theta
$
分子数目减少
$
    & f(vb(r), vb(v), t) dd(r) dd(v) f(vb(r), vb(v)_1, t) dd(vb(v)_1) sigma^2 dd(Omega) g dd(t) cos theta \
  = & f f_1 Lambda dd(r) dd(v) dd(vb(v)_1) dd(t) dd(Omega)
$
其中
$
  f = f(vb(r), vb(v), t), f_1 = f(vb(r), vb(v)_1, t)
$
积分得到$dd(t)$内，原碰撞使$dd(vb(r), vb(v))$中分子数目减少了
$
  dd(t, vb(r), vb(v)) integral dd(Omega) integral dd(vb(v)_1) f f_1 Lambda
$
#newpara()

现在考虑逆碰撞，$dd(t)$内$dd(vb(r), vb(v)')$中的分子以另一速度$vb(v)'_1 -> vb(v)'_1 + dd(vb(v)'_1, 3)$范围内的分子发生碰撞，碰撞后进入$dd(vb(r), vb(v))$中。类似地，数目增加数为
$
    & f(vb(r), vb(v)', t) dd(vb(r), vb(v)') f(vb(r), vb(v)'_1, t) dd(vb(v)'_1) sigma^2 dd(Omega) g' dd(t) cos theta \
  = & f' f'_1 Lambda' dd(vb(r)) dd(vb(v)') dd(vb(v)'_1) dd(t) dd(Omega)
$
由原逆碰撞对称性可证
$
  dd(vb(v)') dd(vb(v)'_1) = dd(vb(v)) dd(vb(v)_1), Lambda' = Lambda
$
从而上式为
$
  & f' f'_1 Lambda dd(vb(r)) dd(vb(v)) dd(vb(v)_1) dd(t) dd(Omega)
$
积分得到$dd(t)$内，逆碰撞使$dd(vb(r), vb(v))$中分子数目增加了
$
  dd(t, vb(r), vb(v)) integral dd(Omega) integral dd(vb(v)_1) f' f'_1 Lambda
$
因此碰撞项为
$
  (pdv(f, t))_"collision" = integral dd(Omega) integral dd(vb(v)_1) (f' f'_1 - f f_1) Lambda
$

这样就得到了Boltzmann输运方程：
#theorem(subname: [Boltzmann输运方程])[
  $
    dv(f, t) = pdv(f, t) + (vb(v) dot grad_r + vb(a) dot grad_v)f = integral dd(Omega) integral dd(vb(v)_1) (f' f'_1 - f f_1) Lambda
  $
]
其中$theta in [0,pi/2]$。

Boltzmann输运方程是一个非线性积分微分方程，一般难求解。它描述了分布函数随时间的演化。它的左边是漂移项，右边是碰撞项。这个方程是非平衡统计物理的核心方程，可以用来研究非平衡态的性质和演化。

可直接推广到多种分子系统，对两种分子系统，设分布函数为$f(vb(r), vb(v), t)$和$F(vb(r), vb(v), t)$，则Boltzmann输运方程为
$
  pdv(f, t) + (vb(v) dot grad_r + vb(a)_1 dot grad_v)f = integral dd(Omega) integral dd(vb(v)_1) (f' f'_1 - f f_1) Lambda_11 + integral dd(Omega) integral dd(vb(v)_1) (f' F'_1 - f F_1) Lambda_12\
  pdv(F, t) + (vb(v) dot grad_r + vb(a)_2 dot grad_v)F = integral dd(Omega) integral dd(vb(v)_1) (F' F'_1 - F F_1) Lambda_22 + integral dd(Omega) integral dd(vb(v)_1) (F' f'_1 - F f_1) Lambda_21
$
其中
$
  Lambda_(i j) = sigma_(i j)^2 abs(vb(v)_1 - vb(v)) cos theta\
  sigma_(i j) = (sigma_i + sigma_j)/2
$
$vb(a)_i$是第$i$种分子的加速度。

以上方程弹性刚球碰撞模型中得到，实际上可不受此限制：
$
  pdv(f, t) + (vb(v) dot grad_r + vb(a) dot grad_v)f = integral dd(Omega) integral dd(vb(v)_1) (f' f'_1 - f f_1) g dv(Sigma, Omega)
$
可以更一般地用微分散射截面表示。

以上推导碰撞项时，采用了分子混沌假设，任何两个分子的速度分布无关联，是相互独立的。不做此假设，得到以下精确表达式：
$
  pdv(f, t) + (vb(v) dot grad_r + vb(a) dot grad_v)f = integral dd(Omega) integral dd(vb(v)_1) (F(vb(r), vb(v)', vb(v)'_1, t) - F(vb(r), vb(v), vb(v)_1, t)) abs(vb(v)_1 - vb(v)) dv(Sigma, Omega)
$
其中$F(vb(r), vb(v), vb(v)_1, t)$两粒子关联函数。分子混沌假设相当于
$
  F(vb(r), vb(v), vb(v)_1, t) = f(vb(r), vb(v), t) f(vb(r), vb(v)_1, t)
$
以上Boltzmann方程对稀薄气体是精确的，但方程不封闭。即：为了求单粒子分布函数，需先求出两粒子关联函数。为求$N-1$粒子关联函数，要先求出$N$粒子关联函数。（BBGKY Hierarchy, Bogoliubov-Born-Green-Kirkwood-Yvon）

== Boltzmann H 定理

这一节的核心问题是：从 Boltzmann 输运方程出发，说明稀薄气体为什么会趋向平衡态。

定义：$H$函数为分布函数$f(vb(r), vb(v), t)$的泛函
$
  H = integral dd(vb(r)) integral dd(vb(v)) f(vb(r), vb(v), t) ln f(vb(r), vb(v), t)
$
Boltzmann H 定理是
#theorem(subname: [Boltzmann H 定理])[
  若$f(vb(r), vb(v), t)$满足Boltzmann输运方程，则
  $
    dv(H(t), t) <= 0
  $
  其中等号当且仅当$f' f'_1 = f f_1$
]

#proof[
  $
    dv(H(t), t) & = integral dd(vb(r)) integral dd(vb(v)) (1 + ln f) pdv(f, t) \
                & = integral dd(vb(r)) integral dd(vb(v)) (1 + ln f) (pdv(f, t)_"drift" + pdv(f, t)_"collision") \
  $
  先考虑漂移项
  $
    integral dd(vb(r)) integral dd(vb(v)) (1 + ln f) (pdv(f, t)_"drift") = - integral dd(vb(r)) integral dd(vb(v)) (1 + ln f) (vb(v) dot grad_r f + vb(a) dot grad_v f)
  $
  其中
  $
    - integral dd(vb(r)) integral dd(vb(v)) (1 + ln f) vb(v) dot grad_r f &= - integral dd(vb(v)) vb(v) dot integral dd(vb(r)) grad_r (f ln f)\
    &= - integral dd(vb(v)) (integral dd(vb(r)) grad_r dot (vb(v) f ln f)) = 0\
    &= - integral dd(vb(v)) vb(v) dot integral dd(vb(s)) f ln f\
    &= 0
  $
  其中第二个等号用到
  $
    div (phi vb(R)) = grad phi dot vb(R) + phi div vb(R)
  $
  其中$vb(v) f ln f$是表面项，再利用Gauss公式
  $
    integral dd(vb(r)) div vb(R) = integral dd(vb(s)) dot vb(R)
  $
  对于该表面积分：系统边界处没有净流出，或者$f$在无穷远处衰减足够快，那么表面积分为零。以及
  $
    - integral dd(vb(r)) integral dd(vb(v)) (1 + ln f) vb(a) dot grad_v f &= - integral dd(vb(r)) integral dd(vb(v)) grad_v dot (vb(a) f ln f) + integral dd(vb(r)) integral dd(vb(v)) f grad_v dot vb(a) \
    &= - integral dd(vb(r)) integral dd(vb(s)_v) dot (vb(a) f ln f) \
    &=0
  $
  这里我们假设$grad_v dot vb(a) = 0$，例如外力与速度无关，或者Lorentz力这种对速度散度为零的力。从而漂移项贡献为0。碰撞项贡献为
  $
    &integral.double dd(vb(r), vb(v)) integral.double dd(Omega, vb(v)_1) (1 + ln f) (f' f'_1 - f f_1) Lambda \
    =^(vb(v) <-> vb(v)_1)& integral.double dd(vb(r), vb(v)) integral.double dd(Omega, vb(v)_1) (1 + ln f_1) (f' f'_1 - f f_1)\
    =& 1/2 integral.double dd(vb(r), vb(v)) integral.double dd(Omega, vb(v)_1) (2 + ln(f f_1)) (f' f'_1 - f f_1) Lambda \
  $
  利用原、逆碰撞对称性，交换$vb(v)<->vb(v)', vb(v)_1<->vb(v)_1'$
  $
      & 1/2 integral.quad dd(vb(r), vb(v)', vb(v)'_1, Omega) (2 + ln(f' f'_1)) (f f_1 - f' f'_1) Lambda' \
    = & 1/2 integral.quad dd(vb(r), vb(v), vb(v)_1, Omega) (2 + ln(f' f'_1)) (f f_1 - f' f'_1) Lambda \
  $
  求和取半，得碰撞项贡献为
  $
    dv(H(t), t) = 1/4 integral.quad dd(vb(r), vb(v), vb(v)_1, Omega) (f' f'_1 - f f_1) ln((f' f'_1) / (f f_1)) Lambda <= 0
  $
  其中等号当且仅当$f' f'_1 = f f_1$。
]

碰撞使$f$改变，从而使$H$不断减小，当$H$达到极小值时，达到平衡态。从统计理论上说明了趋向平衡的不可逆性（$H$单调减）。不是自由运动使系统趋向平衡，而是碰撞项使系统趋向平衡。

可以证明：
$
  S = - k_B H + "const"
$
因此，$H$趋于极小与$S$趋于极大一致，$H$定理与$S$增原理相当，但有不同之处
- 对任意态可定义$H$，但热力学中$S$仅对平衡态有定义（可通过Boltzmann关系推广$S$定义）
- 熵增原理适用于任意孤立系，$H$定理前提：$f$满足Boltzmann输运方程，即分子混沌假设成立
- $H$定理给出了系统趋向平衡态的速度，熵增原理不能

$H$定理的统计特征：
$
  H = integral.double dd(vb(r), vb(v)) f ln f = N overline(ln f)
$
本身已经是由分布函数$f$得到的统计量。而$f$又是对大量分子的统计平均。所以这里有“两次平均”的含义：先由许多分子微观状态得到分布函数$f$；再由$f$计算出$H$。

此外，$H$随时间的改变也不是微观意义上的连续光滑变化。分子碰撞会使速度迅速改变，因此严格说
$
  dv(H(t), t) = (Delta H) / (Delta t)
$
这里的$Delta t$对宏观来说很小，但对微观碰撞时间来说已经很大。

如果Hamiltonian是动量的偶函数，那么微观力学方程具有时间反演对称性。也就是说，如果把所有粒子的速度同时反向，系统原则上可以沿原轨迹返回。但是$H$定理却说$H(t)$单调减小，表现出不可逆性。Boltzmann的解释是：$H$定理是统计性的。也就是说，平均而言，$H$减小的概率最大；并不绝对禁止$H$增大，只是$H$增大的概率极小。因此宏观不可逆性不是因为微观力学不可逆，而是因为在巨大自由度系统中，趋向平衡的微观状态数远远多于远离平衡的微观状态数。

Poincaré定理说：对于有限能量、有限范围的系统，经过足够长时间后，系统总会回到与初始状态无限接近的状态，这称为Poincaré循环。这似乎与$H$定理矛盾。因为如果系统总会回到初态，那么$H$不可能永远单调减小。Boltzmann的回答是：Poincaré周期极其漫长，远远超过实际观测时间。因此在实际观测时间内，系统回到初态的概率极小。对于宏观气体，这个时间尺度大到没有实际意义。所以$H$定理说的不可逆性，是在实际宏观观测时间尺度上的统计不可逆性。

== 细致平衡与平衡态的分布

=== 细致平衡(detailed balance)

Boltzmann H 定理表明：若分布函数满足Boltzmann输运方程，则达平衡时，有
$
  f f_1 = f' f'_1
$
这被称作*细致平衡条件*（detailed balance）。它的物理含义是：在平衡态，任一原碰撞发生的频率与其逆碰撞发生的频率相等。也就是说，对每一原碰撞，总有一逆碰撞抵消其影响。

Boltzmann方程是
$
  pdv(f, t) + (vb(v) dot grad_r + vb(a) dot grad_v)f = integral dd(Omega) integral dd(vb(v)_1) (f' f'_1 - f f_1) Lambda = (pdv(f, t))_"collision" = 0
$
从而
$
  pdv(f, t)= 0 =>^"H 定理" (pdv(f, t))_"collision" = 0 =>^"Boltzmann" (pdv(f, t))_"drift" = 0
$
也就是说系统达平衡时，漂移，碰撞引起的$f$变化各自抵消，达到平衡态。

=== 平衡态的分布函数

由细致平衡条件得
$
  ln f + ln f_1 = ln f' + ln f'_1
$
以上四个函数实为同一个函数碰撞前后4个速度处取值
$
  vb(v), vb(v)_1, vb(v)', vb(v)'_1
$
这个式子说明$ln f$在碰撞是守恒的。

弹性碰撞守恒量：粒子数、动量、动能，从而一般解为
$
  ln f = c_1 m v_x + c_2 m v_y + c_3 m v_z + c_4 1/2 m vb(v)^2 + c_5
$
其中$c_i$和$vb(v)$无关，可以是依赖$vb(r)$的。可以重新参数化为更熟悉的形式：
$
  f = n (m/(2 pi k_B T))^(3/2) e^(- m (vb(v) - vb(v)_0)^2/(2 k_B T))
$
它们满足以下约束：
$
  - (pdv(f, t))_"drift" = vb(v) dot grad_r f + vb(a) dot grad_v f = 0
$
两边除以$f$，将以上$f$代入得
$
  vb(v) dot grad_r (ln n + 3/2 ln m/(2 pi k_B T) - m/(2 k_B T) (vb(v) - vb(v)_0)^2) - m/(k_B T) vb(a) dot (vb(v) - vb(v)_0) = 0
$
- 情形1：$vb(v)_0 = 0$
  $
    vb(v) dot grad_r (ln n + 3/2 ln m/(2 pi k_B T) - m/(2 k_B T) vb(v)^2) - m/(k_B T) vb(a) dot vb(v) = 0
  $
  设$vb(a)$不含$vb(v)$（或其含$vb(v)$部分$⊥ vb(v)$），上式对任意$vb(v)$成立，故各幂次分别为零
  - $vb(v)^3$：
    $
      grad_r T = 0
    $
    即各处温度相同
  - $vb(v)^1$：
    $
      grad_r (ln n) - m/(k_B T) vb(a) = 0
    $
    若$vb(F) = m vb(a)= - grad_r u(vb(r))$，则
    $
      grad_r (ln n + 1/(k_B T) u(vb(r))) = 0
    $
    从而
    $
      n = n_0 e^(- u(vb(r)) / (k_B T))
    $
    其中$n_0$为常数。即分子数密度在外势场作用下呈指数分布
    $
      f = n_0 (m/(2 pi k_B T))^(3/2) e^(- epsilon/(2 k_B T)), epsilon = (m vb(v)^2)/2 + u(vb(r))
    $
    这正Maxwell分布。
- 情形2: $vb(v)_0 != 0$

  令平衡方程中$vb(v)$各幂次为0，得：
  - $vb(v)^3$：
    $
      grad_r T = 0
    $
    $T$不依赖$vb(r)$
  - $vb(v)^2$：
    $
      vb(v) dot grad_r (vb(v) dot vb(v)_0) = 0 => vb(v)_0 = vb(alpha) + vb(omega) times vb(r)
    $
    即系统整体作为刚体以$vb(alpha)$平动、以$vb(omega)$转动；但不允许有剪切流、膨胀流等真正的流动。
  - $vb(v)^1$：
    $
      grad_r (ln n - (m vb(v)_0^2)/(2 k_B T)) - m/(k_B T) vb(a) = 0\
      m vb(a) = - grad_r u(vb(r))
    $
    从而
    $
      n = n_0 e^(1 / (k_B T) ((m vb(v)_0^2)/2 - u(vb(r))))
    $
  - $vb(v)^0$：
    $
      vb(a) dot vb(v)_0 = 0
    $
    即各处外力垂直于$vb(v)_0$。

#example(subname: [重力场中，细致平衡系统绕垂直轴自转])[
  重力场
  $
    u(vb(r)) = m g z
  $
  系统绕垂直轴自转：
  $
    vb(v)_0 = vb(omega) times vb(r)
  $
  若取转轴为$z$轴，则
  $
    v_0^2 = omega^2 (x^2 + y^2)
  $
  于是密度分布为
  $
    n = n_0 e^(1 / (k_B T) ((m omega^2 (x^2 + y^2))/2 - m g z))
  $
]

#example(subname: [平衡态的碰壁数平衡态时应相等])[
  果气体整体有速度$vb(v)_0$，墙两侧的碰壁数是否还能平衡？

  平衡态时
  $
    f(v_x, v_y, v_z) = g(abs(v_x-v_0), abs(v_y), abs(v_z))
  $
  $f$分布的中心不是$vb(v)=0$，而是$vb(v)=vb(v)_0$。

  在B位置
  $
    Gamma_B & prop integral_(v_0)^oo dd(v_x) (v_x - v_0) f(v_x, v_y, v_z) \
            & integral_(0)^oo dd(v_x) v_x f(v_x + v_0, v_y, v_z) \
            & integral_(0)^oo dd(v_x) v_x g(abs(v_x), abs(v_y), abs(v_z))
  $
  而在A位置
  $
    Gamma_A & prop integral_(-oo)^(v_0) dd(v_x) (v_0 - v_x) f(v_x, v_y, v_z) \
            & integral_(-oo)^(0) dd(v_x) (-v_x) f(v_x + v_0, v_y, v_z) \
            & integral_(0)^oo dd(v_x) v_x g(abs(v_x), abs(v_y), abs(v_z))
  $
  从而两侧的碰壁数相等
  $
    Gamma_B = Gamma_A
  $
]
