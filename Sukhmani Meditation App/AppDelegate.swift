//
//  AppDelegate.swift
//  Sukhmani Meditation App
//
//  Created by MACBOOK on 23/11/21.
//

import UIKit
import Firebase
import GoogleSignIn
import SainiUtils

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let signInConfig = GIDConfiguration.init(clientID: GOOGLE.clientId.rawValue)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        autoLogin()
        return true
    }
    
    //MARK: - sharedDelegate
    func sharedDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //MARK: - autoLogin
    private func autoLogin() {
        if isUserLogin() {
            let vc = STORYBOARD.MAIN.instantiateViewController(withIdentifier: MAIN_STORYBOARD.MainVC.rawValue) as! MainVC
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {                UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
            }
        }
        else {
            log.todo("No logged in user found yet")/
        }
    }

}

//MARK:- Google Login
extension AppDelegate {
    //=================GOOGLE SIGNIN============
    func loginWithGoogle(vc: UIViewController)
    {
        GIDSignIn.sharedInstance.signOut()
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: vc) { user, error in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                // Perform any operations on signed in user here.
                print(user?.userID ?? "")                  // For client-side use only!
                print(user?.authentication.idToken ?? "") // Safe to send to the server
                print(user?.profile?.name ?? "")
                print(user?.profile?.givenName ?? "")
                print(user?.profile?.familyName ?? "")
                print(user?.profile?.email ?? "")
                print(user?.profile?.imageURL(withDimension: 500) ?? "")
                setIsUserLogin(isUserLogin: true)
                let mainVc = STORYBOARD.MAIN.instantiateViewController(withIdentifier: MAIN_STORYBOARD.MainVC.rawValue) as! MainVC
                if let visibleViewController = visibleViewController(){
                    visibleViewController.navigationController?.pushViewController(mainVc, animated: true)
                }
            }
        }
    }
}
