import Foundation

import Service

struct AppDI {
    let onboardingViewController: OnboardingViewController
    let informationCategoryViewController: InformationCategoryViewController
    let randomCategoryViewController: RandomCategoryViewController
    let recommendCategoryViewController: RecommendCategoryViewController
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
        let suggestDependency = SuggestDependency.resolve()
        let randomDependency = RandomDependency.resolve()
        let informationDependency = InformationDependency.resolve()

        // MARK: ViewModel
        let onboardingViewModel = OnboardingViewModel(
            fetchClientIDUseCase: authDependency.fetchClientIDUseCase,
            googleLoginUseCase: authDependency.googleLoginUseCase
        )
        let userProfileViewModel = UserProfileViewModel(
            initProfileStepUseCase: userDependency.initProfileUseCase
        )
        let informationCategoryViewModel = InformationCategoryViewModel(
            fetchSubjectInformationListUseCase: informationDependency.fetchSubjectInformationListUseCase
        )
        let randomCategoryViewModel = RandomCategoryViewModel(
            fetchSubjectRandomListUseCase: randomDependency.fetchSubjectRandomListUseCase
        )
        let recommendCategoryViewModel = RecommendCategoryViewModel(
            fetchSubjectSuggestListUseCase: suggestDependency.fetchSubjectSuggestListUseCase
        )
        let mainViewModel = MainViewModel()

        // MARK: ViewController
        let onboardingViewController = OnboardingViewController().then {
            $0.viewModel = onboardingViewModel
        }

        let informationCategoryViewController = InformationCategoryViewController().then {
            $0.viewModel = informationCategoryViewModel
        }
        let randomCategoryViewController = RandomCategoryViewController().then {
            $0.viewModel = randomCategoryViewModel
        }
        let recommendCategoryViewController = RecommendCategoryViewController().then {
            $0.viewModel = recommendCategoryViewModel
        }

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
            informationCategoryViewController: informationCategoryViewController,
            randomCategoryViewController: randomCategoryViewController,
            recommendCategoryViewController: recommendCategoryViewController,
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
