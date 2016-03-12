import UIKit
import Walker

public extension UIView {

  public func shake(landscape: Bool = true, duration: NSTimeInterval = 0.075) {
    let x: CGFloat = landscape ? 25 : 0
    let y: CGFloat = landscape ? 0 : 25

    animate(self, duration: duration) {
      $0.transform = CGAffineTransformMakeTranslation(-x, -y)
    }.chain(duration: duration) {
      $0.transform = CGAffineTransformMakeTranslation(x, y)
    }.chain(duration: duration) {
      $0.transform = CGAffineTransformMakeTranslation(-x / 2, -y / 2)
    }.chain(duration: duration) {
      $0.transform = CGAffineTransformIdentity
    }
  }

  // MARK: - Float

  public func levitate(duration: NSTimeInterval = 0.5) {
    animate(self, duration: duration, options: [.Reverse, .Repeat(Float.infinity)]) {
      $0.transform3D = CATransform3DMakeScale(0.97, 0.97, 0.97)
    }
  }

  // MARK: - Push

  public func pushDown(duration: NSTimeInterval = 0.2) {
    animate(self, duration: duration) {
      $0.transform = CGAffineTransformMakeScale(0.9, 0.9)
    }.chain(spring: 200, friction: 10, mass: 10) {
      $0.transform = CGAffineTransformIdentity
    }
  }

  public func pushUp(duration: NSTimeInterval = 0.2) {
    animate(self, duration: duration) {
      $0.transform = CGAffineTransformMakeScale(1.1, 1.1)
    }.chain(spring: 200, friction: 10, mass: 10) {
      $0.transform = CGAffineTransformIdentity
    }
  }

  public func peek() {
    spring(self, spring: 100, friction: 10, mass: 10) {
      $0.transform = CGAffineTransformIdentity
    }
  }

  // MARK: - Fade

  public func fade(appear: Bool = false, duration: NSTimeInterval = 0.4, remove: Bool = false) {
    animate(self, duration: duration) {
      $0.alpha = appear ? 1 : 0
    }.finally {
      if remove { self.removeFromSuperview() }
    }
  }
}
