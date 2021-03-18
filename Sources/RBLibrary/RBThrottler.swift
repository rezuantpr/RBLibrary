import Foundation


public class RBThrottler {
  
  private var workItem: DispatchWorkItem = DispatchWorkItem(block: {})
  private var previousRun: Date = .distantPast
  private let queue: DispatchQueue
  private let minimumDelay: TimeInterval
  
  public init(minimumDelay: TimeInterval, queue: DispatchQueue = DispatchQueue.main) {
    self.minimumDelay = minimumDelay
    self.queue = queue
  }
  
  func throttle(_ block: @escaping () -> Void) {
    workItem.cancel()
    workItem = DispatchWorkItem() {
      [weak self] in
      self?.previousRun = Date()
      block()
    }
    
    let delay = previousRun.timeIntervalSinceNow > minimumDelay ? 0 : minimumDelay
    queue.asyncAfter(deadline: .now() + Double(delay), execute: workItem)
  }
}
