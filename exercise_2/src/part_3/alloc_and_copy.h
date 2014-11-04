/*********************************************************************************
 * FILENAME         alloc_and_copy.h
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

#ifndef ALLOC_AND_COPY
#define ALLOC_AND_COPY

/*
* DESCRIPTION - Allocate a certain memory space on the graphic card
*               and copy it to the CPU's memory.
* PARAMETER   - integer: size of the memory you want to allocate and copy in bytes
*               boolean: if true -> pinned memory on host is used 
* RETURN      - double: time in seconds the copy process needed
*/
double allocAndCopyToHost( int, bool);

/*
* DESCRIPTION - Allocate a certain memory space on the cpu memory
*               and copy it to the graphic card's memory.
* PARAMETER   - integer: size of the memory you want to allocate and copy in bytes
*               boolean: if true -> pinned memory on host is used 
* RETURN      - double: time in seconds the copy process needed
*/
double allocAndCopyToDevice( int, bool);

#endif
