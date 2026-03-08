#import "@preview/scripst:1.1.1": *
#import "@preview/fletcher:0.5.8": diagram, edge, node

#show: scripst.with(
  title: [统计力学第2次作业],
  author: "Anzreww",
  time: "2026年3月",
)

#exercise(subname: [1.14])[
  试根据热力学第二定律证明两条绝热线不能相交。
]

#proof[
  如果两条绝热线相交，如下图所示
  #figure(
    include "pic/2.1.typ",
    caption: [两条绝热线相交的情况],
  )
  两条绝热线交于$C$点，其中$A C$与$B C$是绝热线。

  构造一个等温过程$A B$，而由于等温线的斜率小于绝热线的斜率，这样的等温线总是存在的。

  考虑$A -> B -> C$这样的一个循环过程。其中$A -> B$是等温过程，$B -> C$是绝热线过程，$C -> A$是绝热线过程。由于$A -> B$是等温过程，所以热量输入为$Q > 0$，而$B -> C -> A$是绝热线过程，所以没有热量输入，即热量输出为0。这样就构成了一个热机循环，输入热量为$Q$，输出功为$W = Q$，效率为1，这违反了热力学第二定律。因此，两条绝热线不能相交。

  因此，两条绝热线不能相交。
]


#exercise(subname: [1.19])[
  一均匀杆的温度一端为$T_1$，另一端为$T_2$，试计算达到均匀温度$(T_1+T_2)/2$后的熵增。
]

#solution[
  初态的温度
  $
    T(l) = T_2 + (T_1 - T_2) l/L
  $
  末态的温度为
  $
    T'(l) = (T_1 + T_2) / 2
  $
  从而熵增为
  $
    dv(Delta S, l) & = integral_(T(l))^(T'(l)) dd(S) = integral_(T(l))^(T'(l)) dd(Q) / T \
                   & = integral_(T(l))^(T'(l)) (c dd(T)) / T = c ln (T_1 + T_2) / (2 T(l)) \
                   & = c ln ((T_1 + T_2)/2) / (T_2 + (T_1 - T_2) l/L)
  $
  从而整个过程的熵增为
  $
    Delta S & = integral_0^L dv(Delta S, l) dd(l) = c integral_0^L ln ((T_1 + T_2)/2) / (T_2 + (T_1 - T_2) l/L) dd(l) \
            & = c L ln (T_1 + T_2)/2 - c integral_0^L ln (T_2 + (T_1 - T_2) l/L) dd(l) \
            & = c L ln (T_1 + T_2)/2 - c L integral_0^1 ln (T_2 + (T_1 - T_2) x) dd(x) \
            & = c L ln (T_1 + T_2)/2 - c L (T_1 ln T_1 - T_2 ln T_2) / (T_1 - T_2) + c L \
            & = C (ln (T_1 + T_2) / 2 + 1 - (T_1 ln T_1 - T_2 ln T_2) / (T_1 - T_2))
  $
  其中$C = c L$是杆的总热容。
]

#exercise(subname: [1.21])[
  物体的初温$T_1$高于热源的温度$T_2$，有一热机在此物体与热源之间工作，直到将物体的温度降低到$T_2$为止。若热机从物体吸取的热量为$Q$，试根据熵增原理证明，此热机所能输出的最大功为
  $
    W_max = Q - T_2 (S_1 - S_2)
  $
  其中$S_1 - S_2$是物体的熵减少量。
]

#solution[
  物体的熵增为
  $
    Delta S_"物体" = S_2 - S_1
  $
  热源的熵增加量为
  $
    Delta S_"热源" = Q' / T_2
  $
  其中$Q'$是热机向热源放出的热量。由于热机从物体吸取的热量为$Q$，根据能量守恒，热机向热源放出的热量为$Q' = Q - W$，其中$W$是热机输出的功。

  热机循环后回归初态，所以热机的熵变化为
  $
    Delta S_"热机" = 0
  $
  从而系统总熵的变化为
  $
    Delta S = Q' / T_2 - (S_1 - S_2) = (Q - W) / T_2 - (S_1 - S_2) >= 0
  $
  从而可以得到热机输出的最大功为
  $
    W <= Q - T_2 (S_1 - S_2)
  $
  等号成立时当系统是可逆的。
]

#exercise(subname: [2.2])[
  设一物质的物态方程具有以下的形式：
  $
    p = f(V) T
  $
  试证明其内能与体积无关。
]

#proof[
  内能的微分为
  $
    dd(U) & = T dd(S) - p dd(V) = T ((pdv(S, T))_V dd(T) + (pdv(S, V))_T dd(V)) - f(V) T dd(V) \
          & = T (pdv(S, T))_V dd(T) + (T (pdv(S, V))_T - f(V) T) dd(V)
  $
  根据Maxwell关系
  $
    dd(U) & = T C_V dd(T) + (T (pdv(p, T))_V - f(V) T) dd(V) = T C_V dd(T)
  $
  从而内能与体积无关。
]

#exercise(subname: [2.11])[
  求范氏气体的特性函数$F_m$，并导出其它的热力学函数。
]

#solution[
  Van de Waals气物态方程为
  $
    (p + a /V_m^2) (V_m - b) = R T
  $
  1mol气体的特性函数为
  $
    dd(F_m) & = - S_m dd(T) - p dd(V_m) \
            & = - S_m dd(T) - ((R T) / (V_m - b) - a / V_m^2) dd(V_m)
  $
  积分得Helmholtz自由能
  $
    F_m (T, V_m) & = - R T ln (V_m - b) - a / V_m + phi(T)
  $
  其中$phi(T)$是仅与温度有关的函数

  熵$S_m$为
  $
    S_m & = - (pdv(F_m, T))_(V_m) = R ln (V_m - b) - phi'(T)
  $
  内能$U_m$为
  $
    U_m & = F_m + T S_m = (- R T ln (V_m - b) - a / V_m + phi(T)) + T (R ln (V_m - b) - phi'(T)) \
        & = - a / V_m + phi(T) - T phi'(T)
  $
  焓$H_m$为
  $
    H_m & = U_m + p V_m = - a / V_m + phi(T) - T phi'(T) + ((R T) / (V_m - b) - a / V_m^2) V_m \
        & = (R T V_m) / (V_m - b) - (2 a) / V_m + phi(T) - T phi'(T)
  $
  Gibbs自由能$G_m$为
  $
    G_m & = H_m - T S_m = (R T V_m) / (V_m - b) - (2 a) / V_m + phi(T) - T phi'(T) - T (R ln (V_m - b) - phi'(T)) \
        & = (R T V_m) / (V_m - b) - (2 a) / V_m - R T ln (V_m - b) + phi(T)
  $
  下面我们用$C_(V,m)$表示$phi(T)$，考虑
  $
    C_(V,m) & = (pdv(U_m, T))_(V_m) = - T phi''(T)
  $
  从而
  $
    phi'(T) = - C_(V,m) ln T + C\
    phi(T) = - C_(V,m) T ln T + C T + D
  $
  其中$C$和$D$是常数。最终我们得到范氏气体的特性函数为
  $
    F_m & = - R T ln (V_m - b) - a / V_m - C_(V,m) T ln T + C T + D \
    S_m & = R ln (V_m - b) + C_(V,m) ln T + (c_(V,m) - C) \
    U_m & = - a / V_m + C_(V,m) T \
    H_m & = (R T V_m) / (V_m - b) - (2 a) / V_m + C_(V,m) T \
    G_m & = (R T V_m) / (V_m - b) - (2 a) / V_m - R T ln (V_m - b) - C_(V,m) T ln T + C T + D
  $
]

#exercise(subname: [2.13])[
  X射线衍射实验发现，橡皮带未被拉紧时具有无定形结构，当受张力而被拉伸时，具有晶型结构，这一事实表明橡皮带具有大的分子链。
  + 试讨论橡皮带在等温过程中被拉伸时它的熵是增加还是减少；
  + 试证明它的膨胀系数$alpha = 1/L (pdv(L, T))_sigma$是负的。
]

#solution[
  + 橡皮带经等温拉伸过程后由无定形结构转变为晶形结构，说明过程后其无序度减少，即熵减少了，所以有
    $
      (pdv(S, L))_T < 0
    $
  + 由橡皮带自由能的全微分
    $
      dd(F) = - S dd(T) + sigma dd(L)
    $
    根据Maxwell关系
    #figure(
      diagram(
        spacing: (0.5cm, 0.5cm),
        // nodes
        node((0, 0), $L$),
        node((2, 0), $T$),
        node((0, 2), $S$),
        node((2, 2), $sigma$),
        // cross arrows
        edge((0, 2), (2, 0)),
        edge((2, 2), (0, 0)),
      ),
    )
    可以得到
    $
      (pdv(S, L))_T = - (pdv(sigma, T))_L < 0
    $
    以及在温度不变时橡皮带随张力而伸长说明
    $
      (pdv(L, sigma))_T > 0
    $
    从而
    $
      (pdv(L, T))_sigma = - (pdv(sigma, T))_L (pdv(L, sigma))_T < 0
    $
    这说明橡皮带的膨胀系数$alpha$是负的。
]

#exercise(subname: [2.19])[
  已知顺磁物质遵从Curie定律
  $
    M = C/T H
  $
  若维持物质的温度不变，使磁场由$0$增至$H$，求磁化过程释放出的热量。
]

#solution[
  等温过程
  $
    dd(Q) = T dd(S) = T ((pdv(S, H))_T dd(H) + (pdv(S, T))_H dd(T)) = T (pdv(S, H))_T dd(H)
  $
  而由Maxwell关系
  #figure(
    diagram(
      spacing: (0.5cm, 0.5cm),
      // nodes
      node((0, 0), $M$),
      node((2, 0), $T$),
      node((0, 2), $S$),
      node((2, 2), $mu_0 H$),
      // cross arrows
      edge((0, 2), (2, 0)),
      edge((2, 2), (0, 0)),
    ),
  )
  $
    (pdv(S, H))_T = mu_0 (pdv(M, T))_H = - (mu_0 C) / T^2 H
  $
  从而有
  $
    dd(Q) = - (mu_0 C) / T H dd(H)
  $
  积分得
  $
    Q = integral_0^H dd(Q) = - (mu_0 C) / (2 T) H^2
  $
]

#exercise(subname: [2.21])[
  已知顺磁介质遵从Curie定律，今忽略其体积的变化，试分别用
  $
    dd(w)=mu_0 H dd(M)
  $
  和
  $
    dd(w)=-mu_0 M dd(H)
  $
  的微功表达式，求磁介质单位体积的自由能、内能和熵，并对结果加以解释。
]

#solution[
  + 先用$dd(w)=mu_0 H dd(M)$计算

    - 自由能$F$的微分为
      $
        dd(F) & = - S dd(T) + dd(w) \
              & = - S dd(T) + mu_0 H dd(M) = - S dd(T) + (mu_0 T)/C M dd(M)
      $
      积分得
      $
        F(T, M) = (mu_0 T) / (2 C) M^2 + F(T, 0)
      $
      第二项是磁化前磁介质的自由能，第一项是使得介质磁化强度从0增加到$M$外界对介质做的功
    - 熵$S$为
      $
        S & = - (pdv(F, T))_M = - (mu_0 M^2) / (2 C) - (pdv(F(T, 0), T))_M \
          & = - (mu_0 M^2) / (2 C) + S(T, 0)
      $
      第二项是磁化前磁介质的熵，第一项是使得介质磁化强度从0增加到$M$外界对介质做的功导致的熵的变化，为放热过程，所以熵减少了
    - 内能$U$为
      $
        U & = F + T S = (mu_0 T) / (2 C) M^2 + F(T, 0) + T (- (mu_0 M^2) / (2 C) + S(T, 0)) \
          & = F(T, 0) + T S(T, 0) = U(T, 0)
      $
      在等温磁化过程中磁介质放出的热量等于外界对磁介质所做的功，磁介质的内能不变
  + 再用$dd(w)=-mu_0 M dd(H)$计算

    - 自由能$F$的微分为
      $
        dd(F) & = - S dd(T) + dd(w) \
              & = - S dd(T) - mu_0 M dd(H) = - S dd(T) - (mu_0 C)/T H dd(H)
      $
      积分得
      $
        F(T, H) = - (mu_0 C) / (2 T) H^2 + F(T, 0)
      $
      第一项是等温磁化后磁介质自由能的增值$-mu_0 M H + (mu_0 C) / (2 T) H^2$，$-mu_0 M H$是磁介质在外磁场中的势能，$(mu_0 C) / (2 T) H^2 = (mu_0 T)/(2C) M^2$是使得介质磁化强度从0增加到$M$外界对介质做的功
    - 熵$S$为
      $
        S & = - (pdv(F, T))_H = - (pdv(F(T, 0), T))_H - (mu_0 C) / (2 T^2) H^2 \
          & = - (mu_0 C) / (2 T^2) H^2 + S(T, 0)
      $
      与前面计算的结果一致
    - 内能$U$为
      $
        U & = F + T S = - (mu_0 C) / (2 T) H^2 + F(T, 0) + T (- (mu_0 C) / (2 T^2) H^2 + S(T, 0)) \
          & = F(T, 0) + T S(T, 0) - (mu_0 C)/T H^2 = U(T, 0) - (mu_0 C)/T H^2
      $
      第二项是等温磁化后内能的增值$-mu_0 M H$
  - 综上
    - 采用$dd(w)=mu_0 H dd(M)$的微功表达式时，自由能和内能不包含介质在外磁场中的势能
    - 采用$dd(w)=-mu_0 M dd(H)$的微功表达式时，自由能和内能包含磁介质在外磁场中的势能
    - 由两种微功表达式得到的磁化热是相同的
]

#exercise(subname: [4.11])[
  试根据热力学第三定律证明，在$T → 0$时，表面张力系数与温度无关，即$dv(sigma, T) -> 0$，这一结论在液氦中得到实验的证实。
]

#proof[
  热力学方程为
  $
    dd(U) = T dd(S) + sigma dd(A)
  $
  从而
  $
    dv(sigma, T) & = (pdv(sigma, T))_A dv(T, T) + (pdv(sigma, A))_T dv(T, A) \
  $
  由于$T$和$A$是独立变量，所以$dv(T, T) = 1$，$dv(T, A) = 0$，从而
  $
    dv(sigma, T) = (pdv(sigma, T))_A
  $
  考虑Maxwell关系
  $
    (pdv(sigma, T))_A = (pdv(S, A))_T
  $
  热力学第三定律表明在$T -> 0$时，系统的熵趋于一个常数值，所以
  $
    lim_(T -> 0) (pdv(S, A))_T = 0
  $
  最后得到
  $
    lim_(T -> 0) dv(sigma, T) = 0
  $
]

#exercise(subname: [3.5])[
  求证：
  $
    (pdv(U, n))_(T,V) - mu = - T (pdv(mu, T))_(V,n)
  $
]

#proof[
  内能的微分为
  $
    dd(U) = T dd(S) - p dd(V) + mu dd(n)
  $
  从而
  $
    (pdv(U, n))_(T,V) = T (pdv(S, n))_(T,V) - p (pdv(V, n))_(T,V) + mu = T (pdv(S, n))_(T,V) + mu
  $
  考虑自由能的微分
  $
    dd(F) = - S dd(T) - p dd(V) + mu dd(n)
  $
  得到
  $
    (pdv(S, n))_(T,V) = -(pdv(F, T, n))_V = - (pdv(mu, T))_(V,n)
  $
  从而
  $
    (pdv(U, n))_(T,V) - mu = - T (pdv(mu, T))_(V,n)
  $
]

#exercise(subname: [4.2])[
  证明$mu_i (T,p,n_1,...,n_k)$是$n_1,...,n_k$的零次齐次函数
  $
    sum_j n_j (pdv(mu_i, n_j))_(T,p,n_(k != j)) = 0
  $
]

#proof[
  化学势$mu_i$是Gibbs自由能$G$对粒子数$n_i$的偏导数，即
  $
    mu_i = (pdv(G, n_i))_(T,p,n_(k != i))
  $
  而$G$是广延量
  $
    G(T, p, lambda n_1, ..., lambda n_k) = lambda G(T, p, n_1, ..., n_k)
  $
  对$lambda$求导
  $
    pdv(G(T, p, lambda n_1, ..., lambda n_k), lambda) = G(T, p, n_1, ..., n_k)
  $
  即
  $
    pdv(G(T, p, lambda n_1, ..., lambda n_k), lambda) &= sum_k (pdv(G(T, p, lambda n_1, ..., lambda n_k), lambda n_k))_(T,p,n_(j != k)) n_k\
    &= sum_k mu_k (T, p, lambda n_1, ..., lambda n_k) n_k = sum_k mu_k (T, p, n_1, ..., n_k) n_k
  $
  从而
  $
    mu_k (T, p, n_1, ..., n_k) = mu_k (T, p, lambda n_1, ..., lambda n_k)
  $
  这说明$mu_i$是$n_1,...,n_k$的零次齐次函数，由Euler定理
  $
    sum_j n_j (pdv(mu_i, n_j))_(T,p,n_(k != j)) = 0
  $
]

#exercise(subname: [4.11])[
  绝热容器中有隔离板隔开，两边分别装有$n_1$mol和$n_2$mol的理想气体，温度同为$T$， 压强分别为$p_1$和$p_2$，今将隔离板抽去，
  + 试求气体混合后的压强；
  + 如果两种气体是不同的，计算混合后的熵增；
  + 如果两种气体是相同的，计算混合后的熵增。
]


#solution[
  + 气体混合前
    $
      p_1 V_1 = n_1 R T, p_2 V_2 = n_2 R T
    $
    气体混合后
    $
      p (V_1 + V_2) = (n_1 + n_2) R T
    $
    得到
    $
      p = (n_1 + n_2) / (V_1 + V_2) R T
    $
  + 先计算混合前的熵
    $
      dd(S) = C_V/T dd(T) + (pdv(p, T))_V dd(V) = C_V/T dd(T) + (n R) / V dd(V)
    $
    而
    $
      p V = n R T => dd(p)/p = dd(T)/T - dd(V)/V
    $
    从而
    $
      dd(S) & = C_V/T dd(T) + (n R) (dd(T)/T - dd(p)/p) = (C_V + n R) / T dd(T) - (n R) / p dd(p) \
            & = C_p / T dd(T) - (n R) / p dd(p)
    $
    得到
    $
      S = n C_(p,m) ln T - n R ln p + n S_(m 0)
    $
    混合前的总熵为
    $
      S_1 = n_1 C_(1,p,m) ln T - n_1 R ln p_1 + n_1 S_(1,m 0) \
      S_2 = n_2 C_(2,p,m) ln T - n_2 R ln p_2 + n_2 S_(2,m 0) \
    $
    混合后为
    $
      S = & n_1 C_(1,p,m) ln T - n_1 R ln (n_1)/(n_1 + n_2) p + n_1 S_(1,m 0) + \
          & n_2 C_(2,p,m) ln T - n_2 R ln (n_2)/(n_1 + n_2) p + n_2 S_(2,m 0)
    $
    从而
    $
      Delta S & = - n_1 R ln ((n_1)/(n_1 + n_2) p/p_1) - n_2 R ln ((n_2)/(n_1 + n_2) p/p_2) \
              & = n_1 R ln (V_1 + V_2) / V_1 + n_2 R ln (V_1 + V_2) / V_2
    $
  + 如果两种气体是相同的，则混合前的总熵为
    $
      S_1 = n_1 C_(p,m) ln T - n_1 R ln p_1 + n_1 S_(m 0) \
      S_2 = n_2 C_(p,m) ln T - n_2 R ln p_2 + n_2 S_(m 0) \
    $
    混合后的总熵为
    $
      S = (n_1 + n_2) C_(p,m) ln T - (n_1 + n_2) R ln p + (n_1 + n_2) S_(m 0)
    $
    从而混合后的熵增为
    $
      Delta S & = (n_1 + n_2) R ln (V_1 + V_2) / (n_1 + n_2) - n_1 R ln V_1 / n_1 - n_2 R ln V_2 / n_2 \
              & = - n_1 R ln n_1 / (n_1 + n_2) - n_2 R ln n_2 / (n_1 + n_2)
    $


]
