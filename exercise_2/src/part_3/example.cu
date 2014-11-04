/*********************************************************************************
 * FILENAME         main.cu
 *
 * DESCRIPTION      These functions are part of the submission to exercises of 
 *                  the "GPU-Programming"
 *                  lecture of the University of Heidelberg.
 * 
 *                  Exercise 2 - Implementation of the functions used for
 *                  measureing PCIe data movements.
 *
 * AUTHORS          Christoph Klein
 *                  Marvin Kropp
 *                  Johannes Haux
 *
 * LAST CHANGE      3. Nov. 2014
 *
 ********************************************************************************/

#include <ctime>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <iostream>

__global__ void ongpu (double *dmem) {
//    **dmem = (double) 3.0;
    int x = 3;
    int y = 2;
    double z = 4.0;
    y = x + x + x;
    *dmem = 4.0;
}

int main() {

    time_t start = time(NULL);
    printf("%.5f\n", (double)(time(NULL) - start));
    double *dmem;
    double *hmem;
    double *hpinned;
    hmem = (double *) malloc(sizeof(double));
    cudaMallocHost(&hpinned, sizeof(double));
    *hpinned = 5;
    *hmem = 3;
    std::cout << "*hpinned = " << *hpinned << std::endl;
    std::cout << "*hmem = " << *hmem << std::endl;
    cudaMalloc( &dmem, sizeof(double));
    dim3 dimblock (1,1,1);
    ongpu <<< 1, dimblock >>> (dmem);

    cudaMemcpy(hmem,dmem,sizeof(double),cudaMemcpyDeviceToHost);
    cudaMemcpy(hpinned,dmem,sizeof(double),cudaMemcpyDeviceToHost);
    std::cout << "*hmem = " << *hmem << std::endl;
    std::cout << "*hpinned = " << *hpinned << std::endl;
    free(hmem);
    cudaFree(dmem);
//  *dmem = (double *) &x;

/*    std::cout << "dmem =" << dmem << std::endl;
    std::cout << "*dmem =" << *dmem << std::endl;
    std::cout << "**dmem =" << **dmem << std::endl;*/

    return 0;
}
