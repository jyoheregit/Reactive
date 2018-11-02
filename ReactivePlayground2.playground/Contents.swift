import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

class ViewController : UIViewController {
    
    lazy var uiSwitch : UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.frame = CGRect(x: 100, y: 10, width: 50, height: 50)
        return uiSwitch
    }()
    
    lazy var label : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 50, width: self.view.frame.size.width - 40, height: 20)
        return label
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.view.addSubview(uiSwitch)
        self.view.addSubview(label)
        bindUI()
    }
    
    func bindUI(){
        
        uiSwitch.rx.value
            .map({value in
                value ? "Switch On" : "Switch Off"
            })
            .bind(to: label.rx.text)
    }
}

let viewController = ViewController()
PlaygroundPage.current.liveView = viewController
