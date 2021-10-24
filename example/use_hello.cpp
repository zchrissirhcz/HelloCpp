#include "hello/hello.hpp"
#include <iostream>

int main()
{
    std::cout << hello(nullptr) << std::endl;

    std::string str = hello("CMake");
    std::cout << str << std::endl;

    std::cout << hello("Modern C++") << std::endl;
    std::cout << hello("Test Driven Development") << std::endl;
    std::cout << hello("CI(Continuous Integration)") << std::endl;

    return 0;
}