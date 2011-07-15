#include "XMLParserPugi.h"
#include <UnitTest++/UnitTest++.h>


struct BasicFixture
{
    BasicFixture()
    {
    }

    ~BasicFixture()
    {
    }

    Config::Config *config;
};

int main(int argc, const char *argv[])
{
    
    return UnitTest::RunAllTests();
}
