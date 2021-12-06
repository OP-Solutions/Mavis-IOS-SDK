//
//  MavisEventHandlerBase.swift
//  Unity-iPhone
//
//  Created by Lasha Bukhnikashvili on 05.05.21.
//

import Foundation

open class MavisEventHandlerBase{
    public init() {
    }

    /**
     * Called When AR Session is started, i.e. camera view is shown to user
     * sessionInfo.sessionId - newly generated session Id for current AR session (format: uuid4, url-safe encoding)
     */
    open func ArSessionStart(sessionInfo : ArSessionStartInfo){
        print(sessionInfo)
    }

    /**
    * Called When AR Session is started, i.e. camera view is shown to user
    * arSessionEndInfo.sessionId - session Id for current AR session (format: uuid4, url-safe encoding)
    * arSessionEndInfo.duration - Ar session duration (in minutes)
    */
    open func ArSessionEnd(sessionInfo : ArSessionEndInfo){
        print(sessionInfo)
    }
   

    /**
     * Called When Target Image is detected
     * arTargetDetectedArgs.ImageName - name of the target image that is detected (defined via CMS at the time of uploading the file)
     * arTargetDetectedArgs.sessionId - Id of current AR session (format: uuid4, url-safe encoding)
     * arTargetDetectedArgs.timestamp - Target detection time sent in unix timestamp
     */
    open func TargetDetected(target : ArTargetDetectedArgs){
        print(target)
    }
    
    /**
     * Called When Target Image is lost
     * arTargetLostArgs.ImageName - name of the target image that is detected (defined via CMS at the time of uploading the file)
     * arTargetLostArgs.sessionId - Id of current AR session (format: uuid4, url-safe encoding)
     * arTargetLostArgs.duration - Shows how long target was detected (in minutes)
     */
    open func TargetLost(target : ArTargetLostArgs){
        print(target)
    }

    /**
     * Called after "TargetDetected" event, when AR content is show to the user
     * contentsInfo.name - target image name for which AR contents are shown
     * contentsInfo.sessionId - Id of current AR session (format: uuid4, url-safe encoding)
     * contentsInfo.shownArContents - list of AR contents diplayed. "ArContent" class see below
     */
    open func ArContentsShown(contentsInfo : ArContentsInfo){
        print(contentsInfo)
    }

    /**
     * Called when/if user clicks on the AR content
     * content.sessionId - Id of current AR session. (format: uuid4, url-safe encoding)
     * content.name - unique name of AR content, that was clicked
     * content.type - enum (Image - normal 2D image, Object - 3D object)
     */
    open func ArContentClicked(clickedContent : ArContent){
        print(clickedContent)
    }

    /**
     * General error handler, will be called if something goes wrong.
     * Recommended to override this function for error logging
     * error.errorMessage : string - error description
     * error.sessionId - Id of current AR session, can be null if AR session has not started yet
     */
    open func Error(error : MavisErrorInfo ){
        print(error)
    }
}
