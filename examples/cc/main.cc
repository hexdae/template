
#include <vector>
#include <iostream>
#include <numeric>

#include "examples/cc/lib.h"

int main(void) {
    std::vector<int> v;

    v.push_back(1);
    v.push_back(2);
    v.push_back(3);

    std::cout << "Hello World! C++ " << function() << std::endl;
    std::cout << "Sum: " << std::accumulate(v.begin(), v.end(), 0) << std::endl;

    return 0;
}
