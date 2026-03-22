#import "@preview/scripst:1.1.1": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch

#show: scripst.with(
  title: [统计力学第4次作业],
  author: "Anzreww",
  time: "2026年3月",
)

#exercise(subname: [补充题])[
  已知几率分布：
  $
    rho(x, y) dd(x, y) prop x y dd(x, y)
  $
  其中$x$和$y$的变化范围为$0<=x<=a, 0<=y<=b$。
  + 试将几率分布函数归一化
  + 求$y$为任意值，而$x$在$x$到$x+dd(x)$的几率
]

#solution[
  + 几率分布
    $
      rho(x, y) = C x y
    $
    归一化条件为
    $
      integral_0^a integral_0^b C x y dd(x) dd(y) = 1
    $
    即
    $
      C (a^2 b^2) / 4 = 1 => C = 4/(a^2 b^2)
    $
    从而归一化后的联合几率分布为
    $
      rho(x, y) = 4/(a^2 b^2) x y
    $
  + $y$为任意值，而$x$在$x$到$x+dd(x)$的几率为是$x$在$x$到$x+dd(x)$的边际几率，即
    $
      P(x <= X <= x + dd(x)) = integral_0^b rho(x, y) dd(x) dd(y) = integral_0^b 4/(a^2 b^2) x y dd(x) dd(y) = (2 x) / a^2 dd(x)
    $
]

#exercise(subname: [补充题])[
  根据粒子的自旋，对下列粒子进行分类，即判断它们是Boson还是Fermion：

  #ch("^12C")原子，#ch("^13C")原子，#ch("H_2")原子，#ch("H^-")离子，#ch("^3He")原子，#ch("^4He")原子，$alpha$粒子，正电子，#ch("^6Li^-")离子
]

#solution[
  Boson的自旋为整数，Fermion的自旋为半整数。一个电子、质子或中子具有自旋$1/2$，因此它们的自旋为半整数。

  只用统计组成粒子的个数奇偶性
  #figure(
    three-line-table[
      | 粒子 | 组成 | 统计 |
      | --- | --- | --- |
      | #ch("^12C")原子 | 6质子 + 6中子 + 6电子 | Boson |
      | #ch("^13C")原子 | 6质子 + 7中子 + 6电子 | Fermion |
      | #ch("H_2")原子 | 2质子 + 2电子 | Boson |
      | #ch("H^-")离子 | 1质子 + 2电子 | Fermion |
      | #ch("^3He")原子 | 2质子 + 1中子 + 2电子 | Fermion |
      | #ch("^4He")原子 | 2质子 + 2中子 + 2电子 | Boson |
      | $alpha$粒子 | 2质子 + 2中子 | Boson |
      | 正电子 | \ | Fermion |
      | #ch("^6Li^-")离子 | 3质子 + 3中子 + 4电子 | Fermion |
    ],
  )
]

#exercise(subname: [补充题])[
  + 若粒子有两个能级，每个能级的简并度为4，设系统由4个Fermion组成。问：系统可能出现哪几种分布？各分布出现的微观状态数是多少？那一种分布出现几率最大？请列表表示。
  + 将上题的粒子换成Boson，给出对应的结果。
]

#solution[
  两个能级为$epsilon_1, epsilon_2$，每个能级的简并度为$4$。宏观分布为
  $
    (n_1, n_2), n_1 + n_2 = 4
  $
  #newpara()
  + 4个Fermion的情况

    为每个能级有 4 个简并态，而 Fermion 只能占据一个态，因此每个能级最多只能有 4 个 Fermion。满足 $n_1 + n_2 = 4$ 的分布为：$(0,4), (1,3), (2,2), (3,1), (4,0)$。每种分布的微观状态数为：
    $
      Omega(n_1, n_2) = binom(4, n_1) binom(4, n_2)
    $
    从而结果为
    #figure(
      three-line-table[
        | 分布 $(n_1,n_2)$ | 微观状态数 $Omega_F$ | 概率 $P=Omega_F/Omega$ |
        | -------------- | ---------------: | -----------------: |
        | $(0,4)$          |               $1$ |            $1/70$ |
        | $(1,3)$          |               $16$ |            $16/70$ |
        | $(2,2)$          |               $36$ |            $36/70$ |
        | $(3,1)$          |               $16$ |            $16/70$ |
        | $(4,0)$          |               $1$ |            $1/70$ |
      ],
    )
    从而出现几率最大的是分布$(2,2)$。

  + 4个Boson的情况

    Boson没有占据数限制，满足 $n_1 + n_2 = 4$ 的分布为：$(0,4), (1,3), (2,2), (3,1), (4,0)$。每种分布的微观状态数为：
    $
      Omega(n_1, n_2) = binom(n_1 + 4 - 1, n_1) binom(n_2 + 4 - 1, n_2)
    $
    从而结果为
    #figure(
      three-line-table[
        | 分布 $(n_1,n_2)$ | 微观状态数 $Omega_B$ | 概率 $P=Omega_B/Omega$ |
        | -------------- | ---------------: | -----------------: |
        | $(0,4)$          |               $35$ |            $35/330$ |
        | $(1,3)$          |               $80$ |            $80/330$ |
        | $(2,2)$          |               $100$ |            $100/330$ |
        | $(3,1)$          |               $80$ |            $80/330$ |
        | $(4,0)$          |               $35$ |            $35/330$ |
      ],
    )
    从而出现几率最大的是分布$(2,2)$。
]
