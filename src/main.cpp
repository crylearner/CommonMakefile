//============================================================================
// Name        : main.cpp
// Author      : crylearner
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C, Ansi-style
//============================================================================

#include <stdio.h>
#include "hello/hello.h"

int main(void) {
	sayhello();
	printf("vendor %s\n",product_vendor().c_str());
	printf("version %s\n",product_version().c_str());
	return 0;
}
