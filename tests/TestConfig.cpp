#include "XMLParserPugi.h"
#include "exceptions.h"
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

TEST_FIXTURE(BasicFixture, TestLoadFromMemory)
{
    /*  test with a bad xml string */
    CHECK_THROW(config->LoadFromMemory("<test></test"), XMLException);
}


int main(int argc, const char *argv[])
{
    
    return UnitTest::RunAllTests();
}
