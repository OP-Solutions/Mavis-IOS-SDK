//
//  File.swift
//  
//
//  Created by Lasha Bukhnikashvili on 10.05.21.
//

import Foundation
import UnityFramework

class MavisUnityListener: UIResponder, UIApplicationDelegate, UnityFrameworkListener  {
    public func unityDidUnload(_ notification: Notification!) {
        Mavis.unloadUnity();
    }
}
