//
//  Notification.swift
//  TaskList
//
//  Created by Anna Marie Mičková on 13.12.2023.
//

import Foundation
import UIKit
import UserNotifications


//class Notification{
//    
//    var title: String
//    var text: String
//    var hour: Int
//    var minute: Int
//    
//    init(title: String, text: String, hour: Int, minute: Int){
//        self.title = title
//        self.text = text
//        self.hour = hour
//        self.minute = minute
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//     func viewDidLoad(){
//        checkForPermission()
//    }
//   
//    
//    
//    
//    func checkForPermission(){
//        let notificationCenter = UNUserNotificationCenter.current()
//        notificationCenter.getNotificationSettings{ settings in
//            switch settings.authorizationStatus{
//            case .authorized:
//                self.dispatchNotifiaction()
//            case .denied:
//                return
//            case .notDetermined:
//                notificationCenter.requestAuthorization(options: [.alert, .sound]){ didAllow, error in
//                    if didAllow{
//                        self.dispatchNotifiaction()
//                    }
//                }
//            @unknown default:
//                return
//            }
//        }
//    }
//    
//    func dispatchNotifiaction(){
//
//        let notificationCenter = UNUserNotificationCenter.current()
//        let content = UNMutableNotificationContent()
//        
//        content.title = title
//        content.body = text
//        content.sound = .default
//        
//        let calendar = Calendar.current
//        var dateComponents = DateComponents(calendar: calendar, timeZone: .current)
//        dateComponents.hour = hour
//        dateComponents.minute = minute
//        
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
//       // let request =
//    }
//}
