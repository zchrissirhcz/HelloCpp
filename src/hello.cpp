#include "hello/hello.hpp"
#include <string.h>


std::string hello(const char* name)
{
    std::string res;
    if (name!=nullptr && name[0]!='\0')
    {
        res = "Hello, " + std::string(name);
    }
    else
    {
        res = "Hello, World!";
    }
    return res;
}

/// @brief split a string with (one or more) spaces.
/// @return the splited result
std::vector<std::string> split_string(const std::string& s)
{
    std::vector<std::string> ret;
    typedef std::string::size_type string_size;
    string_size i = 0;
    while (i!=s.size()) {
        // ignore prefix spaces
        while (i!=s.size() && isspace(s[i])) {
            i++;
        }

        // find next word's end position
        string_size j = i;
        while (j!=s.size() && !isspace(s[j])) {
            j++;
        }

        // if there are non-spaces found
        if (i!=j) {
            ret.push_back(s.substr(i, j-i));
            i = j;
        }
    }

    return ret;
}
