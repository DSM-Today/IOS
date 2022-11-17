import Foundation

import RxFlow

enum TodayStep: Step {
    // Tabbar
    case tabsIsRequired
    // Onboarding
    case onboarindIsRequired

    // Category
    case categoryIsRequired

    // Main
    case mainIsRequired

    // Profile
    case editProfileIsRequired
    case myPageIsRequired
    case userProfileIsRequired

    // Information
    case informationCategoryIsRequired
    case newsIsRequired
    case lottoIsRequired

    // Random
    case randomCategoryIsRequired
    case bookIsRequired
    case characterIsRequired
    case flowerIsRequired
    case fortuneIsRequired
    case idiomIsRequired
    case quizIsRequired

    // Recommend
    case recommendCategoryIsRequired
    case cafemenuIsRequired
    case foodIsRequired
    case movieIsRequired
    case musicIsRequired
    case webtoonIsRequired

    // Chat
    case chatISRequired

    // none
    case none

    case moveToBackIsRequired
}
