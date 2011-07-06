#pragma once

#ifndef XMLPARSERPUGI_H

#define XMLPARSERPUGI_H

#include <pugixml.hpp>
#include <vector>
#include <string>

using namespace std;


/** Config namespace to keep the configuration parser seperate
 *
 * Was originally introduced as there was another config file parser
 * in place but it depended on Qt so when this new class was created,
 * it was added to the Config namespace for separation */
namespace Config
{

	/** XML configuration file parser
	 *
	 *
	 * This file reads in the simulation configuration parameters
	 * in from the specified xml file and stores all the required
	 * variables in its own memory space for later access.
	 */
	class Config
	{
		vector<double> coeffs;
		int id;
		double planetRadius;
		double starRadius;
		double period;
		double semi;
		double inclination;
		double maxtime;
		double dt;
		double dr;
		double midpoint;
		double noise;

		/* xml specific variables */
		/** Document node */
		pugi::xml_document doc;

		/** Result of the xml parsing */
		pugi::xml_parse_result result;

		/** Planetary parameter node */
		pugi::xml_node PlanetNode;

		/** Stellar parameter node */
		pugi::xml_node StarNode;

		/** Orbital parameter node */
		pugi::xml_node OrbitNode;

		/** Simulation information node */
		pugi::xml_node SimulationNode;

		public:
		Config(const string &filename);
		virtual ~Config();

		protected:
		/* internal functions to get the values */
		void m_getPlanetRadius();
		void m_getStarRadius();
		void m_getLDCoeffs();
		void m_getPeriod();
		void m_getSemi();
		void m_getInclination();
		void m_getMaxTime();
		void m_getDT();
		void m_getDR();
		void m_getMidpoint();
		void m_getNoise();

		public:
		vector<double> &getCoeffs() { return this->coeffs; }
		int getId() { return this->id; }
		double getPlanetRadius() { return this->planetRadius; }
		double getStarRadius() { return this->starRadius; }
		double getPeriod() { return this->period; }
		double getSemi() { return this->semi; }
		double getInclination() { return this->inclination; }
		double getMaxTime() { return this->maxtime; }
		double getDT() { return this->dt; }
		double getDR() { return this->dr; }
		double getMidpoint() { return this->midpoint; }
		double getNoise() { return this->noise; }
	};

}


#endif /* end of include guard: XMLPARSERPUGI_H */
