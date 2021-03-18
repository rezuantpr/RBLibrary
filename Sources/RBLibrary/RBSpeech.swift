import Foundation
import AVFoundation


public class RBSpeech {
  
  let synthesizer: AVSpeechSynthesizer
  
  private var muted: Bool = false
  
  init() {
    synthesizer = AVSpeechSynthesizer()
  }
  
  func speak(_ text: String,
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
  
  func speak(_ text: String, with speaker: RBSpeaker) {
    speak(text, rate: speaker.rate, volume: speaker.volume, languge: speaker.language)
  }
  
  func mute() {
    muted = false
    synthesizer.stopSpeaking(at: .immediate)
  }
  
  func unmute() {
    muted = true
  }
}


public extension RBSpeech {
  class RBSpeaker {
    let rate: Float
    let volume: Float
    let language: String
    
    init(rate: Float, volume: Float, language: String) {
      self.rate = rate
      self.volume = volume
      self.language = language
    }
  }
}

public extension RBSpeech {
  static let english1 = RBSpeaker(rate: 0.5, volume: 1, language: "en-US")
  static let russian1 = RBSpeaker(rate: 0.5, volume: 1, language: "ru-RU")
}
