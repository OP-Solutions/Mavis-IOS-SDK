import Foundation
#if !targetEnvironment(simulator) && arch(arm64)
import UnityFramework

public class Mavis: UIResponder, UIApplicationDelegate {

    private static let dataBundleId: String = "com.unity3d.framework"
    private static let frameworkPath: String = "/Frameworks/UnityFramework.framework"
    private static let unloadListener = MavisUnityListener()
    private static let bridge = IosUnityBridge()

    private static var mavisOptions: MavisOptions?
    private static var ufw : UnityFramework?
    private static var hostMainWindow : UIWindow?
    
    
    private static var isInitialized: Bool {
        ufw?.appController() != nil
    }

    	
    public static func Init(_ options : MavisOptions){
        mavisOptions = options;
        UserDefaults.standard.set(options.licenseKey, forKey: "__MavisLicenseKey__")
        bridge.Init()
    }
    
    public static func Launch(_ parentWindow: UIWindow?) {
        hostMainWindow = parentWindow
        if isInitialized {
            showWindow()
        } else {
            initWindow()
        }
    }

    public static func unloadUnity(){
        ufw?.unregisterFrameworkListener(unloadListener)
        ufw = nil
        hostMainWindow?.makeKeyAndVisible()
    }
    
    public static func setEventHandler(_ customEventHandler: MavisEventHandlerBase!){
        bridge.setEventHandler(customEventHandler)
    }

    private static func initWindow() {
        if isInitialized {
            showWindow()
            return
        }

        guard let ufw = loadUnityFramework() else {
            print("ERROR: Was not able to load Unity")
            return unloadWindow()
        }

        self.ufw = ufw
        ufw.setDataBundleId(dataBundleId)
        ufw.register(unloadListener)

        ufw.runEmbedded(
            withArgc: CommandLine.argc,
            argv: CommandLine.unsafeArgv,
            appLaunchOpts: nil
        )
    }

    private static func showWindow() {
        if isInitialized {
            ufw?.showUnityWindow()
        }
    }

    private static func unloadWindow() {
        if isInitialized {
            ufw?.unloadApplication()
        }
    }
    
    
    private static func loadUnityFramework() -> UnityFramework? {
        let bundlePath: String = Bundle.main.bundlePath + frameworkPath

        let bundle = Bundle(path: bundlePath)
        if bundle?.isLoaded == false {
            bundle?.load()
        }

        let ufw = bundle?.principalClass?.getInstance()
        if ufw?.appController() == nil {
            let machineHeader = UnsafeMutablePointer<MachHeader>.allocate(capacity: 1)
            machineHeader.pointee = _mh_execute_header

            ufw?.setExecuteHeader(machineHeader)
        }
        return ufw
    }
    

}


#else
import UIKit
public class Mavis{
    public static func Init(_ options : MavisOptions){
    }
    public static func Launch(_ parentWindow: UIWindow?) {
    }
    public static func setEventHandler(_ customEventHandler: MavisEventHandlerBase!){
    }
    public static func unloadUnity(){
    }
}
#endif
