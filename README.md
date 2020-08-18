## Employees
A very basic app that pulls an employee list from the given endpoint.

## Motivation
This project was developed as a code asignment.

## Running info
Buid with Xcode Version 11.6 (11E708) 
iOS version 13.0 
UI Focused on iphone platform

## Focus Areas
Mostly the app  (MVVM) and network (Routers) architechture since there was only a screen to be built so the UI didn't take that long!


## Personal Code
I've added a bunch of wrappers and extensions that I've developed overtime to make things simpler and cleaner:

-APIRouter & RequestService, to obtain generic simpler requests that also wrap the networking dependency used. 
(A service in charge of network operations would be created and injected in the viewModel to request data)

- UINotificationBanner wraps and customizes selected messages library (SwiftUI)
- Same with UIActivityHUD which probably needs updating since the underlying library (SVProgressHUD) seems to have some issues lately that hasn't been fixed
- AppStoryboard & StoryboardIdentifiable avoids hardcoding names and simplifies & cleans up ViewController instantation
    ViewModelBased also allows VC instantiation with his viewModel dependency
example: 
```
        EmployeesTableViewController.instantiate(from: UIStoryboard(storyboard: .main), viewModel: employeesMC)
```

I think that should be all but in case I'm missing something, or something is a bit tangled, let me know!

## Third party Dependencies
Linked through Cocoapods, they're added to the repository so no extra work should be required to build the project.

For the assignment I've used:
- Networking  ->  'Alamofire', '5.0.0-beta.5' (I used this version simply because it was compatible with the networking code I ported and it needed some work to compile with the latest Alamofire version)

- UI Banner messages -> 'SwiftMessages'
- Loading hud ->  'SVProgressHUD'
- Image download & caching  ->  'Kingfisher'

I've also used webapps like quicktype that help you build models with their codable implementation based on their JSON representation, which helped to speed up things a bit.

## ToDo's
If I had more time to spend on this, I'd probably use it on:
 - Add a simple coordinator to manage navigation ( Currently the initial vc and its dependencies are loaded in the SceneDelegate file)
 - Add more test for the model controller
 - Do some more testing, perhaps add more specific errors and double check I'm not missing anything, after all this is all I could do in 5 hours. I would probably add other libraries like SwiftLint.
