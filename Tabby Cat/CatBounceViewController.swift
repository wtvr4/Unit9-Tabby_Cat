import UIKit
import UserNotifications

class CatBounceViewController: UIViewController {

    @IBOutlet weak var catLabel: UILabel!
    let notificationTimeInterval = 30.0
    var animator: UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bounceCat()
    }

    func bounceCat() {
        let collisions = UICollisionBehavior(items: [catLabel])
        collisions.translatesReferenceBoundsIntoBoundary = true

        let dynamics = UIDynamicItemBehavior(items: [catLabel])
        dynamics.elasticity = 0.9
        dynamics.resistance = 0.05
        dynamics.friction = 0
        
        let push = UIPushBehavior(items: [catLabel], mode: .instantaneous)
        push.angle = CGFloat.random(in: 0 ..< .pi * 2)
        push.magnitude = CGFloat(3.0 + .random(in: 0 ..< 1))
        
        animator = UIDynamicAnimator(referenceView: view)
        animator.addBehavior(collisions)
        animator.addBehavior(dynamics)
        animator.addBehavior(push)
    }

    @IBAction func buttonPressed(_ sender: Any) {
         UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
             if success {
                 print("All set!")
             } else if let error = error {
                 print(error.localizedDescription)
             }
         }
         
         let content = UNMutableNotificationContent()
         content.title = "Bounce the cat"
         content.subtitle = "Boing boing meow"
         content.sound = UNNotificationSound.default

         let trigger = UNTimeIntervalNotificationTrigger(timeInterval: notificationTimeInterval, repeats: false)
         let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
         UNUserNotificationCenter.current().add(request)
     }
     
 }
