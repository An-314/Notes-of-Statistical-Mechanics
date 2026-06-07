#import "@preview/scripst:1.1.1": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch
#import "@preview/physica:0.9.8": *

#show: scripst.with(
  title: [统计力学第12次作业],
  author: "Anzreww",
  time: "2026年6月",
)

#exercise(subname: [9.14])[
  证明在巨正则系综理论中熵可表示为
  $
    S = - k_B sum_N sum_s rho_N_s ln rho_N_s
  $
  其中
  $
    rho_N_s = 1/Xi e^(- alpha N - beta E_s)
  $
  是系统具有$N$个粒子、处在状态$s$的概率。
]

#proof[
  巨正则系综的配分函数为
  $
    Xi = sum_N sum_s e^(- alpha N - beta E_s)
  $
  系统具有$N$个粒子、处在状态$s$的概率为
  $
    rho_N_s = 1/Xi e^(- alpha N - beta E_s)
  $
  巨正则系综的$S$
  $
    S & = k_B (ln Xi + alpha N + beta U) \
      & = k_B (ln Xi + alpha sum_N sum_s N rho_N_s + beta sum_N sum_s E_s rho_N_s) \
      & = k_B sum_N sum_s rho_N_s (ln Xi + alpha N + beta E_s) \
      & = - k_B sum_N sum_s rho_N_s ln rho_N_s
  $
]

#exercise(subname: [9.16])[
  设单原子分子理想气体与固体吸附面接触达到平衡，被吸附的分子可以在吸附面上作二维运动，其能量为$p^2/(2m) - epsilon_0$，束缚能$epsilon_0$是大于零的常量。试根据巨正则分布求吸附面上被吸附分子的面密度与气体温度和压强的关系。
]

#solution[
  二维气体的巨配分函数为
  $
    Xi & = sum_N sum_s e^(- alpha N - beta E_s) \
       & = sum_N e^(-alpha N) Z_N (T, A)
  $
  其中$Z_N (T, A)$是吸附面上有$N$个分子时二维气体的正则配分函数
  $
    Z_N (T, A) & = 1/N! (Z_1 (T, A))^N \
  $
  其中
  $
    Z_1 (T, A) & = 1/h^2 integral e^(-beta (p^2/(2m) - epsilon_0)) dd(p_x) dd(p_y) A \
               & = A (2 pi m)/(beta h^2) e^(beta epsilon_0)
  $
  得到巨配分函数
  $
    Xi & = sum_N 1/N! (A (2 pi m)/(beta h^2) e^(beta epsilon_0) e^(-alpha))^N \
       & = exp(A (2 pi m)/(beta h^2) e^(beta epsilon_0) e^(-alpha))
  $
  吸附面上的平均分子数为
  $
    overline(N) = - pdv(ln Xi, alpha) = A (2 pi m)/(beta h^2) e^(beta epsilon_0) e^(-alpha)
  $
  而单原子分子理想气体的化学势可以表示为
  $
    mu = h T ln (p/(k_B T) (h^2/(2 pi m k_B T))^(3/2))
  $
  从而吸附面上被吸附分子的面密度为
  $
    overline(N) & = p/(k_B T) (h^2/(2 pi m k_B T))^(1/2) e^(epsilon_0/(k_B T)) \
  $
]

#exercise(subname: [9.19])[
  光子气的$alpha=0$，试证明
  $
    overline((a_i - overline(a_i))^2) = - 1/beta pdv(overline(a_i), epsilon_i)
  $
  从而证明
  $
    overline((a_i - overline(a_i))^2) = overline(a_i) (overline(a_i) + 1)
  $
]

#proof[
  $alpha=0$有
  $
    Xi_i = sum_a_i e^(- beta epsilon_i a_i)
  $
  从而
  $
    overline(a_i) = - 1/Xi pdv(Xi_i, beta epsilon_i)
  $
  从而
  $
    - pdv(overline(a_i), beta epsilon_i) & = - 1/Xi pdv(Xi_i, (beta epsilon_i), 2) + 1/Xi^2 (pdv(Xi_i, beta epsilon_i))^2 \
                                         & = overline(a_i^2) - overline(a_i)^2 \
  $
  从而
  $
    overline((a_i - overline(a_i))^2) & = overline(a_i^2) - overline(a_i)^2 \
                                      & = - 1/beta pdv(overline(a_i), epsilon_i) \
  $
  对于光子气体，有
  $
    overline(a_i) = 1/(e^(beta epsilon_i) - 1)
  $
  从而
  $
    overline((a_i - overline(a_i))^2) & = - 1/beta pdv(overline(a_i), epsilon_i) \
                                      & = 1/(e^(beta epsilon_i) - 1) (1/(e^(beta epsilon_i) - 1) + 1) \
                                      & = overline(a_i) (overline(a_i) + 1)
  $
]
