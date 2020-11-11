.. _bric_derive:

================================
Dérivées
================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 11/11/2020}`

Dérivées
**************

La dérivée d'une fonction consiste à réécrire la fonction
avec avoir appliquer des calculs (dériver) pour observer les variations
qu'elle a après avoir changé son paramètre d'entré.

Elle est généralement notée f' (f prime) ou encode :math:`\frac{d}{dx}f`. Elle correspond
à un Développement limité d'ordre 0.

============================================ ============================================
Fonction                                     Dérivée
============================================ ============================================
a (constante)                                    0
x (variable)                                     1
:math:`x^n`                                  :math:`nx^{n-1}`
:math:`\frac{1}{x}`                          :math:`\frac{-1}{x^2}`
:math:`\frac{1}{x^n}`                        :math:`\frac{-n}{x^{n+1}}`
:math:`\sqrt{x}`                             :math:`\frac{1}{2\sqrt{x}}` ou :math:`(\sqrt{x})' = (x^{\frac{1}{2}})' = \frac{1}{2} x^{-\frac{1}{2}} = \frac{\sqrt{x}^-1}{2} =  \frac{1}{2\sqrt{x}}`
:math:`\ln{x}` (logarithme népérien)         :math:`\frac{1}{x}`
:math:`\log_a{x}` (logarithme)               :math:`\frac{1}{xln(a)}`
:math:`e^{x}` (exponentielle)                :math:`e^x`
:math:`a^{x}`                                :math:`a^x\ln{(a)}`
============================================ ============================================

============================================ ============================================
Fonction                                     Dérivée
============================================ ============================================
:math:`cos(x)`                               :math:`-sin(x)`
:math:`sin(x)`                               :math:`cos(x)`
:math:`tan(x)`                               :math:`1+tan^2(x)` ou :math:`\frac{1}{cos^2(x)}`
============================================ ============================================

============================================ ============================================
Fonction                                     Dérivée
============================================ ============================================
:math:`e^u`                                  :math:`u'e^u`
:math:`\ln{(u)}`                             :math:`\frac{u'}{u}`
:math:`a*u`                                  :math:`a*u'`
:math:`(u+v)'`                               :math:`u'+v'`
:math:`(u*v)'`                               :math:`u'v+uv'`
:math:`(\frac{u}{v})'`                       :math:`\frac{u'v-uv'}{v^2}`
:math:`(u^{a})'`                                 :math:`a*u'*u^{a-1}`
:math:`u(v(x))'`                             :math:`v'(x) u'(v(x))`
============================================ ============================================

|

-----

**Crédits**
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* dcode (dcode.fr)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune