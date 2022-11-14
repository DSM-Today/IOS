import Foundation

import RxFlow

enum TodayStep: Step {
    // Onboarding
    case onboarindIsRequired

    // Category
    case categoryIsRequired

    // Main
    case mainIsRequired

    // Profile
    case editProfileIsRequired
    case myPageIsRequired

    // Information
    case newsIsRequired
    case lottoIsRequired

    // Random
    case bookIsRequired
    case characterIsRequired
    case flowerIsRequired
    case fortuneIsRequired
    case idiomIsRequired
    case quizIsRequired

    // Recommend
    case cafemenuIsRequired
    case foodIsRequired
    case movieIsRequired
    case musicIsRequired
    case webtoonIsRequired
}
