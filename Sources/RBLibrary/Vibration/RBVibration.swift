import UIKit
import AudioToolbox

public struct RBVibration {
  
  public static func vibrate() {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
  }
  
  public static func impact(_ style: Style) {
    
    switch style {
    case .light:
      let generator = UIImpactFeedbackGenerator(style: .light)
      generator.impactOccurred()
    case .medium:
      let generator = UIImpactFeedbackGenerator(style: .medium)
      generator.impactOccurred()
    case .heavy:
      let generator = UIImpactFeedbackGenerator(style: .heavy)
      generator.impactOccurred()
    case .success:
      let generator = UINotificationFeedbackGenerator()
      generator.notificationOccurred(UINotificationFeedbackGenerator.FeedbackType.success)
    case .warning:
      let generator = UINotificationFeedbackGenerator()
      generator.notificationOccurred(UINotificationFeedbackGenerator.FeedbackType.warning)
    case .error:
      let generator = UINotificationFeedbackGenerator()
      generator.notificationOccurred(UINotificationFeedbackGenerator.FeedbackType.error)
    }
  }
  
  public enum Style {
    case light
    case medium
    case heavy
    case error
    case success
    case warning
  }
  
  private init() {}
}
