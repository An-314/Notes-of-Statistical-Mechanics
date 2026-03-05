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
