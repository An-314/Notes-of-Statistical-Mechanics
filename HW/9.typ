#import "@preview/scripst:1.1.1": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch
#import "@preview/physica:0.9.8": *

#show: scripst.with(
  title: [统计力学第9次作业],
  author: "Anzreww",
  time: "2026年5月",
)

#exercise(subname: [9.9])[
  利用Debye频谱求固体在高温和低温下配分函数的对数$ln Z$，从而求内能和熵。
]

#solution[
  三维晶体的配分函数为
  $
    Z = e^(-beta phi_0) product_i e^(-beta (hbar omega_i)/2)/(1 - e^(-beta hbar omega_i))
  $
  配分函数的对数为
  $
    ln Z = -beta U_0 - sum_(i=1)^(3N) ln(1 - e^(-beta hbar omega_i))
  $
  Debye频谱为
  $
    g(omega) = cases(
      (9 N)/(omega_D^3) omega^2\, & omega <= omega_D,
      0\, & omega > omega_D
    )
  $
  则连续形式为
  $
    ln Z = - beta U_0 - (9 N)/(omega_D^3) integral_0^(omega_D) omega^2 ln(1 - e^(-beta hbar omega)) d omega
  $
  引入变量
  $
    y = (hbar omega)/(k_B T), x = (hbar omega_D)/(k_B T) = Theta_D/T
  $
  $
    ln Z = - beta U_0 - (9 N)/x^3 integral_0^x y^2 ln(1 - e^(-y)) d y
  $
  - 高温即$x<<1$的情况下
    $
      e^(-y) approx 1 - y, ln(1 - e^(-y)) approx ln y
    $
    就有
    $
      ln Z approx - beta U_0 - 3 N ln x + N = - beta U_0 + 3 N ln (beta hbar omega_D) + N
    $
    内能为
    $
      U = - pdv(, beta) ln Z = U_0 + 3 N k_B T
    $
    熵为
    $
      S = k_B (ln Z + beta U) = 3 N k ln T/Theta_D + 4 N k_B
    $
  - 低温即$x>>1$的情况下
    $
      integral_0^oo y^2 ln(1 - e^(-y)) d y = - 1/3 integral_0^oo y^3/(e^y - 1) d y = - pi^4/45
    $
    则有
    $
      ln Z approx - beta U_0 + (N pi^4)/(5 x^3) = - beta U_0 + (N pi^4 k_B^3 T^3)/(5 hbar^3 omega_D^3)
    $
    内能为
    $
      U = - pdv(, beta) ln Z = U_0 + (3 N k_B pi^4 T^4)/(5 Theta_D^3)
    $
    熵为
    $
      S = k_B (ln Z + beta U) = (4 N k_B pi^4 T^3)/(5 Theta_D^3)
    $
]

#exercise(subname: [9.10])[
  固体中某种准粒子遵从Bose分布，具有以下的色散关系$ω = A k^2$. 试证明在低温范围，这种准粒子的激发所导致的热容量与$T^(3/2)$成比例（铁磁体中的自旋波具有这种性质）。
]

#solution[
  体积$V$内,波矢大小在$k$到$k+dd(k)$范围内准粒子的状态数为
  $
    V 1/(2 pi)^3 4 pi k^2 dd(k)
  $
  根据色散关系
  $
    k = sqrt(omega/A), dd(k) = 1/(2 sqrt(A omega)) d omega
  $
  则频率在$omega$到$omega + d omega$范围内的状态数为
  $
    B omega^(1/2) d omega, B = V/(4 pi^2 A^(3/2))
  $
  准粒子遵从Bose分布，则频率在$omega$到$omega + dd(omega)$范围内的激发态数为
  $
    n(omega) dd(omega) = B omega^(1/2)/(e^(beta hbar omega) - 1) dd(omega)
  $
  内能为
  $
    U(omega) dd(omega) = B (hbar omega^(3/2))/(e^(beta hbar omega) - 1) dd(omega)
  $
  则内能写为
  $
    U &= U_0 + integral_0^oo U(omega) dd(omega) = U_0 + B hbar integral_0^oo omega^(3/2)/(e^(beta hbar omega) - 1) dd(omega)\
    &= B ((k_B T)/hbar)^(5/2) integral_0^oo x^(3/2)/(e^x - 1) d x, x = beta hbar omega
  $
  由此可知
  $
    U prop T^(5/2) => C_V = pdv(, T) U prop T^(3/2)
  $
]
