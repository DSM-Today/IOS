import Foundation

protocol ViewModel {

    associatedtype Input
    associatedtype Output

    func transform(_ input: Input) -> Output

}
