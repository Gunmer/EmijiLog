
import UIKit
import EmojiLog

class ViewController: UIViewController {
    
    let log = Logger()

    override func loadView() {
        super.loadView()
        log.debug(message: "loadView")
        log.info(message: "loadView")
        log.warning(message: "loadView")
        log.error(message: "loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        log.debug(message: "viewDidLoad")
        log.info(message: "viewDidLoad")
        log.warning(message: "viewDidLoad")
        log.error(message: "viewDidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        log.debug(message: "viewWillAppear")
        log.info(message: "viewWillAppear")
        log.warning(message: "viewWillAppear")
        log.error(message: "viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        log.debug(message: "viewDidAppear")
        log.info(message: "viewDidAppear")
        log.warning(message: "viewDidAppear")
        log.error(message: "viewDidAppear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

