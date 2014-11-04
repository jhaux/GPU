/*********************************************************************************
 * FILENAME         alloc_and_copy.cu
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
 #include <stdlib.h>
 #include "alloc_and_copy.h"

double allocAndCopyToHost(int sizeInBytes, bool pinned) {

    /* allocating memory on device and host for copying */
    void *dmem, *hmem;
    cudaMalloc(&dmem, sizeInBytes);

    if (pinned)
        cudaMallocHost(&hmem, sizeInBytes);
    else
        void *hmem = malloc(sizeInBytes);

    /* starting timer */
    double end;
    time_t = start = time(NULL);

    /* copy data */
    cudaMemcpy(hmem, dmem, sizeInBytes, cudaMemcpyDeviceToHost);

    end = time(NULL);
    cudaFree(dmem);
    free(hmem);

    return end - start;
}

double allocAndCopyToDevice( int sizeInBytes, bool pinned) {

    /* allocating memory on device and host for copying */
    void *dmem, *hmem;
    cudaMalloc(&dmem, sizeInBytes);

    if (pinned)
        cudaMallocHost(&hmem, sizeInBytes);
    else
        void *hmem = malloc(sizeInBytes);

    /* starting timer */
    double end;
    time_t = start = time(NULL);

    /* copy data */
    cudaMemcpy(dmem, hmem, sizeInBytes, cudaMemcpyHostToDevice);

    end = time(NULL);
    cudaFree(dmem);
    free(hmem);

    return end - start;
}
