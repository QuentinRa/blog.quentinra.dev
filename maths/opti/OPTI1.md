# Optimisation mathématique

## Notion Général

## Extrema d'une fonction sans contraintes

### Dévelopement de Taylor

Rappel:

Si $$f$$ est défini sur un ouvert $$D$$ de $$\mathbb{R}$$, de classe $$\mathcal{C}^1$$
Pour tout $$(x,x*) \in D$$, le **développement de Taylor à l'ordre 1** donne
$$f(x)=f(x*)+f'(x*)(x-x*) + (x-x*)\epsilon(x-x*)$$
avec $$\epsilon(h) \rightarrow 0$$ lorsque $$\|h\| \rightarrow 0$$

De même, le **développement de Taylor à l'ordre 2** donne pour $$f$$ cette fois de classe $$\mathcal{C}^2$$
Pour tout $$(x,x*) \in D$$,
$$f(x)=f(x*)+f'(x*)(x-x*) + \frac{1}{2} f''(x*) (x-x*)^2 + (x-x*)\epsilon(x-x*)$$
avec $$\epsilon(h) \rightarrow 0$$ lorsque $$\|h\| \rightarrow 0$$

---

A présent, Etendons ces développements à $$\mathbb{R}^n$$:
Pour tout $$(x,x*) \in D$$,
**Développement de Taylor à l'ordre 1** $$f(x)=f(x*)+\nabla f(x*) \cdot (x-x*) + \|x-x*\|\epsilon(x-x*)$$
**Développement de Taylor à l'ordre 2** $$f(x)=f(x*)+\nabla f(x*) \cdot (x-x*) + \frac{1}{2} (x-x*) \cdot Hf(x)(x-x*) + \|x-x*\|\epsilon(x-x*)$$

Le développement de Taylor nous donne notamment le résultat suivant:
$$lim_{t\rightarrow 0}\frac{f(x+td)-f(x)}{t}=\nabla f(x) \cdot d$$

### Forme quadratique

Soit $$A$$ une matrice carrée d'ordre $$n$$, symétrique et $$Q_{A}(y)=y \cdot Ay$$ la forme quadratique associée.
$$A$$ est dite:
- **semi-définie positive** (resp. **négative**) ssi $$Q_{A}(y) \geq 0 $$ (resp. $$Q_{A}(y) \leq 0 $$) pour tout $$y \in \mathbb{R}^n$$
- **définie positive** (resp. **négative**) ssi $$Q_{A}(y) > 0 $$ (resp. $$Q_{A}(y) < 0 $$) pour tout $$y \in \mathbb{R}^n$$
- **indéfinie** ssi il $$y,z \in \mathbb{R}^n$$ tel que $$Q_{A}(y)>0 et Q_{A}(z)<0$$

(Dans ce cours, vous ne calculerez jamais ce terme. En fait, les résultats qui suivent vont vous permettre de caractériser le signe de $$A$$ plus facilement. Ce signe, lié à d'autres hypothèses, fournira plusieurs théorèmes utiles pour trouver un minimum dans le cas sans contraintes).

#### Signe d'une forme quadratique : les mineurs principaux
Si $$A= \begin{pmatrix}
  a_{11} & a_{12} & \cdots & a_{1n} \\
  a_{21} & a_{22} & \cdots & a_{2n} \\
  \vdots & \vdots & \ddots & \vdots \\
  a_{n1} & a_{n2} & \cdots & a_{nn}   
 \end{pmatrix}$$

Alors les mineurs principaux sont les $$\Delta_{i}=det(A_{i})$$
ie $$\Delta_{1}=a_{11}$$, $$\Delta_{2}=det A_{2}= \begin{pmatrix}
  a_{11} & a_{12} \\
  a_{21} & a_{22}    
 \end{pmatrix}$$ ... et $$\Delta_{n}=det(A)$$

---
- A est définie positive si et seulement si (ssi) pour tout $$k, \Delta_{k}>0$$
- A est définie négative ssi pour tout $$k, (-1)^k\Delta_{k}>0$$
- Si pour tout $$k < n$$, $$\Delta_{k}>0$$ ET $$\Delta_{n}=0$$, alors A est semi-définie positive
- Si pour tout $$k < n$$, $$(-1)^k\Delta_{k}>0$$ ET $$\Delta_{n}=0$$, alors A est semi-définie négative
- Si $$\Delta_{n} < 0$$ ET si $$n$$ est par, alors A est indéfinie


Screen de l'exemple

Cette technique est la plus utilisée (car dans les exercices, n=2 en général), mais en cas de problème, se rabattre à la seconde technique, qui est certes plus longue mais plus sûr.

#### Signe d'une forme quadratique : les valeurs propres
On inspecte le signe des valeurs propres
- Si toutes les valeurs propres sont >0 , $$A$$ est définie positive
- Mais si une des valeurs propres est nulle, $$A$$ est semi-définie positive
  
De même,
- Si toutes les valeurs propres sont <0 , $$A$$ est définie négative
- Mais si une des valeurs propres nulle, $$A$$ est semi-définie négative

Enfin
- Si une valeur propre est >0 et une valeur propre est <0 , A est indéfinie

Screen de l'exemple

## Condition d'optimalité

Définition:
- $$x*$$ minimum global si et seulement si pour tout $$x \in X f(x*) \geq f(x)$$
- $$x*$$ minimum local si et seulement il existe $$\epsilon > 0$$ tel que pour tout $$x \in X \cap B(x*,\epsilon) f(x*) \geq f(x)$$
Les minimums sont stricts si les inégalités sont strictes (<) dès que $$x \neq x*$$

$$x*$$ est dit un point critique si $$\nabla f(x*)=0$$

---

Soit $$x* \in \dot{X} \subset \mathbb{R}$$ (l'intérieur de X, cf topologie)
(Dans $$\mathbb{R}^n$$, ce sont les intervalles ouverts de $$\mathbb{R}^n$$)

Si $$x*$$ est un minimum local alors $$f'(x)=0$$

Généralisation à $$\mathbb{R}^n$$
Si $$x*$$ est un minimum local alors $$\nabla f(x)=0$$

Si $$x*$$ est un minimum local alors $$Hf(x*)$$ est semi-défini positif

---
**IMPORTANT**

Soit $$x* \in X$$
Si $$x*$$ est un point critique et $$Hf(x*)$$ est définie positive, alors $$x*$$ est un minimum local strict.

Soit $$x* \in X$$
Si $$x*$$ est un point critique et $$Hf(z)$$ est semi-définie positive pour tout $$z \in X$$, alors $$x*$$ est un minimum global.

---

(Notion peu utile)

Définition: $$x*$$ est un point selle de $$f$$ ssi $$x*$$ est un point critique et $$Hf(x*)$$ est indéfini.

Sous ces conditions:
- Il existe une direction $$d_{1}$$ de descente pour $$f$$ en partant de $$x*$$
- Il existe une direction $$d_{2}$$ de montée pour $$f$$ en partant de $$x*$$
D’où l’appellation de point selle

Image wikipedia