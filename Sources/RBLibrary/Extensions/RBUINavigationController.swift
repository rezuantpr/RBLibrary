import UIKit

extension UINavigationController {
  
  public func setNavigationBar(backgroundColor: UIColor,
                               tintColor: UIColor,
                               titleTextColor: UIColor,
                               titleTextFont: UIFont,
                               largeTitleTextColor: UIColor,
                               largeTitleTextFont: UIFont) {
    if #available(iOS 13.0, *) {
      let navBarAppearance = UINavigationBarAppearance()
      navBarAppearance.configureWithOpaqueBackground()
      navBarAppearance.titleTextAttributes = [.foregroundColor: titleTextColor,
                                              .font: titleTextFont]
      navBarAppearance.largeTitleTextAttributes = [.foregroundColor: largeTitleTextColor,
                                                   .font: largeTitleTextFont]
      
      navBarAppearance.backgroundColor = backgroundColor
      navBarAppearance.shadowColor = .clear
      
      navigationBar.barStyle = .blackOpaque
      navigationBar.tintColor = tintColor
      navigationBar.isTranslucent = true
      navigationBar.standardAppearance = navBarAppearance
      navigationBar.scrollEdgeAppearance = navBarAppearance
      navigationBar.compactAppearance = navBarAppearance
    } else {
      navigationBar.setBackgroundImage(UIImage(), for: .default)
      navigationBar.shadowImage = UIImage()
      navigationBar.barTintColor = backgroundColor
      navigationBar.tintColor = tintColor
      navigationBar.isTranslucent = true
      navigationBar.barStyle = .default
      
      navigationBar.titleTextAttributes = [.foregroundColor: titleTextColor,
                                           .font: titleTextFont]
      navigationBar.largeTitleTextAttributes = [.foregroundColor: largeTitleTextColor,
                                                .font: largeTitleTextFont]
    }
  }
}
