#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/fletcher:0.5.8": diagram, edge, node

= 热力学基础

== 热力学基本定律

*热力学*是唯象理论：它不关心分子、不关心统计，只研究宏观量之间关系。

*热力学三定律*：给出了热力学的基本定律，描述了热力学系统的基本性质和行为。
- 第零定律：定义温度
- 第一定律：能量守恒
- 第二定律：熵增
- 第三定律：绝对零度极限

=== 热力学系统

#definition(subname: [（热力学）系统])[
  *（热力学）系统*是*大量*微观粒子（分子、原子、电子等）组成的*有限*的宏观体系。
]

#figure(
  three-line-table[
    | 类型   | 能量交换 | 物质交换 |
    | ---- | ---- | ---- |
    | 孤立系统 | ❌    | ❌    |
    | 封闭系统  | ✅    | ❌    |
    | 开放系统 | ✅    | ✅    |
  ],
  numbering: none,
)
- 孤立系统
  - 不与外界交换能量和物质
  - 最干净的理论对象，在统计力学最重要
  - 例如：宇宙
- 封闭系统
  - 与外界交换能量但不交换物质
  - 例如：密封的容器中的气体
- 开放系统
  - 与外界交换能量和物质
  - 例如：地球

#definition(subname: [平衡态])[
  *平衡态*是*孤立系统*的*宏观性质**不随时间变化*的状态。
]
- 平衡态
  - 用宏观量描写
  - 微观仍在剧烈运动，动态平衡(热动平衡)
  - 宏观量仍有微小涨落
- 非平衡态
  - 平衡的时间 $tilde$ 弛豫时间

平衡态不等于似稳态，似稳态是*非孤立系统*的状态。

#figure(
  three-line-table[
    | 类型      | 是否有流 | 是否有外界交换 | 是否平衡 |
    | ------- | ---- | ------- | ---- |
    | 孤立平衡    | 无    | 无       | ✅    |
    | 非孤立但热平衡 | 无净流  | 可交换但平衡  | ✅    |
    | 似稳态     | 有持续流 | 有交换     | ❌    |
  ],
  numbering: none,
)

#definition(subname: [自由度])[
  *自由度*是系统中独立的宏观量数目。
]

#newpara()

热力学的状态参量/(状)态函数：描述系统状态的宏观量，例如温度、压力、体积、内能等。
- 参量类型
  - 几何参量：$V$
  - 力学参量：$P$
  - 化学参量：$x$
  - 电磁参量：$B$
- 强度量与广延量
  - 强度量（intensive）不随系统大小改变：
    - 温度$T$
    - 压力$P$
    - 化学势$mu$
  - 广延量（extensive）随系统大小线性增加：
    - 体积$V$
    - 内能$U$
    - 物质的量$n$
    - 满足
      $
        f(lambda N) = lambda f(N)
      $

例如理想气体
$
  p V = n R T
$
只需要两个状态参量就可以确定系统状态，例如$T$和$V$，或者$T$和$p$。

=== 热平衡原理（热力学第零定律）

==== 热力学第零定律与温度

#theorem(subname: [热力学第零定律])[
  若A、C处*平衡*，B、C处*平衡*，则A与B也处*平衡*。
]
互为平衡的体系有一共同的*物理性质：温度*$T$。

平衡条件可以写成：
$
  f_(A C) (p_A, V_A; p_C, V_C) = 0
$
A、C平衡以及B、C平衡给出：
$
  f_(A C) (p_A, V_A; p_C, V_C) = f_(B C) (p_B, V_B; p_C, V_C) = 0
$
从而
$
  p_C = F_(A C) (p_A, V_A; V_C) = F_(B C) (p_B, V_B; V_C)
$
A、B也平衡意味着
$
  f_(A B) (p_A, V_A; p_B, V_B) = 0
$
给出一个单值函数
$
  g_A (p_A, V_A) = g_B (p_B, V_B)
$
这表明系统A和B的宏观状态可以通过一个单值函数联系起来，这个函数就是温度$T$。
$
  T = g(p, V)
$

#definition(subname: [温度])[
  *温度*是描述系统热平衡状态的物理量，是一个强度量。
]
- 温度是状态函数，不是过程函数

#note(subname: [温度发现的历史])[
  温度计：
  - 15世纪 L. da.Vinci
    - 发明温度计, 研究永动机
  - 1592年 Galileo Galilei
    - 空气温度计
  - 1714年 D.G. Fahrenheit
    - 水银温度计
    - *第一个温标* 华氏温标
  - 1742年 A. Celsius
    - 摄氏温标
  - 1848年 Thomson, Lord Kelvin
    - *绝对温标*
]

#note(subname: [小系统可能没有温度])[

  温度是统计概念。如果：系统粒子太少或相关长度太大，局域温度可能无法定义。

  例如纳米碳管和低温硅中，局域温度无法定义。

  热力学有适用范围，必须：$L >> l_min$。
]

#note(subname: [温度尺度])[
  - 水三相点：$273.16 K$ 国际温标标准
  - 宇宙温度：$3 K$ 宇宙微波背景
  - 绝对零度：$0 K$
    - 最低温纪录达到：0.5 nK
    - 但仍然不能达到 0 K，这预示热力学第三定律。
]

==== 物态方程

#definition(subname: [物态方程])[
  物态方程是描述$T$与其它状态参量间的关系的方程。

  一般地
  $
    f(x ... x_f, T) = 0
  $
]

#theorem(subname: [理想气体物态方程])[
  $
    p V = n R T
  $
  其中$R = 8.31 "J/(mol K)"$是理想气体常数。
]

#theorem(subname: [Van de Waals气物态方程])[
  $
    (p + a n^2/V^2) (V - n b) = n R T
  $
  其中$a$和$b$是与气体性质相关的常数，分别描述分子间的吸引力和分子体积。$n^2/V^2$正比于两粒子吸引力作用的几率。
]

#newpara()

有偏微分关系
$
  (pdv(V, p))_T (pdv(p, T))_V (pdv(T, V))_p = -1
$

=== 热力学第一定律

==== 准静态过程与功

#definition(subname: [准静态过程])[
  每一瞬时，状态无限接近平衡态；过程要足够慢（相对驰豫时间而言）
]
- 驰豫时间 = 系统回到平衡的时间尺度。
  - 如果外界变化时间尺度$tau_"外" >> tau_"驰豫"$，则系统始终近似平衡
- 只有在平衡态附近，状态函数（$U, T, S, P$）才有定义
  - 非准静态局部温度可能不存在，压强可能不均匀

*系统的能量*由*内能*$U$以及*整体运动能量*构成
- 内能$U$
  - 系统内部所有微观自由度的能量：分子动能，分子势能，相互作用
- 整体运动能量
  - 宏观平动、转动

封闭系统的*能量交换*有*做功*$W$和*热量*$Q$两种方式
- 功$W$：粒子的有序运动，与过程联系，非态函数
- 热量（非功）$Q$：无序运动

内能$U$是状态函数，$Q$和$W$是过程量。

#example(subname: [准静态过程的功])[
  - *静流体系统*
    $
      dd(w) = p A dd(x) = - p dd(V)
    $
    其中
    $
      dd(V) = - A dd(x)
    $
  - *液体表面薄膜*
    $
      dd(w) = 2 sigma l dd(x) = sigma dd(A)
    $
    其中
    $
      dd(A) = 2 l dd(x)
    $
  - *电介质*
    $
      dd(w) = E dd(P)
    $
  - *磁介质*
    $
      dd(w) = B dd(M) = mu_0 H dd(M)
    $
    其中
    $
      mu_0 = 4 pi dot 10^(-7) "N" dot "A"^(-2)
    $
]

#theorem(subname: [准静态过程的功])[
  一般地
  $
    dd(w) = sum_i Y_i dd(y)_i
  $
  其中
  - $y_i$是广义坐标$(V, M, A,...)$
  - $Y_i$是与$y_i$对应的广义力$(-p, mu_0 H, sigma,...)$
]

==== 热力学第一定律

#note(subname: [热力学第一定律的历史])[
  - Mayer 能量守恒和转化的基本思想
  - Hermann von Helmholtz 多方论证
  - Joule 实验研究、热、机械、电、能量单位
  - Clausius 数学形式 $dd(Q) = dd(u)+A dd(W)$
  - Thomson $u=u_"动"+u_"势"$
]

#theorem(subname: [热力学第一定律])[
  内能的改变等于系统吸收的热量与系统对外界做的功之和。

  - 对于封闭系统，热力学第一定律可以写成
    $
      dd(U) = dd(Q) + dd(W)
    $
  - 对于开放系统，热力学第一定律可以写成
    $
      dd(U) = dd(Q) + dd(W) + sum_i mu_i dd(N_i)
    $
    最后一项是化学势。
]
第一定律保证$U$是完全微分，但$Q$和$W$不是完全微分。

#newpara()

*第一类永动机*：不消耗能量却持续做功，这违反第一定律。

如果存在第一类永动机，则存在一个过程：
$
  integral.cont delta W != 0
$
这意味着系统可以在一个循环过程中对外界做非零功，而不需要吸收热量或消耗内能，这直接违反了能量守恒定律。

==== 热容量与焓

#definition(subname: [热容量])[
  *热容*是一个*过程相关*的量，定义为系统吸收的热量与温度变化的比值：
  $
    C = lim_(Delta T -> 0) (Delta Q )/(Delta T)
  $
  而*比热*是单位质量的热容量。
]
- 等温过程：$c -> oo$
- 绝热过程：$c -> 0$

#example(subname: [静流体系统的热容])[
  例如静流体系统可以定义*定容热容*和*定压热容*，分别记为$C_V$和$C_P$。

  - 定容热容量
    $
      dd(Q) = dd(U)
    $
    $
      C_V = lim_(Delta T -> 0) ((Delta Q )/(Delta T))_V = (pdv(U, T))_V
    $
  - 定压热容量
    $
      dd(Q) = dd(U) - dd(W)
    $
    $
      (Delta Q)_p = (U_f - U_i) - Delta W_p = H_f - H_i
    $
    其中
    $
      (Delta W)_p = - p (V_f - V_i)
    $
    焓
    $
      H = U + p V
    $
    从而
    $
      C_P = lim_(Delta T -> 0) ((Delta Q )/(Delta T))_p = (pdv(H, T))_p
    $
  - 有大小关系
    $
      C_p > C_V
    $
  以上讨论方法适用于所有单项功系统
  $
    V -> y, - p -> Y
  $
]

#newpara()

由此可以定义*状态函数——焓*
#definition(subname: [焓])[
  *焓*是一个状态函数，定义为内能与压力-体积乘积之和：
  $
    H = U + p V
  $
]
在*等压过程*中焓的变化为
$
  dd(H) = dd(U) + p dd(V)
$
这正是在等压过程中系统从外界吸收的热量。*在等压过程中系统从外界吸收的热量等于态函数焓的增值，这是态函数焓的重要特性。*

#example(subname: [理想气体比热])[
  理想气体的内能$U$仅与温度$T$有关
  $
    U = 3/2 n R T, p V = n R T => p dd(V) = n R dd(T)
  $
  则有
  $
    C_V = (pdv(U, T))_V = 3/2 n R
  $
  $
    C_p = (dv(Q, T))_p = ((dd(U) + p dd(V))/(dd(T)))_p = C_V + n R = 5/2 n R
  $
  $
    gamma = C_p/C_V, C_V = (n R)/(gamma - 1), C_p = (gamma n R)/(gamma - 1)
  $
]

#newpara()

内能标准全微分式(能量方程式)：将$U$全微分式中各变量微分前的系数，用可测量表达出来。

#theorem(subname: [内能标准全微分式])[
  以$T, V$为态变量
  $
    dd(U)(T,V) = (pdv(U, T))_V dd(T) + (pdv(U, V))_T dd(V)
  $
  其中
  $
    c_p & = (dv(Q, T))_p = ((dd(U) + p dd(V))/(dd(T)))_p = p (pdv(V, T))_p + (pdv(U, T))_p \
  $
  其中
  $
    (pdv(U, T))_p = (pdv(U, V))_T (pdv(V, T))_p + (pdv(U, T))_V (pdv(T, T))_p = (pdv(U, V))_T (pdv(V, T))_p + (pdv(U, T))_V
  $
  以及
  $
    c_p & = p (pdv(V, T))_p + (pdv(U, T))_V + (pdv(U, V))_T (pdv(V, T))_p \
        & = p (pdv(V, T))_p + c_V + (pdv(U, V))_T (pdv(V, T))_p \
  $
  从而
  $
    dd(U)(T,V) = c_V dd(T) + ((c_p -c_V) (pdv(T, V))_p - p) dd(V)
  $
]

#example(subname: [理想气体的内能])[
  能量方程式：
  $
    dd(U)(T,V) = c_V dd(T) + ((c_p -c_V) (pdv(T, V))_p - p) dd(V)
  $
  从而
  $
    p V = n R T => C_p - C_V = n R\
    pdv(T, V) = p/(n R), C_V = 3/2 R "(单原子分子)"
  $
  其中
  $
    U = U(T) = 3/2 n R T
  $
  也可以$T$，$p$或$p$，$V$为变量类似做。

  对其它单项功系流类似：$V -> y , - p -> Y$。
]

==== 绝热过程

对理想气体的绝热过程
$
  dd(U) = dd(W) = - p dd(V)
$
而
$
  dd(U) = C_V dd(T)
$
以及理想气体的物态方程
$
  p dd(V) + V dd(p) = n R dd(T) = C_V (gamma-1) dd(T)
$
从而有
$
  V dd(p) + gamma p dd(V) = 0 <=> dd(p)/p + gamma dd(V)/V = 0
$
这就是理想气体准静态绝热过程的微分方程。由此可以得到绝热过程的状态方程
#theorem(subname: [理想气体绝热过程的状态方程])[
  $
    p V^gamma = "const"
  $
  以及
  $
    T V^(gamma-1) = "const", p^(gamma - 1) T^(-gamma) = "const"
  $
]

#newpara()

可以计算绝热过程的功
$
  W = - integral p dd(V) = - integral C/V^gamma dd(V) = C/(gamma-1) (V_f^(1-gamma) - V_i^(1-gamma))
$
其中
$
  C = p_1 V_1^gamma = p_2 V_2^gamma
$
可以得到
$
  W = (p_2 V_2 - p_1 V_1)/(gamma-1) = (n R (T_2 - T_1))/(gamma-1) = C_V (T_2 - T_1)
$

==== 等温过程

对理想气体的等温过程
$
  dd(U) = 0, dd(Q) = - dd(W) = p dd(V)
$
由理想气体的物态方程
$
  p dd(V) + V dd(p) = n R dd(T) = 0
$
从而有
$
  W = - integral p dd(V) = - R T integral dd(V)/V = - R T ln V_f/V_i
$
等温过程中理想气体的内能不变，其吸收的热量等于对外界做的功
$
  Q = - W = n R T ln V_f/V_i
$

=== 热力学第二定律

==== 热力学第二定律

#note(subname: [热力学第二定律的历史])[
  - 1824年 S. Carnot Carnot循环
  - 1850年 Clausius 第二定律 1850年发表
  - 1851年 Thomson, Lord Kelvin 更为明确第二定律 1850年完成,
  - 1865年 Clausius 熵

  #set quote(block: true)
  #quote(attribution: [Clausius])[
    The energy of the world is constant. Its entropy tends to a maximum.
  ]
]

#newpara()

热力学第二定律说出了过程的方向性，揭示了无外在干扰下，自发进行的方向。

#theorem(subname: [热力学第二定律])[
  - Clausius说法：*不可能把热量从低温物体传到高温物体而不引起其它变化*
  - Kelvin说法：*不可能从单一热源吸热使之完全变成有用功而不引起其它变化*
]

#newpara()

自发过程的特征
- 不可逆，只能朝一个方向发生，反向过程需要外界干预
  - 例如：气体扩散，热传导，混合
- 不可能从单一热源吸热使之完全变成功
  - $eta = 1$，效率为1的热机是不存在的

第二类永动机
- Feynman 棘轮
  - 结构：一根轴穿过隔板，两侧连接：
    - 左侧：浸在气体里的叶片（vanes），受分子碰撞产生随机转矩
    - 轴上：棘轮-棘爪机构（ratchet & pawl），只允许一个方向转
    - 右侧：输出端（比如卷绳做功）
  - 直觉：“随机热运动 + 单向机构” $=>$ “定向转动” $=>$ “持续做功”；棘爪要卡住齿轮，需要处在低能位置；但热涨落会让它以一定概率抬起越过齿尖，导致齿轮反向滑动。
  - 如果真能整流热噪声，你就能让系统从热平衡中自发产生宏观定向运动，这等价于制造“无需外界差异的自发序”，在平衡统计力学中不允许。
  - 分析：棘轮-棘爪机构本身也在热涨落中，整体系统仍满足第二定律。无法持续做功的原因是热涨落的对称性和棘轮机构的对称性相互抵消了。
- Smoluchowski 机关
  - “门闩/挡板 + 分子/粒子在盒子中碰撞”的示意。核心思想都是：让粒子随机热运动，用一个“单向门”让粒子更容易从 A 到 B，而不易从 B 回 A，长时间后在 B 堆积，形成密度差/压强差；再用这压强差去做功。
  - 门的自由度导致“反向漏”不可避免，无法持续做功。
- Maxwell Demon
  - 一个假想的生物，能够观察分子运动，并且打开或关闭一个小门来让快分子通过，从而使一边变热，另一边变冷
  - 仍然失败，因为观察和控制分子运动需要消耗能量，从而整体系统仍然满足第二定律
  - 信息熵：1 bit 信息 → 熵增 kT ln2，这是 Landauer 原理：擦除信息必须耗散能量
    - Demon 获取和擦除信息时：熵增加，整个系统熵仍然增加

==== Carnot循环

Carnot循环是一个理想化的热机循环，由两个等温过程和两个绝热过程组成。它是所有热机中效率最高的循环。

```
等温膨胀过程-绝热膨胀过程-等温压缩过程-绝热压缩过程
```
整个循环过程完成后，气体回到原来状态，内能作为状态函数其变化为零。由热力学第一定律，在整个循环中气体对外所作的净功$W$应等于气体在循环中所吸收的净热量$Q_2-Q_1$
$
  W = Q_1 - Q_2 = R T_1 ln V_2/V_1 - R T_2 ln V_3/V_4
$
其中
$
  T_1 V_2^(gamma-1) = T_2 V_3^(gamma-1), T_1 V_1^(gamma-1) = T_2 V_4^(gamma-1) => V_2/V_1 = V_3/V_4
$
由此得到
$
  W = R (T_1 - T_2) ln V_2/V_1
$
从而得到Carnot循环的效率
$
  eta = W/Q_1 = 1 - T_2/T_1
$
可逆机效率只与热源温度有关，与工作物质无关。

#figure(
  include "pic/1.4.typ",
  caption: [Carnot循环$p-V$图],
)

==== Carnot定理与，Clausius不等式与熵

#theorem(subname: [Carnot定理])[
  在相同高、低温热源之间工作的热机，以可逆机的效率最高。
  $
    eta = 1 - Q_2/Q_1 = 1 - T_2/T_1
  $
  其中$T_i$为热力学温标，Kelvin温标。
]
可逆机效率只与热源温度有关，与工作物质无关。

#proof[
  考虑
  #figure(
    three-line-table[
      | \ | A(可逆) | B(任意) |
      | --- | --- | --- |
      | 高温 $T_1$ | 吸热 $Q_1$ | 吸热 $Q'_1$ |
      | 低温 $T_2$ | 放热 $Q_2$ | 放热 $Q'_2$ |
    ],
    numbering: none,
  )
  $
    W = Q_1 - Q_2, eta_A = W/Q_1\
    W' = Q'_1 - Q'_2, eta_B = W'/Q'_1
  $
  用反证法，假设$eta_A < eta_B$，则
  $
    W/Q_1 < W'/Q'_1
  $
  可令$Q_1=Q'_1$
  $
    W < W'
  $
  A是可逆机，可使B与逆向运行的A联合运行，由于B做功大，可分出其部分功开动A，多余的输出
  #figure(
    image("pic/1.1.pdf", width: 80%),
    numbering: none,
  )
  可以看到，联合系统从单一热源吸热$Q_1$，做功$W' - W > 0$，没有放热，这与Kelvin表述矛盾。

  从而$eta_A >= eta_B$。这就是Carnot定理。
]

#newpara()

可逆卡诺热机A的效率为：
$
  eta = 1 - Q_2/Q_1
$
可逆机效率只与热源温度有关，与工作物质无关
$
  Q_2/Q_1 = F(theta_1, theta_2)
$
$theta$是某种温标。下面证明$F$函数可表为以下形式：
$
  F(theta_1, theta_2) = f(theta_2)/f(theta_1)
$
#proof[
  引入辅助可逆Carnot热机B：
  $
    Q_3/Q_2 = F(theta_2, theta_3)
  $
  从而
  $
    F(theta_1, theta_3) = Q_2/Q_1 = (Q_2/Q_3) / (Q_1/Q_3) = (Q_3/Q_1)/(Q_3/Q_2) = F(theta_1, theta_3) / F(theta_2, theta_3)
  $
  $theta_3$是任意温度，从而
  $
    f(theta) = 1/F(theta, theta_3)
  $
  从而
  $
    F(theta_1, theta_2) = f(theta_2)/f(theta_1)
  $
]
这就给出了*温标*的定义，$f(theta)$是*温标函数*。

#definition(subname: [绝对温标])[
  绝对温标是以可逆Carnot热机效率为基础定义的温标，满足
  $
    Q_2/Q_1 = F(theta_1, theta_2) = theta_2/theta_1
  $
  从而
  $
    eta = 1 - T_2/T_1
  $
]

#newpara()

由此可以给出Clausius不等式
#theorem(subname: [Clausius不等式])[
  对于任意循环过程，系统从外界吸收的热量与温度的比值的循环积分小于或等于零：

  对于任意循环过程，从热源$T_i$吸收$Q_i$
  $
    sum_i (Q_i/T_i) <= 0
  $
  或者积分形式
  $
    integral.cont (dd(Q)/T) <= 0
  $
  等号成立当且仅当过程可逆。
]

#proof[
  Carnot定理给出
  $
    eta = 1 - Q_2/Q_1 <= 1 - T_2/T_1
  $
  等号成立当且仅当过程可逆，这就给出
  $
    Q_2/Q_1 >= T_2/T_1
  $
  定义放热变为定义吸热，就有
  $
    Q_1/T_1 + Q_2/T_2 <= 0
  $
  同理可以得到任意循环过程的Clausius不等式
  $
    sum_i (Q_i/T_i) <= 0
  $
]

由此可知，对于可逆过程
$
  integral_(i(R_1))^f dd(Q)/T = integral_(i(R_2))^f dd(Q)/T
$
其中$R_1, R_2$是从初态$i$到终态$f$的两条不同路径。由此可以定义*状态函数——熵(Entropy)*
#definition(subname: [熵])[
  *熵*是一个状态函数，定义为系统从某参考状态$i$到状态$f$的可逆路径上吸收的热量与温度的比值的积分：
  $
    dd(Q)/T = dd(S)
  $
  从而对与任意路径$R$，有
  $
    S_f - S_i = integral_i^f dd(Q)/T
  $
  单位为焦耳每开尔文（J/K）。
]

#newpara()

结合热力学一二定律可以得到，热力学基本关系
#theorem(subname: [热力学基本关系])[
  对于可逆，准静态过程
  $
    dd(U) = T dd(S) + sum_k Y_k dd(y)_k
  $
]

#newpara()
由Clausius不等式
$
  integral.cont (dd(Q)/T) <= 0
$
拆成两个路径
$
  integral_(i(R_1))^f dd(Q)/T <= integral_(f(R_2))^i dd(Q)/T = Delta S
$
其中$R_1$是从初态$i$到终态$f$的任意路径，$R_2$是从$f$到$i$的可逆路径。给出
$
  dd(S) >= dd(Q)/T
$
对于*绝热过程*，$dd(Q) = 0$，就给出
$
  dd(S) >= 0
$
由此可以得到热力学第二定律的熵增表述：对于孤立系统，自发过程总是伴随着熵的增加。
#theorem(subname: [热力学第二定律的第三种表述])[
  对于孤立系统，自发过程总是伴随着熵的增加。
]
孤立系统的熵不减，熵是热运动混乱程度的量度。

#note[
  现在我们证明了
  $
    "Kelvin表述" => "Clausius表述" => "Carnot定理" => "Clausius不等式" => "熵增表述"
  $
  下面只需证明$"熵增表述" => "Kelvin表述"$，就可以证明这几种表述的等价性。
]

考虑热机和制冷机，重物下降做功，产生热，放热给热库；考虑相反过程是否可行。

#figure(
  include "pic/1.2.typ",
  numbering: none,
)

- 正过程：熵增，系统分布更混乱$Delta S >=0$
- 逆过程：从第一热源吸热做功，不改变环境的“完美机”；随机分布在不同自由度的内能转变为功（提升重物），这将破坏第二定律
  - 装置回到原态$Delta S_"机" = 0$
  - 装置仅仅改变重物，不改变熵$Delta S_"外" = 0$
  - 热源的熵变
    $
      (-q)/T >=0 => q/T = w/T <= 0
    $
    这就要求$w <= 0$，要求做功，而不是被做功，这在逆过程中是无法实现的

这就给出第二定律Kelvin表述：不可能构造完美热机。

*任何一个不可逆过程都可以是热力学第二定律的表述。*

有了熵增原理后，Carnot定理就很好推出：热力学第二定律要求
$
  Delta S = (-q_1)/T_1 + q_2/T_2 >= 0 => (-q_1)/T_1 + (q_1 - w)/T_2 >= 0
$
给出
$
  eta = w/q_1 <= 1 - T_2/T_1
$
#figure(
  include "pic/1.3.typ",
  numbering: none,
)
#newpara()
我们认为不可能实现的*完美机*为
$
  w = q_1, eta=1
$
这是不可以实现的，实际上效率最高的热机是可逆机，效率为
$
  eta = 1 - T_2/T_1 < 1
$
某些热没转成功，而转成第二热源内能。为了提高热机效率，可以提高高温热源温度。

==== 熵的计算

计算两平衡态的熵差可以设想一个可逆过程联接初未态：
$
  S_f - S_i = integral_i^f dd(Q)/T
$

#example[
  将质量相同而温度分别为$T_1$和$T_2$的两杯水在等压下绝热的混合，求熵变。
]

#solution[
  两杯水等压绝热混合后，终态温度为$(T_1 + T_2)/2$；以$T, p$为状态变量
  - 第一杯水 $(T_1, p)$
  - 第二杯水 $(T_2, p)$
  - 终态 $(T_f, p)$
  根据：
  $
    dd(S) = dd(Q)/T, dd(U) = T dd(S) - p dd(V)
  $
  这是*等压过程*，就有
  $
    dd(S) = (dd(U) + p dd(V))/T = dd(H)/T = (C_p dd(T))/T
  $
  积分后得两杯水得熵变分别为：
  $
    Delta S_1 = C_p ln (T_1 + T_2)/(2T_1), Delta S_2 = C_p ln (T_1 + T_2)/(2T_2)
  $
  总的熵等于两杯水得熵之和：
  $
    Delta S = Delta S_1 + Delta S_2 = C_p ln ((T_1 + T_2)^2)/(4 T_1 T_2) > 0
  $
  两杯水等压绝热混合是一个不可逆过程。
]

==== 不可逆过程的方向

熵增原理给出了*绝热过程*中的不可逆过程的方向
$
  dd(S) >= 0
$

为了研究非绝热过程进行的方向，引入
- Helmholtz自由能
  $
    F = U - T S
  $
  对于*等温等容过程*，Helmholtz自由能的改变为
  $
    Delta F & = Delta U - T Delta S = Delta Q + Delta W - T Delta S \
            & = Delta W - T Delta S <= 0
  $
- Gibbs自由能
  $
    G = U - T S + p V
  $
  对于*等温等压过程*，Gibbs自由能的改变为
  $
    Delta G & = Delta U - T Delta S + p Delta V = Delta Q + Delta W - T Delta S + p Delta V \
            & = Delta Q - T Delta S <= 0
  $

#definition(subname: [Helmholtz自由能])[
  *Helmholtz自由能*是一个状态函数，定义为内能与温度-熵乘积之差：
  $
    F = U - T S
  $
  在*等温等容过程*中，系统的Helmholtz自由能不增。
]

#definition(subname: [Gibbs自由能])[
  *Gibbs自由能*是一个状态函数，定义为内能与温度-熵乘积之差再加上压力-体积乘积：
  node((0, 0), $V$),
  $
    G = U - T S + p V
  $
  在*等温等压过程*中，系统的Gibbs自由能不增。
]

#newpara()

计算热力学量出发点是
$
  dd(U) = T dd(S) + sum_k Y_k dd(y)_k
$
有基本热力学函数即物态方程，$U, S$的状态方程，就可以给系统的其他热力学量。

==== 特性函数与Maxwell关系

实际上，有更强的结论
#definition(subname: [特性函数])[
  适当选取*自变量*，只需*一个*热力学量就可决定均匀系统的*全部热力学性质*，这样的函数称为*特性函数*，包括
  - 内能$U$
    $
      U, U = U(S, V)
    $
  - 焓$H$
    $
      H = U + p V, H = H(S, p)
    $
  - Helmholtz自由能$F$
    $
      F = U - T S, F = F(T, V)
    $
  - Gibbs自由能$G$
    $
      G = U - T S + p V, G = G(T, p)
    $
]
这些特性函数由*Legendre变换*得到，选取不同的自变量，得到不同的特性函数。根据微分关系
$
  dd(U) = T dd(S) - p dd(V)
$
就有
$
  T = (pdv(U, S))_V, p = - (pdv(U, V))_S
$
同理有
$
  dd(H) = T dd(S) + V dd(p)
$
可以得到
$
  T = (pdv(H, S))_p, V = (pdv(H, p))_S
$
其中$p, V$是共轭变量，$S, T$是共轭变量。对于特性函数$F, G$同样可以得到类似的关系。

同理由全微分的性质可以得到Maxwell关系
#theorem(subname: [Maxwell关系])[
  热力学量的二阶偏导数满足交换律，给出热力学量的偏导数之间的关系，例如
  $
    (pdv(T, V))_S = - (pdv(p, T))_V
  $
  $
    (pdv(T, p))_S = (pdv(V, T))_p
  $
  $
    (pdv(S, V))_T = (pdv(p, T))_V
  $
  $
    (pdv(S, p))_T = - (pdv(V, T))_p
  $
]
#proof[
  由特征函数的全微分条件建立
  $
    dd(U) = T dd(S) - p dd(V) = (pdv(U, S))_V dd(S) + (pdv(U, V))_S dd(V)
  $
  $
    (pdv(T, V))_S = pdv(U, S, V) = pdv(U, V, S) = - (pdv(p, T))_V
  $
  同理可以得到其它Maxwell关系。
]
Maxwell关系使不能直接测量量（如内能$U$，熵$S$）的偏导数关系可以用直接可测的量（热容量、物态方程等）表述出来：
- 四个特性函数全微分式
- 四个Maxwell关系

Maxwell关系可以用下面的图来记忆
#figure(
  diagram(
    spacing: (0.5cm, 0.5cm),
    // nodes
    node((0, 0), $V$),
    node((1, 0), $F$),
    node((2, 0), $T$),
    node((0, 1), $U$),
    node((2, 1), $G$),
    node((0, 2), $S$),
    node((1, 2), $H$),
    node((2, 2), $p$),
    // cross arrows
    edge((0, 2), (2, 0), "->"),
    edge((2, 2), (0, 0), "->"),
  ),
  caption: [Maxwell关系],
)

可以得到*熵的标准全微分式*：以$p,V,T$中两个为自变量，且将微分前系数用可测量表达出来的全微分式。
$
  dd(S) = (pdv(S, T))_V dd(T) + (pdv(S, V))_T dd(V)
$
其中
$
  C_V = (pdv(Q, T))_V = T (pdv(S, T))_V, (pdv(S, V))_T = (pdv(p, T))_V
$
从而
$
  dd(S) = C_V/T dd(T) + (pdv(p, T))_V dd(V)
$

#newpara()

还能给出*内能标准全微分式*，以$T, V$为自变量
$
  dd(U) & = T dd(S) - p dd(V) \
        & = T (pdv(S, T))_V dd(T) + (T (pdv(S, V))_T - p) dd(V) \
        & = C_V dd(T) + ((pdv(p, T))_V T - p) dd(V)
$
前面还得到了
$
  dd(U) = C_V dd(T) + ((C_p -C_V) (pdv(T, V))_p - p) dd(V)
$
对比可以得到
$
  (pdv(p, T))_V T - p = (C_p -C_V) (pdv(T, V))_p
$
#theorem(subname: [热容量方程])[
  热容量方程
  $
    C_p - C_V = (T (pdv(p, T))_V) / (pdv(T, V))_p = - T (pdv(p, T))_V^2 (pdv(V, p))_T
  $
]
理想气体有
$
  C_p - C_V = n R
$

== 均匀系统的热力学性质

== 复相系统的热力学性质
