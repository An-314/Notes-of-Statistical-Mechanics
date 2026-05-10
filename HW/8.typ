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

#exercise(subname: [8.7])[

]

#exercise(subname: [8.9])[

]
