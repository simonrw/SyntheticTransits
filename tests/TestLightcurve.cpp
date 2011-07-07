#include <UnitTest++/UnitTest++.h>
#include "Lightcurve.h"

struct BasicFixture
{
    BasicFixture()
    {
        testlc = new Lightcurve(10);
    }

    ~BasicFixture()
    {
        delete testlc;
    }

    Lightcurve *testlc;
};

TEST_FIXTURE(BasicFixture, TestLightcurveConstructor)
{
    CHECK_EQUAL(testlc->size(), 10);
}

TEST_FIXTURE(BasicFixture, TestPeriodInitialisation)
{
    CHECK_EQUAL(testlc->period, 0);
}

TEST_FIXTURE(BasicFixture, TestEpochInitialisation)
{
    CHECK_EQUAL(testlc->epoch, 0);
}

TEST_FIXTURE(BasicFixture, TestHJDSizeInitialisation)
{
    CHECK_EQUAL(testlc->jd.size(), testlc->size());
}

TEST_FIXTURE(BasicFixture, TestFluxSizeInitialisation)
{
    CHECK_EQUAL(testlc->flux.size(), testlc->size());
}

TEST_FIXTURE(BasicFixture, TestFluxErrSizeInitialisation)
{
    CHECK_EQUAL(testlc->fluxerr.size(), testlc->size());
}

struct ClearFixture
{
    ClearFixture()
    {
        testlc = new Lightcurve(10);
        testlc->clear();
    }

    ~ClearFixture()
    {
        delete testlc;
    }

    Lightcurve *testlc;
};

TEST_FIXTURE(ClearFixture, TestClear)
{
    CHECK_EQUAL(testlc->size(), 0);
}



int main(int argc, const char *argv[])
{
    
    return UnitTest::RunAllTests();
}
