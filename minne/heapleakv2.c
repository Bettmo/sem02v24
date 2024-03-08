#include <stdlib.h>

int main(void) {
    
        int i;
        for (i = 0; i <= 10; i++) {
            // Allokerer 1 MB av plass i heap for hvert iterasjon
            int *ptr = (int *) malloc(1024 * 1024);
        }
        

    return 0;
}