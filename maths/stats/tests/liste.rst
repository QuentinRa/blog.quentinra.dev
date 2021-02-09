================================
Liste de tests (synthèse)
================================

Une synthèse rapide des tests.

================================= ================================================================
Test généraux                     Description
================================= ================================================================
Test d'Anderson-Darling           H0: Normalité.
Test de Cramer-von Mises          H0: Normalité.
Test de Shapiro-Wilk              H0: Normalité. Conditions: peu de valeurs identiques.
Test du Khi deux                  H0: indépendance. Conditions: au moins 5 individus.
Test de Fisher                    H0: indépendance.
Test de Grubbs                    H0: valeurs aberrantes.
Test de Dixon                     H0: valeurs aberrantes.
================================= ================================================================

================================= ================================================================
Test sur la moyenne/variance      Description
================================= ================================================================
Student T à moyenne fixée         H0: moyennes égales. Conditions: (normalité ou ech > 30)
Student T a deux moyennes         H0: moyennes égales. Conditions: (normalité ou ech > 30)
Test Z à une moyenne              H0: moyennes égales. Conditions: (normalité ou ech > 30)
Test Z à deux moyennes            H0: moyennes égales. Conditions: (normalité ou ech > 30)
Test de la moyenne                H0: moyennes égales. Fait avec bootstrap.
Test (F) de Fisher                H0: variances égales. Conditions: normalité
Test de Levene                    H0: variances égales. Conditions: normalité
Test de Bartlett                  H0: variances égales. Conditions: (normalité, taille)
Anova à un critère                Conditions: (normalité, variances égales)
Anova à deux critères             Conditions: (normalité, variances égales)
Tests (des étendues) de Tukey     Indique si deux moyenne d'une Anova sont presque égales.
Test de simultanéité Dunnett      Indique si deux moyenne d'une Anova sont presque égales.
Test de Wilcoxon                  H0: médianes égales. Conditions: population symétrique.
Test de Mann–Whitney              H0: médianes égales. Conditions: ecdf non croisées, taille>30
Test de la médiane                H0: médianes égales. Fait avec bootstrap.
================================= ================================================================

================================= ================================================================
Test sur la vraisemblance         Description
================================= ================================================================
Test d’adéquation du Khi deux     H0: vraisemblance avec loi connue.
Test de Anderson-Darling          H0: vraisemblance avec loi connue.
Test sur une proportions          H0: test loi binomiale.
Test sur deux proportions         H0: test loi binomiale.
Goodness-of-Fit Test              H0: vraisemblance avec loi connue.
Test de distribution              H0: vraisemblance entre deux échantillons.
Test de Mann–Whitney U            H0: vraisemblance, deux échantillons de tailles différentes
================================= ================================================================

================================= ================================================================
Test sur les données appariées    Description
================================= ================================================================
Test de Mann–Whitney              H0: médianes égales.
Test de Student T à moyenne fixée H0: moyennes égales.
Test des signes                   H0: moyennes égales.
================================= ================================================================