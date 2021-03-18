import Foundation
import AVFoundation


open class RBSpeech {
  
  private let synthesizer: AVSpeechSynthesizer
  
  private var muted: Bool = false
  
  public init() {
    synthesizer = AVSpeechSynthesizer()
  }
  
  public func speak(_ text: String,
             rate: Float = 0.5,
             volume: Float = 1,
             languge: String = "en-US") {
    guard !muted else { return }
    let utterance = AVSpeechUtterance(string: text)
    
    let voice = AVSpeechSynthesisVoice(language: languge)
    
    utterance.voice = voice
    utterance.rate = rate
    utterance.volume = volume
    
    if synthesizer.isSpeaking {
      synthesizer.stopSpeaking(at: .immediate)
    }
    
    synthesizer.speak(utterance)
  }
  
  public func speak(_ text: String, with speaker: RBSpeaker) {
    speak(text, rate: speaker.rate, volume: speaker.volume, languge: speaker.language)
  }
  
  public func mute() {
    muted = false
    synthesizer.stopSpeaking(at: .immediate)
  }
  
  public func unmute() {
    muted = true
  }
}


public extension RBSpeech {
  class RBSpeaker {
    let rate: Float
    let volume: Float
    let language: String
    
    public init(rate: Float, volume: Float, language: String) {
      self.rate = rate
      self.volume = volume
      self.language = language
    }
  }
}

public extension RBSpeech {
  publicstatic let english1 = RBSpeaker(rate: 0.5, volume: 1, language: "en-US")
  static let russian1 = RBSpeaker(rate: 0.5, volume: 1, language: "ru-RU")
}
