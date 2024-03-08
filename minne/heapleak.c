#include <stdlib.h>

int main(void) {
    while(1) {
        // Allokerer 1 MB av plass i heap for hvert iterasjon
        int *ptr = (int *) malloc(1024 * 1024);
    }
    return 0;
}