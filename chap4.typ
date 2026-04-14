#import "@preview/scripst:1.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/fletcher:0.5.8": diagram, edge, node
#import "@preview/chemformula:0.1.2": ch

= Bose统计与Fermi统计

== 非简并条件与简并气

理想气体满足非简并条件
$
  e^alpha = 1/n ((2 pi m k_B T)/h^2)^(3/2) = 1/(n lambda_T^3) >> 1
$
其中
$
  lambda_T = h/sqrt(2 pi m k_B T)
$
是与$k_B T$对应的de Brogie波长
$
  k = (2pi)/lambda, p = hbar k, E = (hbar^2 k^2)/(2m) = (h/lambda)^2/(2m) tilde k_B T
$
粒子间距离为$(1/n)^(1/3)$，非简并条件等价于
$
  e^alpha = 1/(n lambda_T^3) >> 1
$
即
$
  (1/n)^(1/3) >> lambda_T = h/sqrt(2 pi m k_B T)
$
给出量子浓度(quantum concentration)
$
  n_Q = 1/lambda_T^3 = (2 pi m k_B T/h^2)^(3/2)
$
当原子之间的平均距离与热de Broglie波长相当时，气体便进入*简并态*。此时，*量子统计学*开始起作用。这时Bose统计和Fermi统计都被近似为半经典Boltzmann统计。

不满足非简并条件的气体称为*简并气*或*量子气*，当
$
  n lambda_T^3 < 1
$
时，非简并态，宏观量可对$n lambda_T^3$作展开
- 零次项：半经典
- 高次项：量子效应
而当
$
  n lambda_T^3 > 1
$
Bose气与Fermi气性质完全不同。

== Bose系统与Fermi系统的宏观量统计表达式
