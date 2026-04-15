#import "@preview/scripst:1.1.1": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch
#import "@preview/physica:0.9.8": *

#show: scripst.with(
  title: [统计力学第7次作业],
  author: "Anzreww",
  time: "2026年4月",
)

#exercise(subname: [7.20])[
  试求Einstein固体的熵。
]

#solution[
  Einstein固体假设$3N$个简正模的频率都相同，单个振子的的配分函数为
  $
    Z(beta) = sum_(n=0)^oo e^(- beta epsilon_n) = sum_(n=0)^oo e^(- beta (n + 1/2) h nu) = e^(- 1/2 beta h nu) / (1 - e^(- beta h nu))
  $
  $
    ln Z = - 1/2 beta h nu - ln (1 - e^(- beta h nu))
  $
  从而熵为
  $
    S & = 3 N k_B (ln Z - beta pdv(ln Z, beta)) \
    & = 3 N k_B ( - 1/2 beta h nu - ln (1 - e^(- beta h nu)) + 1/2 beta h nu + (beta h nu e^(- beta h nu)) / (1 - e^(- beta h nu)) ) \
    & = 3 N k_B ( - ln (1 - e^(- beta h nu)) + (beta h nu e^(- beta h nu)) / (1 - e^(- beta h nu)) )
  $
]

#exercise(subname: [7.22])[
  以$n$表示晶体中原子的密度，设原子的总角动量量子数为$1$，磁矩为$μ$，在外磁场$B$下，原子磁矩可以有三个不同的取向，即平行、垂直、反平行于外磁场。假设磁矩之间的相互作用可以忽略，试求在温度为$T$时晶体的磁化强度$M$，以及$M$在弱场高温极限和强场低温极限下的近似值。
]

#solution[
  粒子的能级
  $
    epsilon_i = - mu B, 0, mu B
  $
  粒子配分函数为
  $
    Z(beta, B) = sum_(m=-1)^1 e^(- beta epsilon_i) = e^(beta mu B) + 1 + e^(-beta mu B) = 1 + 2 cosh(beta mu B)
  $
  从而对数为
  $
    ln Z = ln (1 + 2 cosh(beta mu B))
  $
  晶体的磁化强度为
  $
    M = N/beta pdv(ln Z, B) = N mu (2 sinh(beta mu B)) / (1 + 2 cosh(beta mu B))
  $
  弱场高温极限有$beta mu B << 1$，此时
  $
    sinh(beta mu B) approx beta mu B, cosh(beta mu B) approx 1
  $
  从而
  $
    M approx N mu (2 beta mu B) / 3 = 2/3 (N mu^2 B) / (k_B T)
  $
  是Curie定律
  $
    M = chi H, chi = 2/3 (N mu^2) / (k_B T) mu_0
  $
  强场低温极限有$beta mu B >> 1$，此时
  $
    sinh(beta mu B) approx 1/2 e^(beta mu B), cosh(beta mu B) approx 1/2 e^(beta mu B)
  $
  从而
  $
    M approx N mu (e^(beta mu B)) / (e^(beta mu B)) = N mu
  $
  是饱和磁化强度
]

#exercise(subname: [补充题])[
  顺磁固体#ch("Gd2(SO4)3·(H2O)8")的顺磁性来自#ch("Gd^(3+)")离子，#ch("Gd^(3+)")离子基态的谱项为$""^8S_(7/2) (L=0,J=S=7/2)$，试求在高温和低温极限下#ch("Gd2(SO4)3·(H2O)8")的磁化率。
]

#solution[
  原子的磁矩可以表示为
  $
    vb(mu) = g (- e/(2m)) vb(J)
  $
  其中
  $
    g = 1 + (J(J+1) + S(S+1) - L(L+1)) / (2 J(J+1)) = 2
  $
  原子磁矩在$z$方向的投影为
  $
    mu_z = g m_z mu_B, m_z = -7/2, -5/2, ..., 7/2
  $
  从而原子能级为
  $
    epsilon_m = - vb(mu) dot vb(B) = g mu_B B m_z
  $
  其中
  $
    mu_B = (e hbar) / (2 m)
  $
  是Bohr磁子。原子配分函数为
  $
    Z = sum_(m=-7/2)^(7/2) e^(- beta epsilon_m) = sum_(m=-7/2)^(7/2) e^(- beta g mu_B B m_z) = (sinh((7/2 + 1/2) beta g mu_B B)) / (sinh((1/2) beta g mu_B B))
  $
  则有
  $
    ln Z = ln (sinh((7/2 + 1/2) beta g mu_B B)) - ln (sinh((1/2) beta g mu_B B))
  $
  顺磁性固体的磁化强度为
  $
    M &= N/beta pdv(ln Z, B) \
    & = N g mu_B ( 4 cosh(4 beta g mu_B B) / sinh(4 beta g mu_B B) - 1/2 cosh(1/2 beta g mu_B B) / sinh(1/2 beta g mu_B B))\
  $
  #newpara()
  在高温极限有$beta g mu_B B << 1$，此时
  $
    coth x approx 1/x + x/3
  $
  从而
  $
    M approx N g mu_B (4 (1/4 1/(beta g mu_B B) + 4/3 beta g mu_B B) - 1/2 (2 1/(beta g mu_B B) + 1/6 beta g mu_B B)) = 21 (N mu_B^2 B)/(k T)
  $
  低温极限有$beta g mu_B B >> 1$，此时
  $
    coth x approx 1
  $
  从而
  $
    M approx N g mu_B (4 - 1/2) = 7 N mu_B
  $
]

#exercise(subname: [补充题])[
  银原子蒸气置于磁场中，它的磁矩只能取两个方向，沿磁场方向与逆磁场方向。求
  + 磁矩沿磁场方向的分子占总数的成分比
  + 单个分子的平均磁矩
]

#solution[
  银原子蒸气是两能级磁矩系统，由于磁矩只能取两个方向：
  - 沿磁场方向：$epsilon_+ = - mu B$
  - 逆磁场方向：$epsilon_- = mu B$
  + 磁矩沿磁场方向的分子占总数的成分比，由Boltzmann分布给出：
    $
      N_+ / N & = e^(beta mu B)/(e^(beta mu B) + e^(- beta mu B)) = 1 / (1 + e^(- 2 beta mu B)) \
      N_- / N & = e^(- beta mu B)/(e^(beta mu B) + e^(- beta mu B)) = 1 / (1 + e^(2 beta mu B))
    $
  + 单个分子的平均磁矩
    $
      overline(mu) & = mu N_+/N + (- mu) N_-/N \
                   & = mu (N_+ - N_-)/N \
                   & = mu (e^(beta mu B) - e^(- beta mu B)) / (e^(beta mu B) + e^(- beta mu B)) \
                   & = mu tanh((mu B)/(k T))
    $
]
