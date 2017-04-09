
import UIKit
import EmojiLog

class ViewController: UIViewController, Loggable {
    
    override func loadView() {
        super.loadView()
        log.debug("loadView")
        log.info("loadView")
        log.warning("loadView")
        log.error("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        log.debug("viewDidLoad")
        log.info("viewDidLoad")
        log.warning("viewDidLoad")
        log.error("viewDidLoad")
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        log.debug("viewWillAppear")
        log.info("viewWillAppear")
        log.warning("viewWillAppear")
        log.error("viewWillAppear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        log.debug("viewDidAppear")
        log.info("viewDidAppear")
        log.warning("viewDidAppear")
        log.error("viewDidAppear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

