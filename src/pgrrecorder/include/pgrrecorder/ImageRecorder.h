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
// $Id: ImageRecorder.h 175015 2013-09-24 20:05:51Z soowei $
//=============================================================================
#ifndef ImageRecorder_h__
#define ImageRecorder_h__

#include "Configuration.h"

class ImageRecorder
{
public:
    ImageRecorder(const StreamConfiguration& streamConfig);
    ~ImageRecorder();

    LadybugError Init(LadybugContext cameraContext, unsigned int serialNumber);
    LadybugError Stop();

    LadybugError Write(const LadybugImage& image);
    LadybugError Write(const LadybugImage& image, double& mbWritten, unsigned long& imagesWritten);

private:
    LadybugStreamContext m_streamContext;    

    StreamConfiguration m_streamConfig;
};

#endif // ImageRecorder_h__
