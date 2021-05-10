import Foundation
import UnityFramework

public class Mavis: UIResponder, UIApplicationDelegate {

    public static let shared = Mavis()

    private let dataBundleId: String = "com.unity3d.framework"
    private let frameworkPath: String = "/Frameworks/UnityFramework.framework"

    private var ufw : UnityFramework?
    private var hostMainWindow : UIWindow?
    private var launchOptions: [UIApplication.LaunchOptionsKey: Any]?

    private var isInitialized: Bool {
        ufw?.appController() != nil
    }

    
    public func show() {
        if isInitialized {
            showWindow()
        } else {
            initWindow()
        }
    }

    public func setHostMainWindow(_ hostMainWindow: UIWindow?) {
        self.hostMainWindow = hostMainWindow
    }

    private func initWindow() {
//        if isInitialized {
//            showWindow()
//            return
//        }

        guard let ufw = loadUnityFramework() else {
            print("ERROR: Was not able to load Unity")
            return unloadWindow()
        }

        self.ufw = ufw
        ufw.setDataBundleId(dataBundleId)
        ufw.register(self)
        ufw.runEmbedded(
            withArgc: CommandLine.argc,
            argv: CommandLine.unsafeArgv,
            appLaunchOpts: launchOptions
        )
        UIApplication.shared.delegate = ufw.appController()
        showWindow()
    }

    private func showWindow() {
        if isInitialized {
            
            ufw?.showUnityWindow()
        }
    }

    private func unloadWindow() {
        if isInitialized {
            ufw?.unloadApplication()
        }
    }
    
    
    public func setLaunchOptions(_ options : [UIApplication.LaunchOptionsKey: Any]?){
        launchOptions = options;
    }
    
    private func loadUnityFramework() -> UnityFramework? {
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

extension Mavis: UnityFrameworkListener {

    public func unityDidUnload(_ notification: Notification!) {
        ufw?.unregisterFrameworkListener(self)
        ufw = nil
        hostMainWindow?.makeKeyAndVisible()
    }
}
