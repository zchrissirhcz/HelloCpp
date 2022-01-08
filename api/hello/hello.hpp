#pragma once

#include <string>
#include <vector>


// for windows dll exports
#if defined _MSC_VER || defined __CYGWIN__ || defined __MINGW32__
#    define HELLO_EXPORTS __declspec(dllexport)
#elif defined __GNUC__ && __GNUC__ >= 4
#    define HELLO_EXPORTS __attribute__ ((visibility ("default")))
#else
#    define HELLO_EXPORTS
#endif
#if defined HELLO_API_EXPORTS
#   define HELLO_API HELLO_EXPORTS
#else
#   define HELLO_API
#endif


HELLO_API std::string hello(const char* name);

HELLO_API std::vector<std::string> split_string(const std::string& s);

void cvtColor();
void what();