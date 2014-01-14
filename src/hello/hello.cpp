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

#if defined(ENABLE_SPEC) && ENABLE_SPEC==true
	printf("product spec:%s\n", "Spec is defined");
#else
	printf("product spec:%s\n", "Spec is not defined");
#endif

#if defined(DEBUG) || defined(__DEBUG__)
	printf("dubug version\n");
#else
	printf("release version\n");
#endif
}

std::string product_vendor()
{
	return PRODUCT_VENDOR;
}

std::string product_version()
{
	return PRODUCT_VERSION;
}
