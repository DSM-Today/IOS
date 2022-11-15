import Foundation

import Service

struct AppDI {
    let onboardingViewController: OnboardingViewController
    let categoryViewController: CategoryViewController
    let editProfileViewController: EditProfileViewController
    let newsViewController: NewsViewController
    let lottoViewController: LottoViewController
    let mainViewController: MainViewController
    let myPageViewController: MyPageViewController
    let bookViewController: BookViewController
    let characterViewController: CharacterViewController
    let flowerViewController: FlowerViewController
    let fortuneViewController: FortuneViewController
    let idiomViewController: IdiomViewController
    let quizViewController: QuizViewController
    let cafeMenuViewController: CafeMenuViewController
    let foodViewController: FoodViewController
    let movieViewController: MovieViewController
    let musicViewController: MusicViewController
    let webtoonViewController: WebtoonViewController
    let userProfileViewController: UserProfileViewController
}

extension AppDI {

    // swiftlint:disable function_body_length
    static func resolve() -> AppDI {
        // MARK: Dependency
        let authDependency = AuthDependency.resolve()
        let userDependency = UserDependency.resolve()

        // MARK: ViewModel
        let onboardingViewModel = OnboardingViewModel(
            fetchClientIDUseCase: authDependency.fetchClientIDUseCase,
            googleLoginUseCase: authDependency.googleLoginUseCase
        )
        let userProfileViewModel = UserProfileViewModel(
            initProfileStepUseCase: userDependency.initProfileUseCase
        )
        let mainViewModel = MainViewModel()

        // MARK: ViewController
        let onboardingViewController = OnboardingViewController().then {
            $0.viewModel = onboardingViewModel
        }

        let categoryViewController = CategoryViewController()
        let editProfileViewController = EditProfileViewController()
        let userProfileViewController = UserProfileViewController().then {
            $0.viewModel = userProfileViewModel
        }

        let newsViewController = NewsViewController()
        let lottoViewController = LottoViewController()

        let mainViewController = MainViewController().then {
            $0.viewModel = mainViewModel
        }

        let myPageViewController = MyPageViewController()
        let bookViewController = BookViewController()
        let characterViewController = CharacterViewController()
        let flowerViewController = FlowerViewController()
        let fortuneViewController = FortuneViewController()
        let idiomViewController = IdiomViewController()
        let quizViewController = QuizViewController()

        let cafeMenuViewController = CafeMenuViewController()
        let foodViewController = FoodViewController()
        let movieViewController = MovieViewController()
        let musicViewController = MusicViewController()
        let webtoonViewController = WebtoonViewController()

        return .init(
            onboardingViewController: onboardingViewController,
            categoryViewController: categoryViewController,
            editProfileViewController: editProfileViewController,
            newsViewController: newsViewController,
            lottoViewController: lottoViewController,
            mainViewController: mainViewController,
            myPageViewController: myPageViewController,
            bookViewController: bookViewController,
            characterViewController: characterViewController,
            flowerViewController: flowerViewController,
            fortuneViewController: fortuneViewController,
            idiomViewController: idiomViewController,
            quizViewController: quizViewController,
            cafeMenuViewController: cafeMenuViewController,
            foodViewController: foodViewController,
            movieViewController: movieViewController,
            musicViewController: musicViewController,
            webtoonViewController: webtoonViewController,
            userProfileViewController: userProfileViewController
        )
    }
}
