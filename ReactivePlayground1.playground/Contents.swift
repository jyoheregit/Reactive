import RxSwift
import RxCocoa

var subject : BehaviorRelay<[String]> = BehaviorRelay(value: ["Joe"])

subject
    .throttle(0.5, scheduler: MainScheduler.instance)
    .debug()
    .filter { (values) -> Bool in
        return values.count > 1
    }
    .debug()
    .map{ (values) -> [String] in // Can transform to any type
        return values.map {return "Name :" + $0 }
    }
    .subscribe({
        print($0.element ?? $0)
    })

subject.accept(["Chris", "Tom"])
subject.accept(["Tom1", "Tom2"])




