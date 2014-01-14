/*
 * HelloTest.cpp
 *
 *  Created on: 2014-1-12
 *      Author: lenovo
 */

#include "gtest/gtest.h"
#include <string>
#include "../src/hello/hello.h"

TEST(hello, product_vendor)
{
	ASSERT_TRUE(product_vendor() == std::string("Sample"));
}

TEST(hello, product_version)
{
	ASSERT_TRUE(product_version() == "1.0");
}


