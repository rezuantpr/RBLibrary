//
//  File.swift
//  
//
//  Created by Rezuan Bidzhiev on 18.03.2021.
//

import Foundation


public extension NotificationCenter {
  
  typealias NotificationCenterTargetClosure = ([AnyHashable: Any]?) -> ()
  
  private class ClosureWrapper: NSObject {
    let closure: NotificationCenterTargetClosure
    init(_ closure: @escaping NotificationCenterTargetClosure) {
      self.closure = closure
    }
  }
  
  private struct AssociatedKeys {
    static var targetClosure = "NotificationCenterTargetClosure"
  }
  
  private var targetClosure: NotificationCenterTargetClosure? {
    get {
      guard let closureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.targetClosure) as? ClosureWrapper else { return nil }
      return closureWrapper.closure
    }
    set(newValue) {
      guard let newValue = newValue else { return }
      objc_setAssociatedObject(self, &AssociatedKeys.targetClosure, ClosureWrapper(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
  
  func post(_ notificationName: String, userInfo: [AnyHashable: Any]?) {
    post(name: NSNotification.Name(rawValue: notificationName), object: nil, userInfo: userInfo)
  }
  
  func observe(observer: Any, notificationName: String, _ action: NotificationCenterTargetClosure) {
    addObserver(observer, selector: #selector(NotificationCenter.targetAction), name: NSNotification.Name(rawValue: notificationName), object: nil)
  }
  
  @objc func targetAction(_ notification: Notification) {
    guard let targetClosure = targetClosure else { return }
    targetClosure(notification.userInfo)
  }
}
