=========================
Développement de taylor
=========================

Rappels
============

Si :math:`f` est défini sur un ouvert :math:`D`
de :math:`\mathbb{R}`, de classe :math:`\mathcal{C}^1`

Pour tout :math:`(x,x*) \in D`, le **développement de Taylor à l'ordre 1** donne

	* :math:`f(x)=f(x*)+f'(x*)(x-x*) + (x-x*)\epsilon(x-x*)`
	* avec :math:`\epsilon(h) \rightarrow 0` lorsque :math:`\|h\| \rightarrow 0`

De même, le **développement de Taylor à l'ordre 2** donne pour
:math:`f` cette fois de classe :math:`\mathcal{C}^2`. Pour tout :math:`(x,x*) \in D`,

	* :math:`f(x)=f(x*)+f'(x*)(x-x*) + \frac{1}{2} f''(x*) (x-x*)^2 + (x-x*)\epsilon(x-x*)`
	* avec :math:`\epsilon(h) \rightarrow 0` lorsque :math:`\|h\| \rightarrow 0`


A présent, étendons ces développements à :math:`\mathbb{R}^n`: pour tout :math:`(x,x*) \in D`,

	* **Développement de Taylor à l'ordre 1** :math:`f(x)=f(x*)+\nabla f(x*) \cdot (x-x*) + \|x-x*\|\epsilon(x-x*)`
	* **Développement de Taylor à l'ordre 2** :math:`f(x)=f(x*)+\nabla f(x*) \cdot (x-x*) + \frac{1}{2} (x-x*) \cdot Hf(x)(x-x*) + \|x-x*\|\epsilon(x-x*)`

Le développement de Taylor nous donne notamment le résultat suivant:
:math:`lim_{t\rightarrow 0}\frac{f(x+td)-f(x)}{t}=\nabla f(x) \cdot d`.