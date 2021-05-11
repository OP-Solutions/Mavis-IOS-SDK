//
//  File.swift
//  
//
//  Created by Lasha Bukhnikashvili on 10.05.21.
//

import Foundation

class IosUnityBridge {
    private var eventHandler: MavisEventHandlerBase! = MavisEventHandlerBase()
    
    public func setEventHandler(_ customEventHandler: MavisEventHandlerBase!){
        eventHandler = customEventHandler
    }

    public func Init(){
        NotificationCenter.default.addObserver(self, selector: #selector(arSeesionStart(_:)), 
                            name: NSNotification.Name("ArSessionStart") , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(targetDetected(_:)), 
                            name: NSNotification.Name("TargetDetected") , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(arContentsShown(_:)), 
                            name: NSNotification.Name("ArContentsShown") , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(arContentClicked(_:)), 
                            name: NSNotification.Name("ArContentClicked") , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(errorOccured(_:)), 
                            name: NSNotification.Name("ErrorOccured") , object: nil)
    }

    @objc private func arSeesionStart(_ n: NSNotification){
        print(">>>>>>>>>>>>>>")
        print(n.userInfo?["data"] as Any)
    }
    @objc private func targetDetected(_ n: NSNotification){
        print(">>>>>>>>>>>>>>")
        print(n.userInfo?["data"] as Any)
    }
    @objc private func arContentsShown(_ n: NSNotification){
        print(">>>>>>>>>>>>>>")
        print(n.userInfo?["data"] as Any)
    }
    @objc private func arContentClicked(_ n: NSNotification){
        print(">>>>>>>>>>>>>>")
        print(n.userInfo?["data"] as Any)
    }
    @objc private func errorOccured(_ n: NSNotification){
        print(">>>>>>>>>>>>>>")
        print(n.userInfo?["data"] as Any)
    }
}
    
