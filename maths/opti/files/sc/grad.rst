====================
Hessien et gradient
====================

Les fonctions que nous considérons dépendent, en général de plusieurs variables,
d'où la nécessité de définir le gradient (:math:`\nabla` nabla)
et le hessien (:math:`Hf(x)`) d'une fonction :math:`f`.

Gradient
	Soit :math:`x*` un minimum local, alors on le gradient de f est un
	vecteur des dérivées partielles.

	On peut le voir définit aussi comme :math:`\nabla f(x*) = 0` (condition de premier ordre?...)
	qui n'est pas une condition suffisante et qui personnellement me parait compliqué.

	On peut parler de dérivée directionnelle si on multiplie chaque terme par une direction.

.. math::

	\nabla f(x)= \begin{pmatrix}
  \frac{\partial f}{\partial x_{1}} \\
  \frac{\partial f}{\partial x_{2}} \\
  \vdots  \\
  \frac{\partial f}{\partial x_{n}}
	\end{pmatrix}

Hessien ou matrice hessienne
	Matrice des coefficient devant les variables.

.. math::

	Hf(x)= \begin{pmatrix}
	\frac{\partial f}{\partial x_{1}\partial x_{1}} & \cdots & \frac{\partial f}{\partial x_{1}\partial x_{n}} \\
	\frac{\partial f}{\partial x_{2}\partial x_{1}} & \cdots & \frac{\partial f}{\partial x_{2}\partial x_{n}} \\
	\vdots & \ddots & \vdots \\
	\frac{\partial f}{\partial x_{n}\partial x_{1}} & \cdots & \frac{\partial f}{\partial x_{n}\partial x_{n}}
	\end{pmatrix}

.. hint::

	Exemple: Soit :math:`f(x)=x_{1}^2 + 4x_{2}^2 - x_{1}x_{2} + 2x_{1} - 3x_{2}`

	Pour la première ligne du hessien, on dérive :math:`f` par rapport à :math:`x_{1}`.
	Et pour la seconde, par rapport à :math:`x_{2}`.

	On obtient alors :math:`\nabla f(x)= \begin{pmatrix} 2x_{1}- x_{2} + 2 \\ 8x_{2} - x_{1} - 3\end{pmatrix}`

	Pour le hessien, on obtient  :math:`Hf(x)= \begin{pmatrix} 2 & -1 \\ -1 & 8 \end{pmatrix}`

	Remarquez que la matrice est symétrique (Théorème de Schwarz:
	:math:`\frac{\partial f}{\partial x\partial y}=\frac{\partial f}{\partial y\partial x}`).
