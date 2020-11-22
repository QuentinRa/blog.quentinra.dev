================================================================
9. Autres notions - Tris en C
================================================================

Tri du Nain de jardin

.. code:: c

		void gnome_sort(double *tab,int capacite){
		 int nain=0 ;
		 while(nain < capacite){
		  if(nain==0 || tab[nain]>=tab[nain-1]){
			 nain++ ;
			} else {
			 double tmp = tab[nain] ;
			 tab[nain]=tab[nain-1] ;
			 tab[nain-1]=tmp ;
			 nain-- ;
			}
		 }
		}

Tri à bulles

.. code:: c

		void bulles_sort(int *tab,int capacite){
		 int bulle=0,range=0 ;
		 while(range < taille){
			if(tab[bulle]>=tab[bulle+1]){
			 int tmp = tab[bulle] ;
			 tab[bulle]=tab[bulle+1] ;
			 tab[bulle+1]=tmp ;
			 bulle++ ;
			} else {
			 bulle++ ;
			 if(bulle == capacite){
				bulle=0 ;
				range++ ;
			 }
			}
		 }
		}