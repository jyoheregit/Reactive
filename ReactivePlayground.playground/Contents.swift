import RxSwift
import RxCocoa

// Observable
var names = Observable.of("Joe", "Chris")

names.subscribe({ name in
    print(name.element ?? name)
})

print("-------------")

names.subscribe(onNext: { (name) in
    print(name)
}, onError: { (error) in
    print(error)
}, onCompleted: {
    print("completed")
}) {
    print("disposed")
}
print("-------------")

enum MyError : Error {
    case NotANumber(String)
}

var anotherObservable : Observable<Int> = Observable.create { (observer) -> Disposable in
    
    observer.onNext(1)
    observer.onError(MyError.NotANumber("Not a number"))
    observer.onNext(2)
    observer.onNext(3)
    observer.onCompleted()
    
    return Disposables.create()
}

anotherObservable.subscribe {
    print($0.element ?? $0)
}.dispose()

