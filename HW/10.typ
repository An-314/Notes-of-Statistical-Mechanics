#import "@preview/scripst:1.1.1": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch
#import "@preview/physica:0.9.8": *

#show: scripst.with(
  title: [统计力学第10次作业],
  author: "Anzreww",
  time: "2026年5月",
)

#exercise(subname: [8.14])[
  利试求绝对零度下金属自由电子气体中电子的平均速率$macron(v)$
]

#solution[
  绝对零度下自由电子气体中电子动量(大小)的分布为
  $
    f(p) = cases(
      1 & " " 0 <= p <= p_F,
      0 & " " p > p_F
    )
  $
  其中$p_F$是Fermi动量，电子的平均动量为
  $
    overline(p) = (integral_0^oo p f(p) g(p) dd(p)) / (integral_0^oo f(p) g(p) dd(p))
  $
  其中$g(p)$是每单位体积动量空间的态密度，$g(p) = (2s+1) 4 pi p^2 / h^3$，其中$s=1/2$是电子自旋。计算得到
  $
    overline(p) = (1/4 p_F^4)/(1/3 p_F^3) = 3/4 p_F
  $
  因此电子的平均速率为
  $
    macron(v) = overline(p)/m = 3/4 v_F
  $
]

#exercise(subname: [8.18])[
  试求在极端相对论条件下，自由电子气体在$0"K"$时的Fermi能量、内能和简并压。
]

#solution[
  在极端相对论条件下，电子的能量与动量的关系为
  $
    epsilon = p c
  $
  其中$c$是光速。Fermi能量$epsilon_F$由Fermi动量$p_F$决定，满足
  $
    g(epsilon) dd(epsilon) = (8 pi V)/(c h)^3 epsilon^2 dd(epsilon)
  $
  $0"K"$下自由电子气体的分布为
  $
    f(epsilon) = cases(
      1 & " " epsilon <= epsilon_F,
      0 & " " epsilon > epsilon_F
    )
  $
  Fermi能量满足
  $
    N = integral_0^oo f(epsilon) g(epsilon) dd(epsilon) = (8 pi V)/(c h)^3 integral_0^epsilon_F epsilon^2 dd(epsilon) = (8 pi V)/(c h)^3 1/3 epsilon_F^3
  $
  故
  $
    epsilon_F = ((3n)/(8pi))^(1/3) c h
  $
  从而$0"K"$下电子气体的内能为
  $
    U & = integral_0^oo epsilon f(epsilon) g(epsilon) dd(epsilon) \
      & = (8 pi V)/(c h)^3 integral_0^epsilon_F epsilon^3 dd(epsilon) = (8 pi V)/(c h)^3 1/4 epsilon_F^4 = 3/4 N epsilon_F
  $
  简并压由热力学关系$p = - (pdv(U, V))_N$给出，计算得到
  $
    p = 1/3 U/V = 1/4 n epsilon_F
  $
]

#exercise(subname: [8.19])[
  假设自由电子在二维平面上运动，面密度为$n$，试求$0"K"$时二维电子气体的Fermi能量、内能和简并压。
]

#solution[
  二维自由电子的量子态数为
  $
    g(epsilon) dd(epsilon) = (4pi A)/h^2 m dd(epsilon)
  $
  $0"K"$下自由电子的分布为
  $
    f(epsilon) = cases(
      1 & " " epsilon <= epsilon_F,
      0 & " " epsilon > epsilon_F
    )
  $
  Fermi能量满足
  $
    N = integral_0^oo f(epsilon) g(epsilon) dd(epsilon) = (4pi A)/h^2 m integral_0^epsilon_F dd(epsilon) = (4pi A)/h^2 m epsilon_F
  $
  故
  $
    epsilon_F = (h^2 m n)/(4pi)
  $
  $0"K"$下二维自由电子气体的内能为
  $
    U = integral_0^oo epsilon f(epsilon) g(epsilon) dd(epsilon) = (4pi A)/h^2 m integral_0^epsilon_F epsilon dd(epsilon) = (4pi A)/h^2 m 1/2 epsilon_F^2 = 1/2 N epsilon_F
  $
  简并压由热力学关系$p = - (pdv(U, A))_N$给出，计算得到
  $
    p = U/A = 1/2 n epsilon_F
  $
]

#exercise(subname: [8.21])[
  试根据热力学公式
  $
    S = integral C_V/T dd(T)
  $
  求低温下金属中自由电子气体的熵
]

#solution[
  低温下金属中自由电子气体的定容热容为
  $
    C_V = N k_B pi^2/2 (k_B T)/epsilon_F
  $
  有
  $
    S = integral (C_V/T dd(T) + (pdv(p, T))_V dd(V)) + S_0
  $
  由于$p$与$T$无关，$(pdv(p, T))_V = 0$，因此
  $
    S = pi^2/2 (N k_B^2)/epsilon_F integral_0^T dd(T)= pi^2/2 (N k_B^2)/epsilon_F T
  $
]

#exercise(subname: [8.24])[
  关于原子核半径$R$的经验公式给出$R=(1.3 times 10^(-15)"m") A^(1/3)$，式中$A$是原子核所含核子数。假设质子数和中子数相等，均为$A/2$。试计算二者在核内的密度$n$。如果将核内的质子和中子看作简并Fermi气体，试求二者的$mu(0)$以及核子在核内的平均动能。核子质量$m_0= 1.67 times 10^(-27) "kg"$。
]

#solution[
  根据核半径的经验公式
  $
    R = (1.3 times 10^(-15)"m") A^(1/3)
  $
  假设核内质子数和中子数相等，均为$A/2$，则二者的密度均为
  $
    n = (A/2)/(4/3 pi (1.3 times 10^(-15)"m")^3 A) approx 0.05 times 10^45 "m"^(-3)
  $
  简并Fermi气体的Fermi能为
  $
    mu_0 = epsilon_F = hbar^2/(2 m_0) (3 pi^2 n)^(2/3) = 0.43 times 10^(-11) "J" approx 27 "MeV"
  $
  核子在核内的平均能量为
  $
    overline(epsilon) = 3/5 epsilon_F = 0.26 times 10^(-11) "J" approx 16 "MeV"
  $
]

#exercise(subname: [5.12])[
  证明，在任意温度下电子气的顺磁化率由下式给出
  $
    chi = 2 mu_B^2 integral g'(epsilon) f(epsilon) dd(epsilon)
  $
  其中$g(epsilon)$是不计自旋简并度时电子的每单位体积的态密度，并由上式导出$T=0"K"$时的顺磁化率，与非简并条件下的顺磁化率。
]

#solution[
  电子有两个自旋取向。外磁场$B$下，能量分裂为
  $
    epsilon_"up" = epsilon - mu_B B, epsilon_"down" = epsilon + mu_B B
  $
  数密度为
  $
    n_"up" = integral_0^oo g(epsilon) f(epsilon - mu_B B) dd(epsilon), n_"down" = integral_0^oo g(epsilon) f(epsilon + mu_B B) dd(epsilon)
  $
  其中
  $
    f(epsilon) = 1/(exp((epsilon - mu)/(k_B T)) + 1)
  $
  保留一阶项，得到
  $
    f(epsilon - mu_B B) approx f(epsilon) - mu_B B f'(epsilon), f(epsilon + mu_B B) approx f(epsilon) + mu_B B f'(epsilon)
  $
  从而
  $
    n_"up" - n_"down" = - 2 mu_B B integral_0^oo g(epsilon) f'(epsilon) dd(epsilon)
  $
  从而
  $
    M = mu_B (n_"up" - n_"down") = - 2 mu_B^2 B integral_0^oo g(epsilon) f'(epsilon) dd(epsilon)
  $
  顺磁化率为
  $
    chi = M/B = - 2 mu_0^"vac" mu_B^2 integral_0^oo g(epsilon) f'(epsilon) dd(epsilon)
  $
  其中$mu_0^"vac"$是真空磁导率。通过分部积分得到
  $
    chi = 2 mu_0^"vac" mu_B^2 integral_0^oo g'(epsilon) f(epsilon) dd(epsilon)
  $
  - $T=0$时
    $
      f(epsilon) = cases(
        1 & " " epsilon < epsilon_F,
        0 & " " epsilon > epsilon_F
      )
    $
    积分得到
    $
      chi = 2 mu_0^"vac" mu_B^2 g(epsilon_F)
    $
    而
    $
      n = 2 integral_0^epsilon_F g(epsilon) dd(epsilon) = 4/3 g(epsilon_F) epsilon_F
    $
    $
      g(epsilon_F) = (3 n)/(4 epsilon_F)
    $
    因此
    $
      chi = 3/2 mu_0^"vac" (mu_B^2 n)/epsilon_F
    $
  - 非简并条件下
    $
      f(epsilon) approx exp(-(epsilon - mu)/(k_B T)), f'(epsilon) approx - beta f(epsilon)
    $
    得到
    $
      chi = 2 mu_0^"vac" mu_B^2 integral_0^oo g(epsilon) beta f(epsilon) dd(epsilon) = 2 mu_0^"vac" mu_B^2 beta n
    $
    有
    $
      integral_0^oo g(epsilon) f(epsilon) dd(epsilon) = n/2
    $
    从而
    $
      chi = 2 mu_0^"vac" mu_B^2 beta n/2 = mu_0^"vac" (mu_B^2 n)/(k_B T)
    $
]
