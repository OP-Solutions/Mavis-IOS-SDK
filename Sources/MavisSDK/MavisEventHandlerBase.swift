//
//  MavisEventHandlerBase.swift
//  Unity-iPhone
//
//  Created by Lasha Bukhnikashvili on 05.05.21.
//

import Foundation

class MavisEventHandlerBase{

   /**
   * Called When AR Session is started, i.e. camera view is shown to user
   * sessionInfo.sessionId - newly generated session Id for current AR session (format: uuid4, url-safe encoding)
   */
   public override func ArSeesionStart(sessionInfo : ArSessionInfo){}

   /**
   * Called When Target Image is detected
   * target.name - name of the target image which is detected (defined from CMS side when uploading it).
   * target.sessionId - Id of current AR session (format: uuid4, url-safe encoding)
   */
   public override func TargetDetected(target : Target){}

   /**
   * Called after "TargetDetected" event, when AR content is show to the user
   * contentsInfo.name - target image name for which AR contents are shown
   * contentsInfo.sessionId - Id of current AR session (format: uuid4, url-safe encoding)
   * contentsInfo.shownArContents - list of AR contents diplayed. "ArContent" class see below
   */
   public override func ArContentsShown(contentsInfo : ArContentsInfo){}

   /**
   * Called when/if user clicks on the AR content
   * content.sessionId - Id of current AR session. (format: uuid4, url-safe encoding)
   * content.name - unique name of AR content, that was clicked
   * content.type - enum (Image - normal 2D image, Object - 3D object)
   */
   public override func ArContentClicked(clickedContent : ArContent){}

   /**
   * General error handler, will be called if something goes wrong. 
   * Recommended to override this function for error logging
   * error.errorMessage : string - error description
   * error.sessionId - Id of current AR session, can be null if AR session has not started yet
   */
   public override func Error(error : MavisErrorInfo ){}
}