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
    let chatViewController: ChatViewController
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
        let mainViewModel = MainViewModel(
            fetchTodoListUseCase: suggestDependency.fetchTodoListUseCase
        )
        let chatViewModel = ChatViewModel()
        let myPageViewModel = MyPageViewModel()
        let newsViewModel = NewsViewModel()
        let lottoViewModel = LottoViewModel()

        let bookViewModel = BookViewModel(
            fetchBookUseCase: suggestDependency.fetchBookUseCase
        )
        let characterViewModel = CharacterViewModel()
        let flowerViewModel = FlowerViewModel(
            fetchFlowerUseCase: randomDependency.fetchFlowerUseCase
        )
        let fortuneViewModel = FortuneViewModel(
            fetchLuckyUseCase: randomDependency.fetchLuckyUseCase
        )
        let idiomViewModel = IdiomViewModel(
            fetchIdiomUseCase: randomDependency.fetchIdiomUseCase
        )
        let quizViewModel = QuizViewModel()

        let cafeMenuViewModel = CafeMenuViewModel()
        let foodViewModel = FoodViewModel()
        let movieViewModel = MovieViewModel(
            fetchMovieUseCase: suggestDependency.fetchMovieUseCase
        )
        let musicViewModel = MusicViewModel()
        let webtoonViewModel = WebtoonViewModel()

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

        let newsViewController = NewsViewController().then {
            $0.viewModel = newsViewModel
        }
        let lottoViewController = LottoViewController().then {
            $0.viewModel = lottoViewModel
        }

        let mainViewController = MainViewController().then {
            $0.viewModel = mainViewModel
        }

        let myPageViewController = MyPageViewController().then {
            $0.viewModel = myPageViewModel
        }
        let bookViewController = BookViewController().then {
            $0.viewModel = bookViewModel
        }
        let characterViewController = CharacterViewController().then {
            $0.viewModel = characterViewModel
        }
        let flowerViewController = FlowerViewController().then {
            $0.viewModel = flowerViewModel
        }
        let fortuneViewController = FortuneViewController().then {
            $0.viewModel = fortuneViewModel
        }
        let idiomViewController = IdiomViewController().then {
            $0.viewModel = idiomViewModel
        }
        let quizViewController = QuizViewController().then {
            $0.viewModel = quizViewModel
        }

        let cafeMenuViewController = CafeMenuViewController().then {
            $0.viewModel = cafeMenuViewModel
        }
        let foodViewController = FoodViewController().then {
            $0.viewModel = foodViewModel
        }
        let movieViewController = MovieViewController().then {
            $0.viewModel = movieViewModel
        }
        let musicViewController = MusicViewController().then {
            $0.viewModel = musicViewModel
        }
        let webtoonViewController = WebtoonViewController().then {
            $0.viewModel = webtoonViewModel
        }

        let chatViewController = ChatViewController().then {
            $0.viewModel = chatViewModel
        }

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
            userProfileViewController: userProfileViewController,
            chatViewController: chatViewController
        )
    }
}
