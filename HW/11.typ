#import "@preview/scripst:1.1.1": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch
#import "@preview/physica:0.9.8": *

#show: scripst.with(
  title: [统计力学第11次作业],
  author: "Anzreww",
  time: "2026年5月",
)

#exercise(subname: [9.2])[
  试用正则分布求单原子分子理想气体的物态方程、内能、熵和化学势。
]

#solution[
  由$N$个单原子分子组成的理想气体，其能量的经典表达式为
  $
    E = sum_(i=1)^3N p_i^2/(2m)
  $
  配分函数$Z$为
  $
    Z & = 1/(N! h^3N) integral e^(-beta E) dd(p_1)...dd(p_3N) dd(q_1)...dd(q_3N) \
      & = V^N / (N! h^3N) (integral e^(-beta p^2/(2m)) dd(p))^(3N) \
      & = V^N / (N! h^3N) ((2 pi m) / beta)^((3N)/2) \
      & = V^N/N! ((2 pi m) / (beta h^2))^((3N)/2)
  $
  气体的压强为
  $
    p = 1/beta pdv(ln Z, V) = N/beta pdv(ln V, V) = N k_B T / V
  $
  即物态方程
  $
    p V = N k_B T
  $
  气体的内能为
  $
    U = - pdv(beta ln Z, beta) = (3N)/2 1/beta = 3/2 N k_B T
  $
  气体的熵为
  $
    S = k_B (ln Z + beta U) = k_B (ln(V^N/N! ((2 pi m) / (beta h^2))^((3N)/2)) + (3N)/2) \
    = 3/2 N k_B ln T + N k_B ln(V/N) + N k_B ln ((2 pi m k_B) / h^2)^(3/2) + 5/2 N k_B
  $
  一个分子的化学势
  $
    mu & = (pdv(F, N))_(T,V) = -k_B T pdv(ln Z, N) \
       & = -k_B T (N ln V - N(ln N - 1) + (3N)/2 ln((2 pi m) / (beta h^2))) \
       & = k_B T ln N/V (h^2/(2 pi m k_B T))^(3/2) \
  $
]

#exercise(subname: [9.4])[
  体积为$V$的容器内盛有$A$、$B$两种组元的单原子分子混合理想气体，其物质的量分别为$N_A$和$N_B$，温度为$T$. 试用正则系综理论计算混合理想气体的物态方程、内能、熵和化学势。
]

#solution[
  能量的经典表达式为
  $
    E = sum_(i=1)^(3N_A) p_i^2/(2m_A) + sum_(j=1)^(3N_B) p_j^2/(2m_B)
  $
  配分函数为
  $
    Z & = 1/(N_A! N_B! h^(3N_A + 3N_B)) integral e^(-beta E) dd(p_1)...dd(p_(3N_A + 3N_B)) dd(q_1)...dd(q_(3N_A + 3N_B)) \
    & = V^(N_A + N_B) / (N_A! N_B! h^(3N_A + 3N_B)) (integral e^(-beta p^2/(2m_A)) dd(p))^(3N_A) (integral e^(-beta p^2/(2m_B)) dd(p))^(3N_B) \
    & = V^(N_A + N_B) / (N_A! N_B! h^(3N_A + 3N_B)) ((2 pi m_A) / beta)^((3N_A)/2) ((2 pi m_B) / beta)^((3N_B)/2)\
    & = Z_A Z_B
  $
  压强为
  $
    p = 1/beta pdv(ln Z, V) = (N_A + N_B) k_B T / V
  $
  内能为
  $
    U = - pdv(beta ln Z, beta) = 3/2 (N_A + N_B) k_B T
  $
  熵为
  $
    S = k_B (ln Z + beta U) = k_B (ln(Z_A Z_B) + 3/2 (N_A + N_B)) \
    = 3/2 N_A k_B ln T + N_A k_B ln(V/N_A) + N_A k_B ln ((2 pi m_A k_B) / h^2)^(3/2) + 5/2 N_A k_B \
    + 3/2 N_B k_B ln T + N_B k_B ln(V/N_B) + N_B k_B ln ((2 pi m_B k_B) / h^2)^(3/2) + 5/2 N_B k_B
  $
  化学势为
  $
    mu_A & = (pdv(F, N_A))_(T,V,N_B) = -k_B T pdv(ln Z, N_A) \
         & = -k_B T (N_A ln V - N_A(ln N_A - 1) + (3N_A)/2 ln((2 pi m_A) / (beta h^2))) \
         & = k_B T ln N_A/V (h^2/(2 pi m_A k_B T))^(3/2) \
    mu_B & = (pdv(F, N_B))_(T,V,N_A) = -k_B T pdv(ln Z, N_B) \
         & = -k_B T (N_B ln V - N_B(ln N_B - 1) + (3N_B)/2 ln((2 pi m_B) / (beta h^2))) \
         & = k_B T ln N_B/V (h^2/(2 pi m_B k_B T))^(3/2) \
  $
]

#exercise(subname: [9.3])[
  试根据正则分布的涨落公式求单原子和双原子分子理想气体的能量相对涨落。
]

#solution[
  单原子分子理想气体的能量相对涨落为
  $
    overline((E - overline(E))^2) / overline(E)^2 = (k_B T^2 C_V)/(overline(E)^2) = (k_B T^2 (3/2 N k_B))/(3/2 N k_B T)^2 = 2/(3N)
  $
  双原子分子理想气体的能量相对涨落为
  $
    overline((E - overline(E))^2) / overline(E)^2 = (k_B T^2 C_V)/(overline(E)^2) = (k_B T^2 (5/2 N k_B))/(5/2 N k_B T)^2 = 2/(5N)
  $
]

#exercise(subname: [9.6])[
  有$N$个被吸附在液体表面的分子形成一种二维气体。若两分子间相互作用位能为$u(r)$，试用正则分布证明，二维气体的物态方程为
  $
    P S = N k_B T(1 + B/S)
  $
  其中
  $
    B = - N/2 integral_0^oo (e^(-u/(k_B T)) - 1) 2 pi r dd(r)
  $
]

#solution[
  二维气体的能量为
  $
    E = sum_(i=1)^(2N) p_i^2/(2m) + sum_(i<j) phi(r_(i j))
  $
  气体的配分函数为
  $
    Z = 1/(N! h^(2N)) integral product_(i=1)^(2N) e^(-beta p_i^2/(2m)) dd(p_i) integral product_(i<j) e^(-beta phi(r_(i j))) dd(q_i) \
    = 1/(N! h^(2N)) ((2 pi m)/(beta h^2))^N Q
  $
  其中
  $
    Q = integral product_(i<j) e^(-beta phi(r_(i j))) dd(q_i) \
  $
  同样，引入Mayer函数
  $
    e^(- beta sum_(i<j) phi(r_(i j))) = product_(i<j) (1 + f(r_(i j))) approx 1 + sum_(i<j) f(r_(i j))
  $
  则有
  $
    Q & = S^N + N^2/2 integral f(r) 2 pi r dd(r) S^(N-2) \
      & = S^N (1 - B/S)
  $
  气体的压强为
  $
    P & = 1/beta pdv(ln Z, S) = 1/beta pdv(, S) (ln(S^N) + ln(1 - B/S)) = 1/beta N/S - 1/beta pdv((- B/S), S) \
      & = N k_B T / S + N k_B T B / S^2
  $
  从而得到物态方程
  $
    P S = N k_B T(1 + B/S)
  $
]

#exercise(subname: [9.14])[
  求Ising模型在平均场近似下的临界指数。
]

#solution[
  在平均场近似下，Ising 模型的自洽方程是
  $
    overline(S) = tanh(beta z epsilon overline(S))
  $
  其中$z$是配位数，$epsilon>0$是铁磁相互作用常数。临界温度
  $
    T_c = z epsilon / k_B
  $
  令
  $
    overline(S) = m, h = mu_0 mu H, K = z epsilon
  $
  则自洽方程可以写成
  $
    m = tanh(beta K m + beta h) <=> tanh^(-1) m = beta(K m + h)
  $
  在临界点$m<<1$展开
  $
    tanh^(-1) m = m + m^3/3 + O(m^5)
  $
  从而
  $
    m + m^3/3 = beta K m + beta h
  $
  则有
  $
    beta h = (1 - beta K)m + m^3/3
  $
  也有
  $
    beta K = T_cc/T
  $
  - 磁化强度指数$beta_"crit"$

    无外场时$h=0$，有
    $
      m^2 = 3 (beta K - 1) = 3 (T_c/T - 1)
    $
    从而
    $
      m prop (T_c - T)^(1/2)
    $
    临界指数为$beta_"crit" = 1/2$
  - 磁化率指数$gamma$

    磁化率定义为
    $
      chi = (pdv(M, H))_(T)
    $
    有
    $
      m = (beta h)/(1 - beta K) = (beta h)/(T/T_c - 1)
    $
    得到
    $
      chi prop 1/(T/T_c - 1)
    $
    临界指数为$gamma = 1$
  - 临界等温线指数$delta$

    在临界温度$T=T_c$处，有
    $
      beta h = m^3/3
    $
    则有
    $
      m prop h^(1/3)
    $
    临界指数为$delta = 3$
  - 比热指数$alpha$

    在平均场近似中，每个近邻对平均贡献近似为
    $
      - epsilon overline(S_i S_j) = - epsilon m^2
    $
    $
      U = - (N z epsilon)/ 2 m^2
    $
    高温$T>T_c$
    $
      m = 0, U = 0
    $
    低温$T<T_c$
    $
      m^2 = 3 (T_c/T - 1), U prop - (T_c - T)
    $
    从而
    $
      C_H = (pdv(U, T))_H
    $
    在临界点$T=T_c$处，$C_H$不连续，临界指数为$alpha = 0$
]
