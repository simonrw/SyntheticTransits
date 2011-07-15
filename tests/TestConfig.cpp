#include "XMLParserPugi.h"
#include <UnitTest++/UnitTest++.h>


struct BasicFixture
{
    BasicFixture()
    {
        config = new Config::Config;
    }

    ~BasicFixture()
    {
        delete config;
    }

    Config::Config *config;
};

TEST_FIXTURE(BasicFixture, TestConfigConstructor)
{

}


int main(int argc, const char *argv[])
{
    
    return UnitTest::RunAllTests();
}
