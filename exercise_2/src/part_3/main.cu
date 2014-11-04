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

#include <iostream> 
#include <fstream> // file output
#include <iomanip> // set precision
#include "alloc_and_copy.h"
using namespace std;

int main() {

    /*
    * Declare measurement variables
    * H2D = host to device
    */
    double *pH2D_pinned, *pH2D, *pD2H_pinned, *pD2H, *pPacketSizes;
    double startSize = 1000, endSize = 1000000;
    int N;

    pH2D_pinned =  new double[N];
    pH2D =         new double[N];
    pD2H_pinned =  new double[N];
    pD2H =         new double[N];
    pPacketSizes = new double[N];

    /* define the package sizes */
    for (int i=0; i<N; i++) {
        pPacketSizes[i] = ((double) i) * (endSize - startSize) / ((double) N) + startSize;
    }
    
    /* start measurements */
    for (int i=0; i<N; i++) {

    }

    ofstream f;
    f.open("plotdata.dat", ios::trunc); // open in replace mode
//    f << setprecision(10) 
    f.close();
    return 0;
}
