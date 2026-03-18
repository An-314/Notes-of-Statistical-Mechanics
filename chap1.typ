#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch

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
  image("pic/builds/1.4.pdf"),
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
  image("pic/builds/1.2.pdf"),
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
  image("pic/builds/1.3.pdf"),
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

#theorem(subname: [熵的标准全微分式])[
  熵可以用$T, V$的微分表示出来：
  $
    dd(S) = C_V/T dd(T) + (pdv(p, T))_V dd(V)
  $
]

#newpara()

还能给出*内能标准全微分式*，以$T, V$为自变量
$
  dd(U) & = T dd(S) - p dd(V) \
        & = T (pdv(S, T))_V dd(T) + (T (pdv(S, V))_T - p) dd(V) \
        & = C_V dd(T) + ((pdv(p, T))_V T - p) dd(V)
$
#theorem(subname: [内能标准全微分式])[
  内能可以用$T, V$的微分表示出来：
  $
    dd(U)(T,V) = C_V dd(T) + ((pdv(p, T))_V T - p) dd(V)
  $
]
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

=== 热力学第三定律

==== 热力学第三定律

前两条热力学定律给出的熵，但只能确定熵的改变，无法确定熵的绝对值。热力学第三定律给出了熵的绝对零点问题。

#theorem(subname: [Nernst定理])[
  (1906)等温过程中熵的改变
  $
    lim_(T -> 0) (Delta S)_T = 0
  $
]

#theorem(subname: [Nernst原理])[
  (1906) 不可能使一个物体冷却到绝对温度的零度
]

我们在后面证明两种表述等价。

#theorem(subname: [热力学第三定律Planck形式])[
  $
    S(T=0) = 0
  $
]
#newpara()
对于固定热力学变量$y in {p,V}$有比热
$
  C_y = T (pdv(S, T))_y
$
这是因为
$
  dd(S) = (pdv(S, T))_y dd(T) + (pdv(S, y))_T dd(y)
$
从而有
$
  S(T,y) = S_0(0,y) + integral_0^T C_y/T dd(T)
$
由于
$
  T->0, lim_(T->0) (Delta S)_T = 0
$
由Planck表述
$
  S(T,y) = integral_0^T C_y dd(T)/T
$
这就给出
$
  lim_(T->0) C_p = lim_(T->0) C_V = 0
$
否则与热力学第三定律矛盾。这意味着当$T->0$时，*系统的热容量*趋于0。

另外低温热容量规律如下
- 金属 $C_V = A T$，低温热容来自电子激发，Fermi气体理论
- 非金属固体 $C_V = B T^3$，低温热容来自声子振动，Debye理论
- Dulong-Petit定律给出，金属热容在低温趋于0，在高温趋于$3R$

另外，由Maxwell关系
$
  (pdv(V, T))_p = - (pdv(S, p))_T, (pdv(p, T))_V = (pdv(S, V))_T
$
从而
$
  lim_(T -> 0) (pdv(S, p))_T = lim_(T -> 0) (pdv(S, V))_T = 0
$
给出
$
  lim_(T -> 0) (pdv(V, T))_p = lim_(T -> 0) (pdv(p, T))_V = 0\
  alpha = 1/V (pdv(V, T))_p, beta = 1/p (pdv(p, T))_V
$
这意味着$T->0$时，*物质的膨胀系数和压强系数*趋于0。

现在证明Nernst定理和Nernst原理的等价性
- Nernst定理$->$Nernst原理
  - 考虑$S-T$图上的$S(T,y)$曲线，$y$为$p$或$V$
  - 曲线$y=y_1$和$y=y_2$将交于一点$=>$不能通过有限的步骤使物体冷却到绝对零度
- Nernst原理$->$Nernst定理
  - 反证：不交于一点，可以通过有限的步骤使物体冷却到绝对零度
*体系的熵在绝对零度时是一个绝对的常数。*

== 均匀系统的热力学性质

对于均匀系统，热力学量的空间分布是均匀的，热力学量仅依赖于时间和状态变量。对于均匀系统，可以定义一些重要的热力学性质：
- 体膨胀系数
  $
    alpha = 1/V (pdv(V, T))_p
  $
- 压强系数
  $
    beta = 1/p (pdv(p, T))_V
  $
- 等温压缩系数
  $
    kappa_T = - 1/V (pdv(V, p))_T
  $
由微分关系
$
  (pdv(x, y))_z (pdv(y, z))_x (pdv(z, x))_y = -1
$
有
$
  alpha = kappa_T beta p
$
*热容量方程*就变为
$
  C_p - C_V = - T (pdv(p, T))_V^2 (pdv(V, p))_T = (V T alpha^2) / kappa_T >=0
$
#newpara()
#example(subname: [水在4摄氏度的热容])[
  水的密度在4摄氏度时具有极大值
  $
    alpha = 1/V (pdv(V, T))_p = 0
  $
  此时
  $
    C_p - C_V = 0
  $
]

*小结：应用热力学定律研究均匀系统性质的一般方法*
+ 选自变量（直接可测量）
+ $dd(U)=T dd(S)-p dd(V)$（可逆）等等
+ 引出其它特性函数的全微分，并得到Maxwell关系
+ 若只涉及$S$的偏导，利用Maxwell关系及偏导法则即可
+ 若涉及特性函数的偏导，先换$S$的偏导，再回到4

#figure(
  three-line-table[
    | 特性函数 | 定义 | 自变量 | 基本关系 |
    | --- | --- | --- | --- |
    | 熵 | $S$ 基本函数 | $U, V, N$ | $dd(S) = 1/T dd(U) + p/T dd(V) - mu/T dd(N)$ |
    | 内能 | $U$ 基本能量 | $S, V, N$ | $dd(U) = T dd(S) - p dd(V) + mu dd(N)$ |
    | 焓 | $H = U + p V$ | $S, p, N$ | $dd(H) = T dd(S) + V dd(p) + mu dd(N)$ |
    | Helmholtz自由能 | $F = U - T S$ | $T, V, N$ | $dd(F) = - S dd(T) - p dd(V) + mu dd(N)$ |
    | Gibbs自由焓 | $G = U - T S + p V$ | $T, p, N$ | $dd(G) = - S dd(T) + V dd(p) + mu dd(N)$ |
    | 巨热力势 | $J = U - T S - mu N$ | $T, V, mu$ | $dd(J) = - S dd(T) - p dd(V) - N dd(mu)$ |
  ],
  caption: [特性函数与基本关系],
)

*极值原理*：不同约束下，系统趋向于使某个势极小或极大

#figure(
  three-line-table[
    | 特性函数 | 约束条件 | 极值 | 热 | 力学 | 化学 |
    | --- | --- | --- | --- | --- | --- |
    | 熵 | 孤立系统 | $S = max$ | $delta U = 0$ | $delta V = 0$ | $delta N = 0$ |
    | 内能 | 恒$S$恒$p$ | $U = min$ | $delta S = 0$ | $delta V = 0$ | $delta N = 0$ |
    | 焓 | 恒$S$恒$p$ | $H = min$ | $delta S = 0$ | $delta p = 0$ | $delta N = 0$ |
    | Helmholtz自由能 | 恒$T$恒$V$ | $F = min$ | $delta T = 0$ | $delta V = 0$ | $delta N = 0$ |
    | Gibbs自由焓 | 恒$T$恒$p$ | $G = min$ | $delta T = 0$ | $delta p = 0$ | $delta N = 0$ |
    | 巨热力势 | 恒$T$恒$V$恒$mu$ | $J = min$ | $delta T = 0$ | $delta V = 0$ | $delta mu = 0$ |
  ],
  caption: [极值原理],
)
建立热力学几何结构只要知道一个势，就可以求出：熵，压强，温度，化学势，相平衡，相变，热容量全部信息。

对于一个简单均匀系统状态可以完全由三个广延变量确定：$S,V,N$因此
$
  U = U(S,V,N)
$
这是热力学基本关系。其它变量都是导数
$
  T = (pdv(U, S))_(V, N), p = -(pdv(U, V))_(S,N), mu = (pdv(U, N))_(S,V)
$
所以：$T,p,mu$不是独立变量，他们是共轭变量（conjugate variables）。

#figure(
  three-line-table[
    | 原变量 | 共轭变量 |
    | --- | ---- |
    | $S$   | $T$    |
    | $V$   | $-p$   |
    | $N$   | $μ$    |
  ],
  caption: [特性函数的共轭变量],
)
虽然$U$是最基本的，但由于实验中很难控制$S$，所以通过Legendre变换给出其他的特性函数。不同势函数不是不同物理，只是同一函数在不同变量下的表示。

#figure(
  image("pic/builds/1.5.pdf"),
  caption: [特性函数之间的Legrendre变换],
)

== 复相系统的热力学性质

#definition(subname: [复相系统])[
  由几个*物理性质均匀*的部分构成，每一个均匀部分称为一相。
]

#definition(subname: [单元复相系统])[
  *化学成分相同*，但由不同相构成。
]

=== 粒子数可变系统的热力学方程

前面我们研究了单组分，封闭，粒子数固定系统的热力学性质。在水蒸气与液水共存、盐溶于水、气体混合、化学反应、粒子穿过半透膜的场景下，离子数$N$不是常数。

#definition(subname: [粒子数可变系统])[
  即开放系统。
]
#newpara()

设均匀系有$k$个组元(即*化学组分*)，粒子数分别记为$N_1, ..., N_k$，称之为*化学参量*。描述系统时，除几何，力学参量外，需加上化学参量。

因为对于开放系统，最常见的实验条件是：温度可控、压强可控、组分可交换；以$T, p, {N_i}$为自变量
$
  G(T, p, {N_i}), V(T, P, {N_i}), ...
$
$G$为*广延量*，则有
$
  G(T, p, lambda {N_i}) = lambda G(T, p, {N_i})
$
即
$
  G = sum_(i=1)^k N_i (pdv(G, N_i))_(T,P,N_j!=N_i) = sum_(i=1)^k N_i mu_i
$
其中第$i$组元的化学势$mu_i$定义为
$
  mu_i = (pdv(G, N_i))_(T,P,N_j!=N_i)
$
表示$T,p$不变，其它组元数量不变下，增加一个$i$组元粒子引起的$G$变化。就像温度$T$控制热量交换方向，压强$p$控制体积变化方向一样，化学势$mu_i$控制$i$组元粒子数变化的方向。对于单组分系统，化学势就是每个粒子的Gibbs自由能。

这里用到了Euler定理
#theorem(subname: [Euler定理])[
  如果齐次函数
  $
    f(lambda x_1, lambda x_2, ..., lambda x_n) = lambda^m f(x_1, x_2, ..., x_n)
  $
  则有
  $
    sum_i x_i (pdv(f, x_i)) = m f
  $
]


#theorem(subname: [Gibbs自由能])[
  Gibbs自由能的Euler定理
  $
    G = sum_i N_i mu_i
  $
  其中$N_i$是第$i$组元的粒子数，$mu_i$是第$i$组元的化学势。
]
这就是多组元系统最重要的Euler关系之一。这就很像
$
  E = sum_i epsilon_i n_i
$
但这里的$mu_i$不是单粒子能量，而是热力学边际量。

#newpara()
*粒子数可变系统的热力学方程*由此给出
$
  dd(G) = (pdv(G, T))_(p, N_i) dd(T) + (pdv(G, p))_(T, N_i) dd(p) + sum_i (pdv(G, N_i))_(T,p,N_j!=N_i) dd(N_i)
$
与封闭系统
$
  dd(G) = - S dd(T) + V dd(p)
$
比较知
$
  (pdv(G, T))_(p, N_i) = - S, (pdv(G, p))_(T, N_i) = V, (pdv(G, N_i))_(T,p,N_j!=N_i) = mu_i
$
即
$
  dd(G) = - S dd(T) + V dd(p) + sum_i mu_i dd(N_i)
$
#theorem(subname: [粒子数可变系统的热力学方程])[
  对于开放系统，Gibbs自由能的全微分式为
  $
    dd(G) = - S dd(T) + V dd(p) + sum_i mu_i dd(N_i)
  $
]
利用特性函数间关系得到
$
  dd(E) = T dd(S) - p dd(V) + sum_i mu_i dd(N_i)\
  dd(H) = T dd(S) + V dd(p) + sum_i mu_i dd(N_i)\
  dd(F) = - S dd(T) - p dd(V) + sum_i mu_i dd(N_i)\
$
其中
$
  mu_i = (pdv(E, N_i))_(S,V,N_j!=N_i) = (pdv(H, N_i))_(S,p,N_j!=N_i) = (pdv(F, N_i))_(T,V,N_j!=N_i) = (pdv(G, N_i))_(T,p,N_j!=N_i)
$
其中
$
  H = U + p V, F = U - T S, G = U - T S + p V
$
#newpara()

之后还能给出*Mole Gibbs自由能*
#definition(subname: [Mole Gibbs自由能])[
  *Mole Gibbs自由能*是每mole的Gibbs自由能，定义为
  $
    G(T, p, n) = n G_m (T, p)
  $
  其中$n$是物质的mole数，$G_m$是每mole的Gibbs自由能。因此
  $
    G_m = (pdv(G, n))_(T,p) = mu_m = g
  $
  $
    mu_m = N_A mu
  $
  其中$N_A$是Avogadro常数，$mu$是每粒子的化学势。对于单组分系统，Mole Gibbs自由能就是每mole的Gibbs自由能。
]
给出热力学方程：
$
  dd(G) = - S dd(T) + V dd(p) + sum_i mu_(m,i) dd(n_i)
$
#newpara()

再给出*偏摩尔热力学函数*
#definition(subname: [偏摩尔热力学函数])[
  任何广延量是各组元物质的量的一次齐函数（例如：体积、能量、熵），由Euler定理：
  $
    G = sum_i n_i (pdv(G, n_i))_(T,p,n_j) = sum_i n_i g_i = sum_i n_i mu_(m,i)
  $
  类似地
  $
    V = sum_i n_i (pdv(V, n_i))_(T,p,n_j) = sum_i n_i v_i\
    U = sum_i n_i (pdv(U, n_i))_(S,V,n_j) = sum_i n_i u_i\
    S = sum_i n_i (pdv(S, n_i))_(U,V,n_j) = sum_i n_i s_i
  $
  其中$v_i, u_i, s_i$分别表示第$i$组元的*偏摩尔体积*、*偏摩尔能量*和*偏摩尔熵*，表示在 $T, p$固定、其它组分不变时多加一点$i$组分，系统总体积增加多少，是“组分在混合环境中的边际贡献”。
]

=== 单元复相系的平衡条件

设孤立系有两相$alpha, beta$，系统约束有
$
  U^alpha + U^beta = U, V^alpha + V^beta = V, N^alpha + N^beta = N
$
即
$
  delta U^alpha + delta U^beta = 0, delta V^alpha + delta V^beta = 0, delta N^alpha + delta N^beta = 0
$
平衡时$S$取极大值
$
  delta S = delta S^alpha + delta S^beta = 0
$
利用热力学基本方程
$
  dd(S) = 1/T dd(U) + p/T dd(V) - mu/T dd(N)
$
有
$
  delta S = (1/T^alpha - 1/T^beta) delta U^alpha + (p^alpha/T^alpha - p^beta/T^beta) delta V^alpha - (mu^alpha/T^alpha - mu^beta/T^beta) delta N^alpha
$
其中$delta U^alpha, delta V^alpha, delta N^alpha$是独立的，因此
#theorem(subname: [单元复相系的平衡条件])[
  在单元相系中，平衡条件为：
  - 热平衡：$T^alpha = T^beta$
  - 力学平衡：$p^alpha = p^beta$
  - 相变平衡：$mu^alpha = mu^beta$
]
非孤立系，如与热源接触，类似，结果一样。

这三条条件分别对应：
#figure(
  three-line-table[
    | 平衡类型 | 条件    |
    | ---- | ----- |
    | 热平衡  | 温度相同  |
    | 力学平衡 | 压强相同  |
    | 化学平衡 | 化学势相同 |
  ],
  numbering: none,
)

=== 多元复相系的平衡条件

无化学反应下，如果系统有$k$个组元，$phi$个相，平衡条件为
#theorem(subname: [多元复相系的平衡条件])[
  在多元复相系中，平衡条件为：
  - 热平衡：$T^1 = T^2 = ... = T^phi$
  - 力学平衡：$p^1 = p^2 = ... = p^phi$
  - 化学平衡：$mu_i^1 = mu_i^2 = ... = mu_i^phi, i=1,...,k$
]
有化学反应的系统还要考虑化学平衡条件。

化学反应
$
  ch("2H2") + ch("O2") <-> ch("2H2O")
$
热力学中习惯写成
$
  ch("2H2O") - ch("2H2") - ch("O2") = 0
$
生成物系数为正，反应物系数为负，一般地：
$
  sum_(i=1)^k nu_i ch("A_i") = 0
$
其中$k$为组元总数，#ch("A_i")为第$i$组元分子式，$nu_i$为第$i$组元的化学反应系数，生成物系数为正，反应物系数为负。

对于化学反应，考虑均匀系的平衡。反应时，每一组元按反应方程中相应系数的比例变化
$
  delta N_i = nu_i delta n
$
其中共同的比例因子$delta n$称为反应进度，如果$dd(n) > 0$，表示反应正向进行，$dd(n) < 0$表示反应逆向进行。等温等压条件下，Gibbs函数极小
$
  delta G = - S delta T + V delta p + sum_i mu_i delta N_i = sum_i mu_i nu_i delta n = dd(n) sum_i nu_i mu_i = 0
$
从而得到化学平衡条件
#theorem(subname: [化学平衡条件])[
  在化学反应中，化学平衡条件为
  $
    sum_i nu_i mu_i = 0
  $
]

#newpara()

由于自发过程满足$Delta G =< 0$，因此
#theorem(subname: [化学反应的方向])[
  - $sum_i nu_i mu_i < 0$，有$dd(n) > 0$，反应正向进行
  - $sum_i nu_i mu_i > 0$，有$dd(n) < 0$，反应逆向进行
]

=== 相变热力学

相变是物质从一种相转变为另一种相的过程，例如水从液态转变为气态。相变过程中，系统的热力学性质发生显著变化。

#figure(
  image("pic/1.6.pdf", width: 40%),
  caption: [水的相图],
)

==== 相共存

首先研究*相共存条件*，相变平衡条件给出一个方程
$
  mu^(("I")) (T,Y) = mu^(("II")) (T,Y) => Y = Y(T)
$
其中$Y$为压强$p$或体积$V$，这称为*两相共存曲线*。例如水的液-气共存曲线，固-液共存曲线等。

而三相共存条件则给出两个方程
$
  mu^(("I")) (T,Y) = mu^(("II")) (T,Y) = mu^(("III")) (T,Y)
$
因此三相共存条件给出一个点，例如水的三相点。由此也可知道，单组分系统最多只能有三相共存。

#theorem(subname: [Gibbs相律])[
  $k$种组元，$phi$个共存相，的平衡条件为
  $
             T_1 = T_2 = ... = T_phi, & \
             p_1 = p_2 = ... = p_phi, & \
    mu_i^1 = mu_i^2 = ... = mu_i^phi, & i=1,...,k
  $
  独立变量数为变量数减去方程数，即为
  $
    f = (k + 1) phi - (k + 2)(phi - 1) = k + 2 - phi
  $
  也就给出了
  $
    phi <= k + 2
  $
]

#proof[
  系统是否达到平衡由强度量决定，除$T,p$外还有：
  $
    x_i = N_i/N, sum_i x_i = 1
  $
  所以所以独立成分只有$k-1$个，因此变量数为$(k-1) + 2 = k + 1$，方程数为$phi - 1$个热平衡方程，$phi - 1$个力学平衡方程，$k (phi - 1)$个化学平衡方程，共计$(k + 2)(phi - 1)$个方程，因此独立变量数为
  $
    f = (k + 1) phi - (k + 2)(phi - 1) = k + 2 - phi
  $
]

#figure(
  image("pic/1.6.1.svg", width: 70%),
  caption: [水的相图],
)

==== Clausius-Clapeyron方程

对于相平衡条件$mu^(("I")) (T,P) = mu^(("II")) (T,P)$，两相的化学势相等
- 如果给定$T, P$：$mu^(("I")) < mu^(("II"))$
  - $G$的最小值为 所有物质（$nu$ mole）变为相I
  - 相I为稳定相 $G = nu mu^(("I"))$
- 如果给定$T, P$：$mu^(("I")) > mu^(("II"))$
  - $G$的最小值为 所有物质（$nu$ mole）变为相II
  - 相II为稳定相 $G = nu mu^(("II"))$
- 如果给定$T, P$：$mu^(("I")) = mu^(("II"))$ 相I与相II平衡
  - 这给出一条相平衡线$P(T)$，即*相界线*

  我们考虑边界点$A: mu^(("I")) (T, P) = mu^(("II")) (T, P)$，在边界点$A$附近的$B$，$mu^(("I")) (T + dd(T), P + dd(P)) = mu^(("II")) (T + dd(T), P + dd(P))$，相减得到$dd(mu^((I))_m) = dd(mu^((II))_m)$，其中$mu^((i))_m$是第$i$相的每mole的化学势。根据热力学方程
  $
    dd(mu^((i))_m) = (pdv(mu^((i))_m, T))_P dd(T) + (pdv(mu^((i))_m, P))_T dd(P) = - s^(("i"))_m dd(T) + v^(("i"))_m dd(P)
  $
  其中$s^(("i"))_m$是第$i$相的每mole的熵，$v^(("i"))_m$是第$i$相的每mole的体积。由此得到
  $
    dv(P, T) = (Delta s_m) / (Delta v_m)
  $
其中$Delta s_m = s^(("II"))_m - s^(("I"))_m$是每mole的熵的改变，$Delta v_m = v^(("II"))_m - v^(("I"))_m$是每mole的体积的改变。这就是*Clausius-Clapeyron方程*。
#theorem(subname: [Clausius-Clapeyron方程])[
  相界线的斜率由两相的每mole的熵和体积的改变决定
  $
    dv(P, T) = (Delta s_m) / (Delta v_m)
  $
]

#newpara()
潜热是相变过程中每mole的热量改变
$
  lambda = T Delta s_m
$
因此
$
  dv(P, T) = lambda / (T Delta v_m)
$
#newpara()

对于大多数物质，固体密度大$V_s < V_l$，因此$Delta v_m = v_l - v_s > 0$，相界线斜率$dv(P, T) > 0$，相界线向右上方倾斜。还有物质例如水，冰的密度更小，因此$Delta v_m = v_l - v_s < 0$，相界线斜率$dv(P, T) < 0$，这就是冰融化线向左倾斜的原因。

==== 气液两相的转变和临界点

下图是#ch("CO_2")的实验等温线($p-v$图)

#figure(
  grid(columns: (1fr, 1.2fr),)[
    #image("pic/2026-03-15-01-17-59.png", width: 100%)
  ][
    #image("pic/1.7.svg", width: 100%)
  ],
  caption: [
    左图为二氧化碳等温线实验数据，右图为其相图
  ],
)
- 高温情况$T>T_C$，高温情况
  - 压强随着体积增大而降低
  - 气体行为类似理想气体
- 低温情况$T<T_C$，低温情况
  - 等温线出现水平平台：压强保持不变，但体积突然变化
  - 系统正在发生*气液两相共存*

在两相共存区域，系统可以通过改变两相的比例来适应外界条件的变化，而不需要改变压强。体积
$
  V = x_l V_l + x_g V_g, x_l + x_g = 1
$
从而有*杠杆原理*：两相的比例由外界条件决定
$
  x_l/x_g = (V_g - V) / (V - V_l)
$

#newpara()

下面的图给出了二氧化碳的$p-T$相图和$p-V$等温线图
#figure(
  image("pic/2026-03-15-13-15-26.png", width: 80%),
  caption: [二氧化碳的$p-T$相图和$p-V$等温线图],
)

我们以液气两相的转变为例说明由一相到另一相的转变过程。考虑$a, o, b$，如果维持温度不变，缓慢地增加外界的压强，系统的体积将被压缩，压强则相应增大以维持其与外界的平衡，这样系统的状态沿直线$a, o, b$变化，直到与汽化线相交于点$o$，这时开始有液体凝结，并放出热量(相变潜热)。在点$o$，气液两相平衡共存。如果系统放出的热量不断被外界吸收。物质将不断地由气相转变为液相，而保持其温度和压强不变，直到系统全部转变为液相。如果仍保持温度不变而增加外界的压强，系统的压强将相应地增大，其状态沿直线$o b$变化。

左图是$p-T$相图，图中曲线$K o C$是气液相平衡曲线；在曲线上$mu_g = mu_l$，两相可以共存。我们考虑曲线上的$o$点：处于气液两相共存状态。

而对应到$p-V$图中，$o$点对应于等温线上的水平平台：压强保持不变，但体积突然变化。在水平线$P=P_0$上与等温线的交点：$v_l,v_d,v_g$分别对应于液相体积、临界点体积、气相体积。

等温线中的水平段随温度的升高而缩短，说明液气两相的比容随温度升高而接近。当温度达到某一极限温度时，水平段的左右端重合。这时两相的比体积相等，两相的其它差别也不再存在，物质处在液气不分的状态。这一极限温度就是*临界温度*$T_C$，对应的压强是*临界压强*$P_C$，对应的体积是*临界体积*$V_C$。

在温度为$T_C$的等温线上，压强小于$P_C$时物质处在气相，压强等于或高于$P_C$时物质处在液气不分的状态。当温度高于$T_C$时，无论处在多大的压强下，物质都处于气态，液态不可能存在。由于有了临界点，我们可以从临界点上方绕过临界点，使气相连续地转变为液相而不必经过气液两相共存的阶段。

// 过C的那条钟形曲线是：自旋线或者稳定性边界线。单调下降或者有平台的线是等温线，而自旋线是每条等温线的平台的起、止点组成的的曲线。把图分成三个区域
// - 外侧区域（稳定区）$(pdv(P, V))_T < 0$，系统稳定，对应单独的气相或者液相
// - 内侧区域（不稳定区）$(pdv(P, V))_T > 0$，系统不稳定，系统会分裂成两相
// - 自旋线（稳定性边界线）$(pdv(P, V))_T = 0$，系统处于亚稳态，比如过热液体或过冷气体，系统暂时稳定但容易发生相变
*临界点$C$*是气液两相共存曲线的终点。临界等温线在临界点的切线是水平的
$
  (pdv(P, V))_T = 0
$

#newpara()


对Van de Waals气体
$
  (P + a/v^2) (v - b) = R T
$
其等温线为
$
  P = (R T) / (v - b) - a/v^2
$
#figure(
  image("pic/1.8.jpg", width: 80%),
  caption: [Van de Waals气体模拟二氧化碳的等温线],
)

Van de Waals气体的等温线与实际观测到的等温线很相像，不过在温度低于$T_c$时，Van de Waals在$p_1<p<p_2$的范围内有三个可能对应的$v_m$值。

#figure(
  image("pic/builds/1.8.pdf"),
  caption: [Van de Waals气体的等温线],
)

其中极小极大值为$v_(1 m), v_(2 m)$：在$v_(1 m) < v < v_(2 m)$的范围内，$(pdv(p, v))_T > 0$，不满足平衡稳定性条件的要求，这些状态是不可能作为均匀系而实现的。如果一个系统$(pdv(p, v))_T > 0$，则其等温压缩系数$kappa_T = - 1/v (pdv(v, p))_T$为负，系统的涨落将被放大，系统不稳定，会发生相分离，形成两相共存的状态。

现在我们根据Gibbs函数最小的要求，讨论在$P_1<P<P_2$的范围内，在给定的$T$、$P$下，什么状态是稳定的平衡状态。

化学势的全微分是
$
  dd(mu) = -S_m dd(T) + v_m dd(P)
$
由此可知，等温线上压强为$p$与压强为$p_0$的两个状态的化学势之差为
$
  mu_m - mu_(m 0) = integral_(p_0)^p v_m dd(p)
$
也就是$p-v$曲线下的面积。

积分下限固定为$O$点的压强$p_O$而沿等温线积分时，积分的数值由$O$点出发后增加，到$N$点后减少，到$J$点后又再次增加。因此在温度恒定时，$mu$随$p$的改变如下图。
- 其中$A,B$两点在下图中重合，说明两点$mu$相同；而在上图中$A$点和$B$点的相同，但体积不同
- 在$P_1<P<P_2$的范围内，对应一个$p$有三个可能的$v_m$
- 根据Gibbs判据，在给定的$T$、$P$下，系统的稳定平衡状态是使Gibbs函数最小的状态，从而$O K B A M R$上各点代表系统的稳定平衡状态，而$J D N$上各点代表系统的不稳定状态

#figure(
  image("pic/builds/1.9.pdf"),
  caption: [Van de Waals气体的等温线和化学势],
)

在$B$点物质全部处在气态，在$A$点物质全部处在液态。$B$点和$A$点的$mu$值相等，正是在等温线的温度和$A,B$两点的压强下气液两相的相变平衡条件
$
  mu_A = mu_B
$
这相当于积分
$
  integral_(B N J A) v_m dd(p) = 0
$
这是*Maxwell等面积法则*，也就确定在$p-v$图中$A B$的位置。通过Maxwell等面积法则，可以将Van de Waals气体的等温线的$A B$段替换为水平线段，从而得到更接近实际的等温线。
- $J D N$上各点代表系统的不稳定状态上的状态*不满足平衡定性的要求*，物质不可能作为均匀系存在而必将发生相变
- 线段$B N$和$A J$上的状态满足平衡稳定性的要求，  由于其化学势高于两相平衡的化学势，它们可以作为*亚稳态单相*存在，分别相应于*过饱和蒸气*和*过热液体*

又考虑到$J,N$两个极值点还有
$
  (pdv(p, v_m))_T = 0, (pdv(p, v_m, 2))_T > 0
$
以及
$
  (pdv(p, v_m))_T = 0, (pdv(p, v_m, 2))_T < 0
$
可以得到其极限情况的*临界点条件*：
$
  (pdv(p, v_m))_T = 0, (pdv(p, v_m, 2))_T = 0
$

#theorem(subname: [杠杆原理，Maxwell等面积法则，临界点条件])[
  在气液两相转变中：
  - 杠杆原理：两相的比例由外界条件决定
    $
      x_l/x_g = (V_g - V) / (V - V_l)
    $
  - Maxwell等面积法则：在$p-v$图中等温线平台端点$A,B$的位置由积分
    $
      integral_(B N J A) v_m dd(p) = 0
    $
    确定
  - 临界点条件：相变的临界点由条件
    $
      (pdv(p, v_m))_T = 0, (pdv(p, v_m, 2))_T = 0
    $
    给出
]

#newpara()

在Van de Waals气体中，临界点条件给出
$
  (pdv(p, v_m))_T = 0 => - (R T) / (v_m - b)^2 + (2 a) / v_m^3 = 0\
  (pdv(p, v_m, 2))_T = 0 => (2 R T) / (v_m - b)^3 - (6 a) / v_m^4 = 0
$
从而给出
$
  T_C = (8 a) / (27 b R), v_(m C) = 3 b, P_C = a / (27 b^2)
$
临界系数为
$
  (R T_C)/(p_C v_(m C)) = 8/3
$

#figure(
  three-line-table[
    | \ | #ch("He") | #ch("H_2") | #ch("Ne") | #ch("Ar") | #ch("O_2") | #ch("CO_2") | #ch("H_2 O") |
    | --- | --- | --- | --- | --- | --- | --- | --- |
    | 临界系数 | 3.28 | 3.27 | 3.43 | 3.42 | 3.42 | 3.65 | 4.37 |
  ],
  caption: [不同实际气体的临界系数试验值],
)

引进新的变量
$
  t^* = T/T_C, v^* = v_m/v_(m C), p^* = P/P_C
$
Van de Waals方程化为
$
  (p^* + 3/v^*^2) (v^* - 1/3) = 8 t^* / 3
$
为*Van de Waals对比方程*。这个方程中不含与具体物质性质有关的常量，这就是说，如果采用对比变量，Van de Waals方程是普适的，各种气（液）体的物态方程相同。这个结果称为*对应态定律*。

#theorem(subname: [对应态定律])[
  如果采用对比变量，Van de Waals方程是普适的，各种气（液）体的物态方程相同。Van de Waals比对方程为
  $
    (p^* + 3/v^*^2) (v^* - 1/3) = 8 t^* / 3
  $
]

=== Landau相变理论

==== 序参量

#definition(subname: [序参量，序场])[
  *序参量*$phi$是*区别不同相*的热力学量。其共轭热力学量是*序场*$H$
  $
    phi = - (pdv(G, H))_(T)
  $
]
- 磁性系统里，外磁场$H$对应的序参量就是磁化强度$M$
  $
    M = - (pdv(G, H))_(T)
  $
- 铁电系统里，外电场$E$对应的序参量就是极化强度$P$
  $
    P = - (pdv(G, E))_(T)
  $

对于序参量：
- 序参量在高对称、*无序*的相里通常为0；到了低对称、*有序*的相里变成非零，对应*对称破缺*
- 序参量可以是复数：超导、超流
- 序参量有一维标量，也可以是二维和三维的；可以与空间的维数不同
外场$H$是推动系统有序的外部操控量；序参量$phi$是系统对这个外场的响应；即使外场撤掉了，有些系统在低温下仍然保持$phi!=0$，这就叫*自发有序*。

#example(subname: [磁性系统])[

  在顺磁相（高温）里，磁矩取向杂乱，平均磁化强度，$M=0$；在铁磁相（低温）里，即使没有外磁场，也会出现自发磁化，$M!=0$。所以$M$正好可以区分两相，是磁性系统的*序参量*。

  #figure(
    image("pic/builds/1.10.pdf"),
    caption: [磁性系统的相图和序参量],
  )

  $H - T$图给出了磁性系统的相图
  - 当$T>T_c$时，体系是顺磁相（Para），平衡磁化是$M=0$
  - 当$T<T_c$且$H=0$时，体系是铁磁相（Ferro），但平衡态不是唯一的，而是两种：是$M = plus.minus M_s$。也就是说，低温下体系会自发磁化，但可以朝上，也可以朝下，这就是*自发对称破缺*。

  $M_s - T$图给出了磁化强度随温度的变化
  $
    M_s = hat(B) (1 - T/T_c)^beta
  $
  - 在$T<T_c$时，铁磁体有非零的自发磁化$M_s$，并且$M_s$随着温度的升高而减小
  - 当$T->T_c$时，$M_s->0$
  - 在$T>T_c$时，自发磁化消失
  - 序参量随着温度接近临界点连续地消失，这正是连续相变（二级相变）的典型行为

  $M - H$给出了序参量对共轭场的响应
  - 当$H>0$时，体系偏向$M>0$的那个铁磁态；
  - 当$H<0$时，体系偏向$M<0$的那个铁磁态；
  - 当$H=0$时，两种态
    $
      lim_(H->0^+) M = M_s, lim_(H->0^-) M = - M_s
    $
    都可能是平衡态，发生简并，体现自发对称破缺
]

#example(subname: [液-气相变])[
  液-气相变里，序参量是*密度差*
  $
    Delta rho = rho_l - rho_g
  $

  #figure(
    image("pic/builds/1.11.pdf"),
    caption: [液-气相变的相图和序参量],
  )

  $p - T$图给出了液-气相变的相图
  - 当$T<T_c$时，液相和气相能共存
  - 到了$T_c$时，液相和气相不再区分

  $Delta rho - T$图给出了密度差随温度的变化
  $
    Delta rho = hat(B) (1 - T/T_c)^beta
  $
  - 在$T<T_c$时，液相和气相的密度差$Delta rho$非零，并且随着温度的升高而减小
  - 当$T->T_c$时，密度差$Delta rho->0$
  - 当$T>T_c$时，液相和气相不再区分，密度差$Delta rho$消失

  $rho - p$图在$T<T_C$ 的等温线上，密度在共存压强$p_"coex"$上发生跳变
  - 一级相变的特征：当压力扫过相平衡点时，系统会从气相突然跳到液相，密度出现不连续跃变
]

#figure(
  three-line-table[
    | 系统 | 相变 | 序参量 | 例子 | $T_c$(K) |
    | --- | --- | --- | --- | --- |
    | 磁性 | 铁磁/顺磁 | 自发磁化$M$ | #ch("Fe") | $1044.0$ |
    | ^ | 反铁磁/顺磁 | 子格自发磁化$M_s$ | #ch("FeF_2") | $78.26$ |
    | 液－气 | 凝聚/蒸发 | 密度差$Delta rho = rho_l - rho_g$ | #ch("H_2 O") | $647.05$ |
    | 向列型液晶 | 取向有序 |  $1/2 expval(3 cos^2 theta - 1)$ | 4.4'-dimethylaxyazoxybenzene | $408.47$ |
    | 量子液体 | 正常液体/超流 | $expval(psi) = sqrt(rho) e^(- i phi)$ | #ch("^4He") | $2.2$ |
    | ^ | 正常导体/超导 | 波函数 | #ch("Pb") | $7.19$ |
    | 液－固 | 熔化/晶化 | $rho_G$ $G$:倒格矢 | #ch("H_2 O") | $273.16$ |
    | 合金 | 子晶格有序 | $Psi = (Delta c^"II" - Delta c^"I")/2$ | #ch("CuZn") | $739$ |
    | 介电性 | 铁电 | 极化强度$P$ | #ch("BaTiO_3") | $393$ |
    | ^ | 反铁电 | 子晶格极化$P_s$ | ^ | ^ |
  ],
  caption: [不同系统的相变类型、序参量和临界温度],
)

==== 相变的分类

当系统的自然变量是$T$、外场$Y_i$和粒子数$N_i$时，最合适的热力学势就是Gibbs自由能
$
  G = U - T S - Y y = sum_i mu_i N_id
$
微分形式为
$
  dd(G) = - S dd(T) - y dd(Y) + sum_i mu_i dd(N_i)
$
对于固定$Y,T$下实现的过程有
$
  (dd(G))_(Y,T) = sum_i mu_i dd(N_i)
$
相平衡时，几相的化学势必须相等；对单组元系统，本质上也可以说是mole Gibbs自由能相等。

相平衡时，$G$本身必须连续；但$G$对$T$、$P$、外场等变量的导数，在相变点可以不连续
$
  S = - (pdv(G, T))_(Y,N), y = - (pdv(G, Y))_(T,N)
$
的值并不要求连续。根据$G$的导数的连续性，Ehrenfest对相变进行了分类。
- 如果一级微分$pdv(G, T), pdv(G, Y)$在相变点不连续，称为*一级相变*，例如水的液-气相变
- 如果一级微分连续，但二级微分$pdv(G, T, 2), pdv(G, Y, 2)$在相变点不连续，称为*二级相变*，例如铁磁-顺磁相变
- 诸如此类可以定义更高阶的相变

#definition(subname: [一级相变])[
  在一级相变中，Gibbs自由能的一级微分
  $
    pdv(G, T), pdv(G, Y)
  $
  在相变点不连续，例如水的液-气相变。
]

#example(subname: [PVT系统——一级相变])[
  #figure(
    image("pic/builds/1.12.pdf"),
    caption: [PVT系统的$G-P, G-T, V-P, S-T$图],
  )
  在PVT系统中，Gibbs自由能$G$是压强$P$和温度$T$的函数
  $
    V = (pdv(G, P))_(T), S = - (pdv(G, T))_(P)
  $
  在一阶相变时
  $
    Delta V = V^"I" - V^"II" != 0, Delta S = S^"I" - S^"II" != 0
  $
  并且有潜热
  $
    Delta H = Delta U + P Delta V = T Delta S
  $
  #newpara()
  $V$和$S$之所以有不连续的跳变，是因为在对应的$G$，两相虽然相交于相变点，但斜率不同。
]

#example(subname: [二级相变])[
  $G$连续，一阶导数也连续，但二阶导数不连续。

  #figure(
    image("pic/builds/1.13.pdf"),
    caption: [二级相变的$G-T, S-T, C_p-T$图],
  )

  $S$和$V$都是连续的，但
  $
    C_p/T = (pdv(S, T))_p = - (pdv(G, T, 2))_p
  $
  出现奇异或突变。

  二级相变没有潜热，$L = T Delta S = 0$。
]

==== 临界现象和临界指数

临界点：*连续相变的相变点*，临界温度$T_c$。

临界现象：物质在连续相变临界点邻域的统计热力学行为。这些行为的特征是，各种物理量出现奇异，并且用*临界指数*描述。

在一级相变里，我们最先看到的是$Delta V$, $Delta S$, $Delta rho$这种有限跳变。但在连续相变里，一阶导数通常不出现跳变，真正显眼的是：
- 比热变得很大，甚至发散
- 磁化率变得很大，甚至发散
- 关联长度变得很大，甚至发散
- 序参量按某个幂次趋于 0
所以连续相变的核心语言是：幂律+临界指数

临界点附近很多量都遵循幂律，先定义一个*相对温度*，用来描述距离临界点的远近
$
  t = (T - T_c) / T_c
$
那么$t->0$时，物理量$X$的幂律行为可以写成
$
  X tilde abs(t)^lambda
$
其中$lambda$就是*临界指数*，描述了物理量$X$在临界点附近的幂律行为。比例系数叫做*临界振幅*，是非普适的，依赖于系统的微观细节；而临界指数是普适的，不依赖于系统的微观细节，只依赖于系统的对称性和空间维数。

不同的物理量有不同的临界指数，例如：

- 比热$alpha$：描述$C$的奇异
  $
    C_H tilde - (pdv(G, T, 2))_(M=0) =^(T -> T_c) cases(
      A (T/T_c - 1)^(- alpha) & T > T_c,
      A' (1 - T/T_c)^(- alpha') & T < T_c
    )
  $
- 磁化率$gamma$：描述$chi$的发散
  $
    chi_T tilde - (pdv(G, M, 2))_(T) =^(T -> T_c) cases(
      C (T/T_c - 1)^(- gamma) & T > T_c,
      C' (1 - T/T_c)^(- gamma') & T < T_c
    )
  $
- 磁化强度$beta$：描述$M_s$的消失
  $
    M_s =^(T -> T_c) B (1 - T/T_c)^beta
  $
- 状态方程$delta$：描述在$T=T_c$时$M-H$的关系
  $
    M =^(T -> T_c) D H^(1/delta)
  $


对于序参量密度$m(vb(r))$，定义
$
  M = expval(integral dd(vb(r)) m(vb(r)))
$
为其空间平均值，可以给出*关联函数*，描述空间上不同位置的序参量的相关程度
$
  Gamma(r) = expval(m(vb(r)) m(vb(0))) - expval(m(vb(r))) expval(m(vb(0)))
$
描述序参量的空间涨落和$m(vb(r))$的空间相关性。

Ornstein-Zernike形式给出，通常
$
  Gamma tilde e^(- r/xi) / r
$
一般有
$
  Gamma tilde r^(-p) e^(- r/xi), p = d - 2 + eta
$
其中$xi$是*关联长度*，描述序参量的空间相关程度，也就是一个地方的涨落能影响到多远，当$xi -> oo$时，系统的空间相关程度无限大，系统处于临界状态；当$xi$有限时，系统的空间相关程度有限，系统不处于临界状态
$
  xi = cases(
    zeta (T/T_c - 1)^(- nu) & T > T_c,
    zeta' (1 - T/T_c)^(- nu') & T < T_c
  )
$
而$eta$是*关联函数的临界指数*，描述了在临界点附近，关联函数的幂律行为。

事实上，这六个临界指数并不是独立的，而是满足一些Scaling laws
- Fisher
  $
    gamma = nu (2 - eta)
  $
- Rushbrooke
  $
    alpha + 2 beta + gamma = 2
  $
- Widom
  $
    gamma = beta (delta - 1)
  $
- Josephson
  $
    nu d = 2 - alpha
  $
  其中$d$是系统的空间维数。

这样虽然有6个临界指数，但只有2个是独立的，其他4个都可以通过Scaling laws由这两个独立的临界指数计算出来。

#definition(subname: [临界指数])[
  临界指数是描述物质在临界点附近物理量幂律行为的参数。通常有六个临界指数：$alpha$、$beta$、$gamma$、$delta$、$nu$ 和 $eta$。

  其中$alpha$描述比热的奇异，$beta$描述磁化强度的消失，$gamma$描述磁化率的发散，$delta$描述在临界温度时$M-H$的关系，$nu$描述关联长度的发散，$eta$描述关联函数的幂律行为。这六个临界指数并不是独立的，而是满足一些Scaling laws，因此只有两个是独立的。
]

==== Landau理论

前面我们已经知道连续相变附近有各种临界指数，那能不能从一个统一的自由能理论里，直接把这些性质推出来？

Landau 的回答是：可以，只要在临界点附近把自由能写成序参量$m$的幂级数展开，再用平衡态对应自由能极小来求解。

===== Landau自由能

这是一个唯象理论，不从微观Hamilton量出发，而是假设：在临界点附近，序参量很小，所以自由能可以按 $m$ 做Taylor展开
$
  F(m) = F_0 (T) + 1/2 a(T) m^2 + 1/4 b(T) m^4 + ...
$
由于系统对$m <-> - m$是对称的，展开中不含 $m$ 的奇次幂。

通常要求$b > 0$，保证自由能在$m$很大时是正的，从而有界；而$a(T)$随温度变化，决定了相变的发生。

===== Landau自由能的解

定义粗粒平均，序参量密度
$
  m(x) = (sum_(i in L^d) m_i)/L^d
$
其中$m_i$是第$i$个格点的局部序参量，$L^d$是系统的体积。这是一个忽略涨落的平均场理论。在稳定的平衡状态，$F$取得极小值，所以
$
  pdv(F, m) = m(a + b m^2) = 0\
  pdv(F, m, 2) = a + 3 b m^2 > 0
$
有三个解
$
  m = 0, m = plus.minus sqrt(- a/b)
$
- $m=0$是无序态，对应$T > T_c$时的高温相
- $m = plus.minus sqrt(- a/b)$是有序态，对应$T < T_c$时的低温相
而要求$T -> T_c$时，$m -> 0$，所以$a(T)$必须满足
$
  a(T_c) = 0
$
此外为了保证$m = plus.minus sqrt(- a/b)$有意义，有在$T < T_c$时$a(T) < 0$，另外还有二阶导数
$
  pdv(F, m, 2) = a + 3 b m^2 > 0
$
这就要求在$T > T_c$时，$a(T) > 0$。

#figure(
  three-line-table[
    | \ | $T < T_c$ | $T > T_c$ | $T = T_c$ |
    | --- | --- | --- | --- |
    | $a(T)$ | $< 0$ | $> 0$ | $= 0$ |
    | 解$m$ | $plus.minus sqrt(- a/b)$ | $0$ | $0$ |
  ],
  caption: [Landau自由能的解],
)

#figure(
  image("pic/builds/1.14.pdf"),
  caption: [Landau自由能的图像],
)

从而在临界点附近
$
  a(T) = a_0(T - T_c)/T_c = a_0 t, a_0 > 0\
  b(T) = b = "const" > 0
$
给出在临界点附近的序参量$m$
$
  m = cases(
    0 & T > T_c,
    plus.minus (a_0 / b)^(1/2) (-t)^(1/2) & T < T_c
  )
$
#newpara()
于是Landau理论给出了连续相变的*临界指数*$beta = 1/2$对应
$
  M_s = B (1 - T/T_c)^(1/2)
$
进一步，考虑自由能的极小值
$
  F = cases(
    F_0 & T > T_c,
    F_0 - a_0^2 / (4 b) (1 - T/T_c)^2 & T < T_c
  )
$
这就给出了比热的奇异
$
  C = -T (pdv(F, T, 2))
$
得到在$t -> 0$时，$C$的跳变
$
  C(t->0^-) - C(t->0^+) = a_0^2 / (2 b T_c)
$
这就意味着*临界指数*$alpha = 0$，比热有一个有限的跳变。

进一步加上外场$B$
$
  F(m, B) = F_0 + 1/2 a m^2 + 1/4 b m^4 - B m
$
设$B$很弱，平衡时
$
  pdv(F, m) = a m + b m^3 - B = 0
$
有$T=T_c$时$a=0$可以给出
$
  B = b m^3 => M = D H^(1/3)
$
这给出了*临界指数*$delta = 3$。另外有磁化率
$
  chi = mu_0 (pdv(m, B))_T = mu_0 / (a + 3 b m^2) = cases(
    mu_0 / (a_0 t) & T > T_c,
    - mu_0 / (2 a_0 t) & T < T_c
  )
$
这就给出了*临界指数*$gamma = 1$。

至此，Landau理论给出了连续相变的临界参数
$
  alpha = 0, beta = 1/2, gamma = 1, delta = 3
$
其与实验结果仍有差异，主要原因是没有考虑涨落的影响。
