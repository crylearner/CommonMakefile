/*
 * hello.cpp
 *
 *  Created on: 2013-12-20
 *      Author: lenovo
 */

#include "hello.h"
#include <stdio.h>

void sayhello() {
	printf("Hello World!\n");
	printf("product info: %s\n", PRODUCT_INFO);
#if ENABLE_TALKING==1
	printf("product feature:%s\n", "Talking is enabled");
#else
	printf("product feature:%s\n", "Talking is disabled");
#endif
}

