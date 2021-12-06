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
        NotificationCenter.default.addObserver(self, selector: #selector(arSessionStart(_:)),
                            name: NSNotification.Name("ArSessionStart") , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(arSessionEnd(_:)),
                            name: NSNotification.Name("ArSessionEnd") , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(targetDetected(_:)),
                            name: NSNotification.Name("TargetDetected") , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(targetLost(_:)),
                            name: NSNotification.Name("TargetLost") , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(arContentsShown(_:)),
                            name: NSNotification.Name("ArContentsShown") , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(arContentClicked(_:)),
                            name: NSNotification.Name("ArContentClicked") , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(errorOccured(_:)),
                            name: NSNotification.Name("ErrorOccured") , object: nil)
    }

    @objc private func arSessionStart(_ n: NSNotification){
        let json = (n.userInfo?["data"] ?? "") as! String
        let parsedData = try! JSONDecoder().decode(ArSessionStartInfo.self, from: json.data(using: .utf8)!)
        eventHandler.ArSessionStart(sessionInfo: parsedData)
    }
    @objc private func arSessionEnd(_ n: NSNotification){
        let json = (n.userInfo?["data"] ?? "") as! String
        let parsedData = try! JSONDecoder().decode(ArSessionEndInfo.self, from: json.data(using: .utf8)!)
        eventHandler.ArSessionEnd(sessionInfo: parsedData)
    }
    @objc private func targetDetected(_ n: NSNotification){
        let json = (n.userInfo?["data"] ?? "") as! String
        let parsedData = try! JSONDecoder().decode(ArTargetDetectedArgs.self, from: json.data(using: .utf8)!)
        eventHandler.TargetDetected(target: parsedData)
    }
    @objc private func targetLost(_ n: NSNotification){
        let json = (n.userInfo?["data"] ?? "") as! String
        let parsedData = try! JSONDecoder().decode(ArTargetLostArgs.self, from: json.data(using: .utf8)!)
        eventHandler.TargetLost(target: parsedData)
    }
    @objc private func arContentsShown(_ n: NSNotification){
        let json = (n.userInfo?["data"] ?? "") as! String
        let parsedData = try! JSONDecoder().decode(ArContentsInfo.self, from: json.data(using: .utf8)!)
        eventHandler.ArContentsShown(contentsInfo: parsedData)
    }
    @objc private func arContentClicked(_ n: NSNotification){
        let json = (n.userInfo?["data"] ?? "") as! String
        let parsedData = try! JSONDecoder().decode(ArContent.self, from: json.data(using: .utf8)!)
        eventHandler.ArContentClicked(clickedContent: parsedData)
    }
    @objc private func errorOccured(_ n: NSNotification){
        let json = (n.userInfo?["data"] ?? "") as! String
        let parsedData = try! JSONDecoder().decode(MavisErrorInfo.self, from: json.data(using: .utf8)!)
        eventHandler.Error(error: parsedData)
    }
}
    
