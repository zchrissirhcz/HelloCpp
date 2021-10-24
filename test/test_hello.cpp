#include "hello/hello.hpp"
#include <gtest/gtest.h>


TEST(hello, run)
{
    EXPECT_EQ(1, 1);
}

TEST(hello, nullptr)
{
    std::string res = hello(nullptr);
    std::string expected = "Hello, World!";
    EXPECT_EQ(expected, res);
}

TEST(hello, empty)
{
    std::string res = hello("");
    std::string expected = "Hello, World!";
    EXPECT_EQ(expected, res);
}

TEST(hello, common)
{
    std::string res = hello("ChrisZZ");
    std::string expected = "Hello, ChrisZZ";
    EXPECT_EQ(expected, res);
}

int main(int argc, char* argv[])
{
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

