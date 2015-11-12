---
title: "TeX記法で数式が書けるようになりました"
category: release_note/2015/04/18
tags: 
created_at: 2015-04-18 16:51:28 +0900
updated_at: 2015-04-20 14:42:56 +0900
published: true
---

# 今回のリリース内容

```math
 e^{i \pi} = -1 
```

    ```math
     e^{i \pi} = -1 
    ```

のように、`math`コードブロックを作ることで、[MathJax](https://www.mathjax.org/)によって数式を描画することができるようになりました。`math`コードブロックでは、自動的に数式の前後に`$$`が挿入されます。

ちなみに、

    ```tex
    e^{i \pi} = -1 
    ```
とすると、TeX記法のハイライトになります。

```tex
e^{i \pi} = -1 
```

## サンプル

> [MathJaxの使い方](http://genkuroki.web.fc2.com/#inline)より

### inlineMath
$\sum_{n=1}^\infty \frac{1}{n^2} = \frac{\pi^2}{6}$

`$\sum_{n=1}^\infty \frac{1}{n^2} = \frac{\pi^2}{6}$`

### displayMath
```math
\sum_{n=1}^\infty \frac{1}{n^2} = \frac{\pi^2}{6}
\tag{3}
```

    ```math
    \sum_{n=1}^\infty \frac{1}{n^2} = \frac{\pi^2}{6}
    \tag{3}
    ```

### AMSmath
```math
\begin{align*}
 A & = B \\
   & = C \\
   & = D.
\end{align*}
```

    ```math
    \begin{align*}
     A & = B \\
       & = C \\
       & = D.
    \end{align*}
    ```

### AMSsymbols
$Q_1\boxtimes Q_2$, $\because$, $\dfrac12$, $\hslash$, $O(3)\ltimes{\mathbb R}$

`$Q_1\boxtimes Q_2$, $\because$, $\dfrac12$, $\hslash$, $O(3)\ltimes{\mathbb R}$`


### タイポ
```math
\sym_{n=1}^\infty \frac{1}{n^2} = \frac{\po^2}{6} 
```

    ```math
    \sym_{n=1}^\infty \frac{1}{n^2} = \frac{\po^2}{6} 
    ```

### マクロ

$$
  \newcommand\C{{\mathbb C}}
  \newcommand\np[2]{{#1}#2{#1}}
  \C[y_1,\ldots,y_n]\to {\mathcal A}, \quad a\mapsto\np{:}{a}
$$

    $$
      \newcommand\C{{\mathbb C}}
      \newcommand\np[2]{{#1}#2{#1}}
      \C[y_1,\ldots,y_n]\to {\mathcal A}, \quad a\mapsto\np{:}{a}
    $$

# 所感
お昼はサンドイッチを食べに行きました。
美味しかったのですが、厚みのあるサンドイッチは食べるのが難しいですね。

> [キングジョージ （KING GEORGE） - 代官山/カフェ [食べログ]](http://tabelog.com/tokyo/A1303/A130303/13164922/)

---
[ProTip] [Webhookでdocs.esa.ioの更新通知を受け取れるようになりました!](/posts/73) 

Enjoy "(\\( ⁰⊖⁰)/)"
https://esa.io
