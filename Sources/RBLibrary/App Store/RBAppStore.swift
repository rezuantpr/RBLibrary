import UIKit
import StoreKit

public struct RBAppStore {
  
  public static func link(appID: String) -> String {
    return "https://itunes.apple.com/app/id" + appID
  }
  
  public static func open(app id: String) {
    if let url = URL(string: "itms-apps://itunes.apple.com/app/id\(id)"),
       UIApplication.shared.canOpenURL(url) {
      if #available(iOS 10.0, *) {
        UIApplication.shared.open(url, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
      } else {
        UIApplication.shared.openURL(url)
      }
    }
  }
  
  public static func requestReview(appID: String, force: Bool) {
    if force {
      if let url = URL(string: "itms-apps://itunes.apple.com/us/app/apple-store/id\(appID)?mt=8&action=write-review"),
         UIApplication.shared.canOpenURL(url) {
        if #available(iOS 10.0, *) {
          UIApplication.shared.open(url, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
        } else {
          UIApplication.shared.openURL(url)
        }
      }
    } else {
      if #available(iOS 10.3, *) {
        SKStoreReviewController.requestReview()
      }
    }
  }
  
  static func requestReview() {
    if #available(iOS 10.3, *) {
      SKStoreReviewController.requestReview()
    }
  }
  
  static func isUpdateAvailable(completion: @escaping (Bool)->()) {
    
    guard let info = Bundle.main.infoDictionary,
          let currentVersion = info["CFBundleShortVersionString"] as? String,
          let identifier = info["CFBundleIdentifier"] as? String,
          let url = URL(string: "http://itunes.apple.com/lookup?bundleId=\(identifier)") else {
      completion(false)
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      do {
        if let error = error { throw error }
        guard let data = data else {
          completion(false)
          return
        }
        let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String: Any]
        guard let result = (json?["results"] as? [Any])?.first as? [String: Any], let version = result["version"] as? String else {
          completion(false)
          return
        }
        
        let compareResult = currentVersion.compare(version, options: .numeric)
        
        DispatchQueue.main.async {
          completion(compareResult == .orderedAscending)
        }
      } catch {
        completion(false)
      }
    }
    task.resume()
  }
  
  private init() {}
}

fileprivate extension NSRange {
  
  func range(for str: String) -> Range<String.Index>? {
    guard location != NSNotFound else { return nil }
    
    guard let fromUTFIndex = str.utf16.index(str.utf16.startIndex, offsetBy: location, limitedBy: str.utf16.endIndex) else { return nil }
    guard let toUTFIndex = str.utf16.index(fromUTFIndex, offsetBy: length, limitedBy: str.utf16.endIndex) else { return nil }
    guard let fromIndex = String.Index(fromUTFIndex, within: str) else { return nil }
    guard let toIndex = String.Index(toUTFIndex, within: str) else { return nil }
    
    return fromIndex ..< toIndex
  }
}

fileprivate extension String {
  
  func ranges(of string: String, options: CompareOptions = .literal) -> [Range<Index>] {
    var result: [Range<Index>] = []
    var start = startIndex
    while let range = range(of: string, options: options, range: start..<endIndex) {
      result.append(range)
      start = range.lowerBound < range.upperBound ? range.upperBound : index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
    }
    return result
  }
  
  func slices(from: String, to: String) -> [Substring] {
    let pattern = "(?<=" + from + ").*?(?=" + to + ")"
    
    return ranges(of: pattern, options: .regularExpression)
      .map{ self[$0] }
  }
}

fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
  return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
