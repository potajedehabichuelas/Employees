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

The architecture should be obvious but I would highlight the following details:
- The data model is handled by the ModelController
- The model controller is in charge of requesting data for such data model (whether this is via network or a disk operation)

- In the networking case the model controller should have a service dependency that's in charge of performing network operations related to such data model
- These network operations related to the same model / feature are grouped in routers

- Most entities have a protocol associated to avoid exposing the actual properties - methods - of the model/entity. Let each layer have visibility of what they need to see, but no more.

To be happier with the design I would have definitely added a Navigator to fully segregate responsabilities


## Personal Code
I've added a bunch of wrappers and extensions that I've developed overtime to make things simpler and cleaner:

- APIRouter & RequestService, to obtain generic simpler requests that also wrap the networking dependency used. 
(A service in charge of network operations would be created and injected in the viewModel to request data)

- UINotificationBanner wraps and customizes selected messages library (SwiftUI)
- Same with UIActivityHUD which probably needs updating since the underlying library (SVProgressHUD) seems to have some issues lately that hasn't been fixed (HUD does not seem to be centered anymore, and it required some modification to even run :/)
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
 - Maybe wrap KingFisher so in case we decide to use another library in the future it won't impact everyfile that needs a Kingfisher feature
 - Do some more testing, perhaps add more specific errors and double check I'm not missing anything, after all this is all I could do in 5 hours. I would probably add other libraries like SwiftLint.
