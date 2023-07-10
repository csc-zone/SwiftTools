//
//  File.swift
//  
//
//  Created by baby on 2023/7/10.
//

import Foundation
import StoreKit

#if os(iOS)
public enum AppStoreReviewManager {
    private static let actionCountKey = "AppStoreReviewManager_actionCount"
    private static let lastReviewedAppVersionKey = "AppStoreReviewManager_lastReviewedAppVersion"
    private static let lastAppVersionCheckedKey = "AppStoreReviewManager_lastAppVersionChecked"

    public static func requestReview() {
        self.requestReview(minimumActionCount: 2, completion: nil)
    }

    public static func requestReview(minimumActionCount: Int, completion: ((_ success: Bool, _ version: String?) -> Void)?) {
        guard let currentAppVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else {
            completion?(false, nil)
            return
        }
        
        var savedActionCount = UserDefaults.standard.integer(forKey: "\(currentAppVersion)-0")
        savedActionCount += 1
        UserDefaults.standard.set(savedActionCount, forKey: "\(currentAppVersion)-0")

        if savedActionCount >= 2 && !UserDefaults.standard.bool(forKey: "\(currentAppVersion)-5") {
            UserDefaults.standard.set(true, forKey: "\(currentAppVersion)-5")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                mustRequestReview()
            }
        }
        completion?(true, currentAppVersion)
    }
    
    public static func mustRequestReview() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
}
#endif
