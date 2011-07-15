#include "XMLParserPugi.h"
#include <sstream>
#include <constants.h>
#include <iostream>
#include <string>
#include <algorithm>
#include "Exceptions.h"

using namespace std;
using namespace pugi;

/** Convert string to upper case */
void Upper(string &str)
{
	transform(str.begin(), str.end(), str.begin(), ::toupper);
}


/** Constructor to load from a file
 *
 * Opens the specified filename and parses the xml. Then
 * all the required variables are then stored with the class 
 * for access with the get(...) methods */
Config::Config::Config(const string &filename)
{
	result = doc.load_file(filename.c_str());

	/* error handling */
	if (result)
	{
		std::cout << "XML [" << filename << "] parsed without errors" << endl;
	}
	else
	{
		stringstream ss;
		ss << "XML [" << filename << "] parsed with errors" << endl;
		ss << "Error description: " << result.description();

		throw XMLException(ss.str());
	}

	xml_node InfoNode = doc.child("info");
	PlanetNode = InfoNode.child("planet");
	StarNode = InfoNode.child("star");
	OrbitNode = InfoNode.child("orbit");
	SimulationNode = InfoNode.child("simulation");


    m_getAll();

}


Config::Config::~Config()
{
	coeffs.clear();
}


void Config::Config::m_getPlanetRadius()
{

	xml_node RadiusNode = PlanetNode.child("radius");
	planetRadius = RadiusNode.attribute("val").as_double();
	string units = RadiusNode.attribute("units").value();
	Upper(units);

    if (units == "RJUP")
        planetRadius *= rJup;

    if (units == "RSUN")
        planetRadius *= rSun;

    if (units == "AU")
        planetRadius *= AU;
}


void Config::Config::m_getStarRadius()
{
	xml_node RadiusNode = StarNode.child("radius");
	starRadius = RadiusNode.attribute("val").as_double();
	string units = RadiusNode.attribute("units").value();
	Upper(units);

    if (units == "RJUP")
        starRadius *= rJup;

    if (units == "RSUN")
        starRadius *= rSun;

    if (units == "AU")
        starRadius *= AU;

}


void Config::Config::m_getLDCoeffs()
{
    coeffs.clear();
    coeffs.resize(5);

	for (xml_node cur=PlanetNode.child("c"); cur; cur = cur.next_sibling("c"))
	{
		int idval = cur.attribute("id").as_int();
		double coeffVal = cur.attribute("val").as_double();
		coeffs[idval] = coeffVal;
	}	

	coeffs[0] = 1. - coeffs[1] - coeffs[2] - coeffs[3] - coeffs[4];


}


void Config::Config::m_getPeriod()
{
	xml_node PeriodNode = OrbitNode.child("period");
	period = PeriodNode.attribute("val").as_double();
	string units = PeriodNode.attribute("units").value();
	Upper(units);

    /* handle units conversion */
    if (units == "DAYS")
        this->period *= secondsInDay;

    if (units == "MINUTES")
        this->period *= secondsInMinute;

    if (units == "HOURS")
        this->period *= secondsInHour;

}


void Config::Config::m_getSemi()
{
	xml_node SemiNode = OrbitNode.child("semi");
	semi = SemiNode.attribute("val").as_double();
	string units = SemiNode.attribute("units").value();
	Upper(units);
    if (units == "RJUP")
        this->semi *= rJup;

    if (units == "RSUN")
        this->semi *= rSun;

    if (units == "AU")
        this->semi *= AU;
}


void Config::Config::m_getInclination()
{
	xml_node InclinationNode = OrbitNode.child("inclination");
	inclination = InclinationNode.attribute("val").as_double();
	string units = InclinationNode.attribute("units").value();
	Upper(units);


    if (units == "DEGREES")
        this->inclination *= radiansInDegree;
}


void Config::Config::m_getMaxTime()
{
	xml_node MaxtimeNode = SimulationNode.child("maxtime");
	maxtime = MaxtimeNode.attribute("val").as_double();
	string units = MaxtimeNode.attribute("units").value();
	Upper(units);

    /* handle units conversion */
    if (units == "DAYS")
        this->maxtime *= secondsInDay;

    if (units == "MINUTES")
        this->maxtime *= secondsInMinute;

    if (units == "HOURS")
        this->maxtime *= secondsInHour;

    if (units == "PERIODS")
    {
        this->maxtime *= this->period;
    }

}


void Config::Config::m_getDT()
{
	xml_node DTNode = SimulationNode.child("dt");
	dt = DTNode.attribute("val").as_double();
	string units = DTNode.attribute("units").value();
	Upper(units);

    /* handle units conversion */
    if (units == "DAYS")
        this->dt *= secondsInDay;

    if (units == "MINUTES")
        this->dt *= secondsInMinute;

    if (units == "HOURS")
        this->dt *= secondsInHour;
}


void Config::Config::m_getDR()
{
	xml_node DRNode = SimulationNode.child("dr");
	dr = DRNode.attribute("val").as_double();

}


void Config::Config::m_getMidpoint()
{
	xml_node MidpointNode = OrbitNode.child("midpoint");
	midpoint = MidpointNode.attribute("val").as_double();

}


void Config::Config::m_getNoise()
{
	xml_node NoiseNode = SimulationNode.child("noise");
	noise = NoiseNode.attribute("val").as_double();
	string units = NoiseNode.attribute("units").value();
	Upper(units);

	if (units == "MMAG")
		this->noise /= 1000.;

}

void Config::Config::m_getAll()
{
    m_getPlanetRadius();
    m_getStarRadius();
    m_getLDCoeffs();
    m_getPeriod();
    m_getSemi();
    m_getInclination();
    m_getDT();
    m_getDR();
    m_getMidpoint();
	m_getNoise();
    m_getMaxTime();                   // must come after m_getPeriod()
}
