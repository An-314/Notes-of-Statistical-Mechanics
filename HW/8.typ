#import "@preview/scripst:1.1.1": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch
#import "@preview/physica:0.9.8": *

#show: scripst.with(
  title: [统计力学第8次作业],
  author: "Anzreww",
  time: "2026年4月",
)

#exercise(subname: [8.4])[
  试证明，在热力学极限下均匀的二维理想玻色气体不会发生玻色爱因斯坦凝聚。
]

#solution[
  二维自由粒子的状态密度为
  $
    g(epsilon) dd(epsilon) = (2 pi L^2)/h^2 m dd(epsilon)
  $
  临界温度满足
  $
    N = integral_0^oo g(epsilon) dd(epsilon)/(e^(epsilon/(k_B T_c)) - 1)
  $
  #newpara()
  代入
  $
    N & = integral_0^oo (2 pi L^2)/h^2 m dd(epsilon)/(e^(epsilon/(k_B T_c)) - 1) \
      & = (2 pi L^2)/h^2 m k_B T_c integral_0^oo dd(x)/(e^x - 1) \
  $
  积分
  $
    integral_0^oo dd(x)/(e^x - 1) = Gamma(1) zeta(1) = oo
  $
  从而在任何非零温度下都不会发生Bose-Einstein凝聚。
]

#exercise(subname: [8.5])[
  约束在磁光陷阱中的理想原子气体，在三维谐振势场
  $
    V = 1/2 m (omega_x x^2 + omega_y y^2 + omega_z z^2)
  $
  内运动，如果原子是Boson，试证明：$T <= T_c$时，将有宏观量级的原子凝聚在能量为
  $
    epsilon_0 = hbar/2 (omega_x + omega_y + omega_z)
  $
  的基态。在$N -> oo, overline(omega) -> 0$，$N overline(omega)^3$保持有限的热力学极限下，临界温度$T_c$由下式确定：
  $
    N = 1.202 ((k_B T_c) / (hbar overline(omega)))^3
  $
  其中
  $
    overline(omega) = (omega_x omega_y omega_z)^(1/3)
  $
  温度为$T$时，凝聚在基态的原子数$N_0$与总原子数$N$之比为
  $
    N_0/N = 1 - (T/T_c)^3
  $
  提示：在$T≤T_c$时，原子气体的化学势趋于$epsilon_0$在热力学极限下临界温度$T_c$由下式确定：
  $
    N = integral_0^oo dd(n_x, n_y, n_z)/(e^(epsilon_0/(k_B T_c)) - 1)
  $
]

#proof[
  约束在磁光陷阱中的原子，在三维谐振势场中运动，其能量为
  $
    epsilon = (p_x^2/(2m) + 1/2 m omega_x^2 x^2) + (p_y^2/(2m) + 1/2 m omega_y^2 y^2) + (p_z^2/(2m) + 1/2 m omega_z^2 z^2)
  $
  量子化后能量为
  $
    epsilon_(n_x, n_y, n_z) = hbar omega_x (n_x + 1/2) + hbar omega_y (n_y + 1/2) + hbar omega_z (n_z + 1/2)
  $
  如果原子是Boson，满足Bose-Einstein分布，温度为 $T$ 时处在量子态$(n_x, n_y, n_z)$上的粒子数为
  $
    a_(n_x, n_y, n_z) = 1/(e^((hbar omega_x (n_x + 1/2) + hbar omega_y (n_y + 1/2) + hbar omega_z (n_z + 1/2) - mu) 1/(k_B T)) - 1)
  $
  处在任一量子态上的粒子数均不应为负值，所以原子气体的化学势必低于最低能级的能量，即
  $
    mu < epsilon_0 = hbar/2 (omega_x + omega_y + omega_z)
  $
  化学势从由
  $
    N = sum_(n_x, n_y, n_z) a_(n_x, n_y, n_z) = sum_(n_x, n_y, n_z) 1/(e^(hbar/(k_B T) (omega_x n_x + omega_y n_y + omega_z n_z) + (epsilon_0 - mu)/(k_B T)) - 1)
  $
  化学势随温度降低而升高，当$T -> T_c$时$mu -> epsilon_0$，此时
  $
    N & = sum_(n_x, n_y, n_z) 1/(e^(hbar/(k_B T_c) (omega_x n_x + omega_y n_y + omega_z n_z)) - 1) \
      & = sum_(tilde(n)_x, tilde(n)_y, tilde(n)_z) 1/(e^(tilde(n)_x + tilde(n)_y + tilde(n)_z) - 1)
  $
  其中
  $
    tilde(n)_i = (hbar omega_i)/(k_B T_c) n_i
  $
  在
  $
    (hbar omega_i)/(k_B T_c) << 1
  $
  的热力学极限下，求和可以近似为积分，即
  $
    N & = ((k_B T_c)/(hbar tilde(omega)))^3 integral_0^oo dd(tilde(n)_x, tilde(n)_y, tilde(n)_z)/(e^(tilde(n)_x + tilde(n)_y + tilde(n)_z) - 1)\
    & = ((k_B T_c)/(hbar tilde(omega)))^3 zeta(3) \
    & = 1.202 ((k_B T_c)/(hbar tilde(omega)))^3
  $
  从而临界温度$T_c$由下式确定：
  $
    N = 1.202 ((k_B T_c) / (hbar overline(omega)))^3 <=> T_c = (hbar overline(omega))/(k_B) (N/1.202)^(1/3)
  $
  在$N -> oo, overline(omega) -> 0$，$N overline(omega)^3$保持有限的热力学极限下，$T_c$保持有限。

  在$T≤T_c$时，凝聚在基态的粒子数$N_0$
  $
    N - N_0 &= sum_(n_x, n_y, n_z) 1/(e^(hbar/(k_B T) (omega_x n_x + omega_y n_y + omega_z n_z)) - 1) \
    &= ((k_B T)/(hbar tilde(omega)))^3 integral_0^oo dd(tilde(n)_x, tilde(n)_y, tilde(n)_z)/(e^(tilde(n)_x + tilde(n)_y + tilde(n)_z) - 1) \
    &= 1.202 ((k_B T)/(hbar tilde(omega)))^3
  $
  从而
  $
    N_0/N = 1 - (T/T_c)^3
  $
]

#exercise(subname: [8.6])[
  承前8.5题，如果$omega_z >> omega_x, omega_y$, 则在$k_B T << hbar omega_z$的情形下，原子在z方向的运动将冻结在基态作零点振动，于是形成二维气体。试证明$T<=T_c$时原子的二维运动中将有宏观量级的原子凝聚在能量为$epsilon_0 = hbar/2 (omega_x + omega_y)$的基态。在$N -> oo, overline(omega) -> 0$，$N overline(omega)^3$保持有限的热力学极限下，临界温度$T_c$由下式确定：
  $
    N = 1.645 ((k_B T_c) / (hbar overline(omega)))^2
  $
  其中
  $
    overline(omega) = (omega_x omega_y)^(1/2)
  $
  温度为$T$时，凝聚在基态的原子数$N_0$与总原子数$N$之比
  $
    N_0/N = 1 - (T/T_c)^2
  $
]

#solution[
  在$omega_z >> omega_x, omega_y$的情形下，原子$z$方向的运动将冻结在基态作零点振动，于是形成二维原子气体。

  $T<T_c$的时候，原子气体的化学势趋于$epsilon_0 = hbar/2 (omega_x + omega_y)$，此时
  $
    N & = sum_(n_x, n_y) 1/(e^(hbar/(k_B T_c) (omega_x n_x + omega_y n_y)) - 1) \
      & = sum_(tilde(n)_x, tilde(n)_y) 1/(e^(tilde(n)_x + tilde(n)_y) - 1) \
      & = ((k_B T_c)/(hbar tilde(omega)))^2 integral_0^oo dd(tilde(n)_x, tilde(n)_y)/(e^(tilde(n)_x + tilde(n)_y) - 1) \
      & = Gamma(2) zeta(2) ((k_B T_c)/(hbar tilde(omega)))^2 \
      & = 1.645 ((k_B T_c)/(hbar tilde(omega)))^2
  $
  从而临界温度$T_c$由下式确定：
  $
    N = 1.645 ((k_B T_c) / (hbar overline(omega)))^2 <=> T_c = (hbar overline(omega))/(k_B) (N/1.645)^(1/2)
  $
  在$N -> oo, overline(omega) -> 0$，$N overline(omega)^3$保持有限的热力学极限下，$T_c$保持有限。

  在$T≤T_c$时，凝聚在基态的粒子数$N_0$
  $
    N - N_0 & = sum_(n_x, n_y) 1/(e^(hbar/(k_B T) (omega_x n_x + omega_y n_y)) - 1) \
            & = ((k_B T)/(hbar tilde(omega)))^2 integral_0^oo dd(tilde(n)_x, tilde(n)_y)/(e^(tilde(n)_x + tilde(n)_y) - 1) \
            & = 1.645 ((k_B T)/(hbar tilde(omega)))^2
  $
  从而
  $
    N_0/N = 1 - (T/T_c)^2
  $
]

#exercise(subname: [8.7])[
  计算温度为$T$时，在体积$V$内光子气体的平均总光子数，并据此估算
  - 温度为$1000$K的平衡辐射
  - 温度为$3$K的宇宙背景辐射中光子的数密度
]

#solution[
  在$omega$到$omega+dd(omega)$范围内光子的量子态数为
  $
    g(omega) dd(omega) = V/(pi^2 c^3) omega^2 dd(omega)
  $
  温度为$T$时平均光子数为
  $
    macron(N)(omega, T) dd(omega) = g(omega)/(e^((hbar omega)/(k_B T)) - 1) dd(omega)
  $
  因此温度为$T$时，在体积$V$内光子气体的平均光子数为
  $
    macron(N)(T) & = integral_0^oo macron(N)(omega, T) dd(omega) \
                 & =V/(pi^2 c^3) integral_0^oo omega^2/(e^((hbar omega)/(k_B T)) - 1) dd(omega) \
  $
  代入$x = (hbar omega)/(k_B T)$，上式可以化简为
  $
    macron(N)(T) & = V/(pi^2 c^3) ((k_B T)/hbar)^3 integral_0^oo x^2/(e^x - 1) dd(x) \
                 & = V/(pi^2 c^3) ((k_B T)/hbar)^3 Gamma(3) zeta(3) \
                 & = 2.404 V/(pi^2 c^3) ((k_B T)/hbar)^3
  $
  从而
  $
    n(T) & = (macron(N)(T))/V \
         & = 2.404 (k_B^3)/(pi^2 c^3 hbar^3) T^3
  $
  - $1000$K的平衡辐射中光子的数密度为
    $
      n(1000"K") = 2.404 (k_B^3)/(pi^2 c^3 hbar^3) (1000"K")^3 = 2 times 10^16 "m"^(-3)
    $
  - $3$K的宇宙背景辐射中光子的数密度为
    $
      n(3"K") = 2.404 (k_B^3)/(pi^2 c^3 hbar^3) (3"K")^3 = 5.5 times 10^8 "m"^(-3)
    $
]

#exercise(subname: [8.9])[
  按波长分布太阳辐射能的极大值在$lambda = 480$nm处，假设太阳是黑体，求太阳表面的温度。
]

#solution[
  平衡辐射内能按$omega$的分布为
  $
    u(omega, T) dd(omega) = hbar/(pi^2 c^3) omega^3/(e^((hbar omega)/(k_B T)) - 1) dd(omega)
  $
  根据
  $
    omega = (2 pi c)/lambda
  $
  上式可以化简为
  $
    u(lambda, T) dd(lambda) = - (8 pi hbar c)/(lambda^5) 1/(e^((h c)/(lambda k_B T)) - 1) dd(lambda)
  $
  令$x = (h c)/(lambda k_B T)$，上式可以化简为
  $
    u(x, T) dd(x) = (8 pi hbar c)/(lambda^5) 1/(e^x - 1) dd(x)
  $
  极大波长由
  $
    dv(, x) (x^5)/(e^x - 1) = 0
  $
  解出
  $
    lambda_"m" T = (h c)/(4.965 k_B) = 2.898 times 10^(-3) "m" K
  $
  #newpara()
  太阳表面的温度为
  $
    T = (h c)/(4.965 k_B lambda_"m") = 6000 K
  $
]
