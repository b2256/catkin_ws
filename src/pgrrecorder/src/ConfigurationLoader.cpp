//=============================================================================
// Copyright © 2013 Point Grey Research, Inc. All Rights Reserved.
// 
// This software is the confidential and proprietary information of Point
// Grey Research, Inc. ("Confidential Information").  You shall not
// disclose such Confidential Information and shall use it only in
// accordance with the terms of the license agreement you entered into
// with Point Grey Research, Inc. (PGR).
// 
// PGR MAKES NO REPRESENTATIONS OR WARRANTIES ABOUT THE SUITABILITY OF THE
// SOFTWARE, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
// PURPOSE, OR NON-INFRINGEMENT. PGR SHALL NOT BE LIABLE FOR ANY DAMAGES
// SUFFERED BY LICENSEE AS A RESULT OF USING, MODIFYING OR DISTRIBUTING
// THIS SOFTWARE OR ITS DERIVATIVES.
//=============================================================================
//=============================================================================
// $Id: ConfigurationLoader.cpp 324894 2017-05-12 22:07:08Z soowei $
//=============================================================================

#include "stdafx.h"
#include "ConfigurationLoader.h"
#include "LadybugRecorderConsoleConfiguration.h"
#include <boost/filesystem.hpp>

namespace
{
    std::shared_ptr<LRCConfig::Configuration> LoadFromFile(std::string fileToLoad)
    {
        // Open and read configuration
        LRCConfig::Configuration* rawConfig = LRCConfig::parseConfiguration(fileToLoad, xml_schema::Flags::dont_validate).release();
        return std::shared_ptr<LRCConfig::Configuration>(rawConfig);        
    }
}

ConfigurationProperties ConfigurationLoader::Parse( std::string fileToLoad )
{   
    // Check if file exists
    if (!boost::filesystem::exists(fileToLoad))
    {
        throw std::runtime_error("Configuration file LadybugRecorderConsole.xml not found in current directory.");
    }
    
    std::shared_ptr<LRCConfig::Configuration> pRawConfig;

    try
    {
        pRawConfig = LoadFromFile(fileToLoad);    
    }
    catch (const xml_schema::Exception& /*e*/)
    {
        throw std::runtime_error("Failed to parse configuration file LadybugRecorderConsole.xml.");
    }    

    // Transfer into output properties    
    ConfigurationProperties outputProps;

    // General

    // Camera
    outputProps.camera.dataFormat = dataFormat::fromString(pRawConfig->getCamera().getDataFormat());
    outputProps.camera.frameRate = pRawConfig->getCamera().getFrameRate();
    outputProps.camera.isFrameRateAuto = pRawConfig->getCamera().getIsFrameRateAuto();
    outputProps.camera.jpegQualityPercentage = pRawConfig->getCamera().getJpegQualityPercentage();

    // GPS
    outputProps.gps.useGps = pRawConfig->getGPS().getUseGps();
    outputProps.gps.port = pRawConfig->getGPS().getPort();
    outputProps.gps.deviceName = pRawConfig->getGPS().getDeviceName();
    outputProps.gps.baudRate = pRawConfig->getGPS().getBaudRate();
    outputProps.gps.refreshInterval = pRawConfig->getGPS().getRefreshIntervalMs();

    // Stream
    outputProps.stream.destinationDirectory = pRawConfig->getStream().getDestinationDirectory();
    
    return outputProps;
}
