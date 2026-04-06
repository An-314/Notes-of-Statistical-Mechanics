#import "@preview/scripst:1.1.1": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch
#import "@preview/physica:0.9.8": *

#show: scripst.with(
  title: [统计力学第5次作业],
  author: "Anzreww",
  time: "2026年4月",
)

#exercise(subname: [6.6])[
  设系统含有两种粒子，其粒子数分别为$N$和$N'$，粒子间的相互作用很弱，可以看作是近独立的，试计算平衡状态下两种粒子的最概然分布（分别就三种情况进行计算：经典粒子，Boson，Fermion）。并根据热力学第零定律讨论分布中的什么参数和温度对应。
]

#solution[

  满足约束条件
  $
    sum_i a_i = N, sum_i a'_i = N'\
    sum_i a_i epsilon_i + sum_i a'_i epsilon'_i = E
  $

  + 经典粒子+Boson：
    $
      Omega{a_i} = (N!)/(product_i a_i !) product_i omega_i^(a_i) \
      Omega{a'_i} = product_j (omega_i + a'_i - 1)!/(a'_i ! (omega_i - 1)!)
    $
    从而系统的微观状态数
    $
      Omega{a_i, a'_i} = Omega{a_i} Omega{a'_i} = (N!)/(product_i a_i !) product_i omega_i^(a_i) product_j (omega_i + a'_i - 1)!/(a'_i ! (omega_i - 1)!)
    $
    有Stirling公式
    $
      ln n! approx n ln n - n
    $
    得到
    $
      ln Omega{a_i, a'_i} approx\ N ln N - sum_i a_i ln a_i + sum_i a_i ln omega_i + sum_j (omega_j + a'_j) ln (omega_j + a'_j) - sum_j a'_j ln a'_j - sum_j omega_j ln omega_j
    $
    通过Lagrange乘数法求解最概然分布
    $
      pdv(Omega{a_i, a'_i}, a_i) + alpha pdv(, a_i) (N - sum_i a_i) + alpha' pdv(, a_i) (N' - sum_i a'_i) + beta pdv(, a_i) (E - sum_i a_i epsilon_i - sum_i a'_i epsilon'_i) = 0 \
      pdv(Omega{a_i, a'_i}, a'_i) + alpha pdv(, a'_i) (N' - sum_i a'_i) + alpha' pdv(, a'_i) (N - sum_i a_i) + beta pdv(, a'_i) (E - sum_i a_i epsilon_i - sum_i a'_i epsilon'_i) = 0
    $
    解得
    $
      a_i = omega_i e^(-alpha - beta epsilon_i) \
      a'_i = omega_i / (e^(alpha' + beta epsilon'_i) - 1)
    $
  + 经典粒子+Fermion：
    $
      Omega{a_i} = (N!)/(product_i a_i !) product_i omega_i^(a_i) \
      Omega{a'_i} = product_j omega_j !/(a'_j ! (omega_j - a'_j)!)
    $
    从而系统的微观状态数
    $
      Omega{a_i, a'_i} = Omega{a_i} Omega{a'_i} = (N!)/(product_i a_i !) product_i omega_i^(a_i) product_j omega_j !/(a'_j ! (omega_j - a'_j)!)
    $
    有Stirling公式
    $
      ln n! approx n ln n - n
    $
    得到
    $
      ln Omega{a_i, a'_i} approx\ N ln N - sum_i a_i ln a_i + sum_i a_i ln omega_i + sum_j omega_j ln omega_j - sum_j a'_j ln a'_j - sum_j (omega_j - a'_j) ln (omega_j - a'_j)
    $
    通过Lagrange乘数法求解最概然分布
    $
      pdv(Omega{a_i, a'_i}, a_i) + alpha pdv(, a_i) (N - sum_i a_i) + alpha' pdv(, a_i) (N' - sum_i a'_i) + beta pdv(, a_i) (E - sum_i a_i epsilon_i - sum_i a'_i epsilon'_i) = 0 \
      pdv(Omega{a_i, a'_i}, a'_i) + alpha pdv(, a'_i) (N' - sum_i a'_i) + alpha' pdv(, a'_i) (N - sum_i a_i) + beta pdv(, a'_i) (E - sum_i a_i epsilon_i - sum_i a'_i epsilon'_i) = 0
    $
    解得
    $
      a_i = omega_i e^(-alpha - beta epsilon_i) \
      a'_i = omega_j / (e^(alpha' + beta epsilon'_j) + 1)
    $
  + Boson+Fermion：
    $
      Omega{a_i} = product_i (omega_i + a_i - 1)!/(a_i ! (omega_i - 1)!) \
      Omega{a'_i} = product_j omega_j !/(a'_j ! (omega_j - a'_j)!)
    $
    从而系统的微观状态数
    $
      Omega{a_i, a'_i} = Omega{a_i} Omega{a'_i} = product_i (omega_i + a_i - 1)!/(a_i ! (omega_i - 1)!) product_j omega_j !/(a'_j ! (omega_j - a'_j)!)
    $
    有Stirling公式
    $
      ln n! approx n ln n - n
    $
    得到
    $
      ln Omega{a_i, a'_i} approx\ sum_i (omega_i + a_i) ln (omega_i + a_i) - sum_i a_i ln a_i - sum_i omega_i ln omega_i + sum_j omega_j ln omega_j - sum_j a'_j ln a'_j - sum_j (omega_j - a'_j) ln (omega_j - a'_j)
    $
    通过Lagrange乘数法求解最概然分布
    $
      pdv(Omega{a_i, a'_i}, a_i) + alpha pdv(, a_i) (N - sum_i a_i) + alpha' pdv(, a_i) (N' - sum_i a'_i) + beta pdv(, a_i) (E - sum_i a_i epsilon_i - sum_i a'_i epsilon'_i) = 0 \
      pdv(Omega{a_i, a'_i}, a'_i) + alpha pdv(, a'_i) (N' - sum_i a'_i) + alpha' pdv(, a'_i) (N - sum_i a_i) + beta pdv(, a'_i) (E - sum_i a_i epsilon_i - sum_i a'_i epsilon'_i) = 0
    $
    解得
    $
      a_i = omega_i / (e^(alpha + beta epsilon_i) - 1) \
      a'_i = omega_j / (e^(alpha' + beta epsilon'_j) + 1)
    $

  在平衡时，两类粒子虽然可以有不同的化学势参数，但温度相同，所有共享同一个$beta$。
]


#exercise(subname: [6.2])[
  试证明对于一维自由粒子，在长度$L$内，$epsilon$到$epsilon+dd(epsilon)$的能量范围内，量子态数为
  $
    D(epsilon) dd(epsilon) = (2L)/(h) sqrt((m)/(2 epsilon)) dd(epsilon)
  $
]

#proof[
  一维自由粒子在$mu$空间体积元$dd(x, p)$内可能的量子态数为
  $
    dd(x, p)/h
  $
  在长度$L$内，动量大小在$p$到$p+dd(p)$范围内的量子态数为
  $
    (2 L)/h dd(p)
  $
  由于能量动量关系为$epsilon = p^2/(2m)$，有
  $
    dd(p) = sqrt(2 m epsilon) dd(epsilon)
  $
  从而在能量范围$epsilon$到$epsilon+dd(epsilon)$内的量子态数为
  $
    D(epsilon) dd(epsilon) = (2L)/(h) sqrt((m)/(2 epsilon)) dd(epsilon)
  $
]

#exercise(subname: [6.3])[
  试证明对于二维自由粒子，在长度$L^2$内，$epsilon$到$epsilon+dd(epsilon)$的能量范围内，量子态数为
  $
    D(epsilon) dd(epsilon) = (2 pi L^2)/h^2 m dd(epsilon)
  $
]

#proof[
  二维自由粒子在$mu$空间体积元$dd(x, y, p_x, p_y)$内可能的量子态数为
  $
    dd(x, y, p_x, p_y)/h^2
  $
  在面积$L^2$内，动量大小在$p$到$p+dd(p)$范围内，动量方向在$theta$到$theta+dd(theta)$范围内，二维自由粒子可能的状态数为
  $
    (L^2 p dd(p, theta))/h^2
  $
  由于能量动量关系为$epsilon = p^2/(2m)$，有
  $
    dd(p) = sqrt(2 m epsilon) dd(epsilon)
  $
  从而在能量范围$epsilon$到$epsilon+dd(epsilon)$内的量子态数为（对$theta$积分）
  $
    D(epsilon) dd(epsilon) = (2 pi L^2)/h^2 m dd(epsilon)
  $
]

#exercise(subname: [6.4])[
  在极端相对论情形下，粒子的能量动量关系为$epsilon=c p$，试求在体积$V$内，$epsilon$到$epsilon+dd(epsilon)$的能量范围内三维粒子的量子态数。
]

#solution[
  已给出在体积$V$内，动量大小在$p$到$p+dd(p)$范围内三维自由粒子可能的量子态数为
  $
    (4 pi V)/h^3 p^2 dd(p)
  $
  极端相对论粒子的能量动量关系为$epsilon=c p$，因此有
  $
    dd(p) = 1/c dd(epsilon)
  $
  从而在能量范围$epsilon$到$epsilon+dd(epsilon)$内的量子态数为
  $
    D(epsilon) dd(epsilon) = (4 pi V)/h^3 (epsilon^2)/(c^3) dd(epsilon)
  $
]
