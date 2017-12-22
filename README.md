

<p align="center">
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/language-Swift4-orange.svg"></a>
<a href="https://developer.apple.com/ios"><img src="https://img.shields.io/badge/platform-iOS11-blue.svg?style=flat"></a>
<a href="https://https://github.com/lyimin/beautifulApp/blob/develop/LICENSE"><img src="http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat"></a>
    <a href="https://twitter.com/xcodedotswift">
  <img src="https://img.shields.io/badge/contact-@xcodedotswift-blue.svg?style=flat" alt="Twitter: @cbkarani" />
</a>
</p>

# Sukari
🍯 Powerful, Elegant Syntactical Sugar for Swift 🍯

## Path
Sukari is still under development. We are still defining many things around how Sukari works and how the API works. These decissions might result into breaking changes in the Sake APIs. Once the api's are stable we'll use [semantic versioning](https://semver.org/) ensuring that only major versions include breaking changes.

# Description

Enjoy Beutiful Syntactic Enhancements that will save you **Hundreds Or Thousands** of lines of Code

## Simply add Sukari to your initializers

-   `this()` is an extension on all NSObject subclasses

    ```swift
    let fileManager = FileManager().this {
       $0.urls(for: .applicationDirectory, in: .userDomainMask)
    }
    ```
    
#### Clean up your initialization Code
    
```swift
  let tableView : UITableView = {
      let table = UITableView()
      table.backgroundColor = .white
      table.register(UserCell.self, forCellReuseIdentifier: "CellID")
      table.separatorStyle = .none
      table.allowsSelection = false
      return table
  }()
```

#### Initialize in **this** way.

```swift
let tableView = UITableView().this {
    $0.backgroundColor = .white
    $0.register(UserCell.self, forCellReuseIdentifier: "CellID")
    $0.separatorStyle = .none
    $0.allowsSelection = false
}
```

#### Easily copy value Types


### Easy Customization

#### Use your own Types With a simple Extension

```swift
extension CustomType: Sukari {}

let instance = CustomType().this {
      $0.color = .blue
      $0.label.text = "Custom Type"
 }
```
### A Real World Example
```swift
class LoginViewController : UIViewController {
    var loginButton = UIButton().this {
        $0.setTitle("Login", for: .normal)
        $0.backgroundColor = . yellow
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 5
    }
    
     let emailTextField = UITextField().this {
        $0.placeholder = "Email"
        $0.borderStyle = .roundedRect
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.backgroundColor = UIColor(white: 0, alpha: 0.03)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginButton)
        view.addSubview(emailTextField)
    }
}

```

## Unwrap

Unwrap lets you easily require `Optional` values to be non-`nil`, or crash with ease.

Often Times you have to handle many optionals in your code Using `Guard` or `If let` in order to unwrap optional values in your code.
This Has Two Problems.
1. It Causes Code Congestion, making your code harder to read and maintain
2. After Unwrapping with `Guard` or `If let` you recieve absolutely No debuging information.

Unwrap Solves these problems by providing Syntactical Sugar to your code.
Quickly and easy unwrap your optionals with `.unwrap` and provide debug information such as which line and file the crash happened with `.unwrap(debug:)`

### Usage

Call `unwrap()` on any `Optional`, optionally giving a `debugMessage` for debugging purposes:

```swift
struct Person {
    let name: String
    let email: String
    init(dictionary: [String: Any]) {
        name = dictionary["name"].unwrap(debug: "Unable to find json Element Name") as! String
        email = dictionary["email"].unwrap(debug: "Unable to find json Element Email") as! String
    }
}
    let dictionary = ["ame": "Chris", "email": "chrisbkarani@gmail.com"]
    let chris = Person(dictionary: dictionary)
    print(chris.name) //Chris
    print(chris.email) // chrisbkarani@gmail.com

```
#### Descriptive Debug Messages

![screen shot 2017-12-19 at 17 35 03](https://user-images.githubusercontent.com/13857475/34170154-dbe22530-e4fa-11e7-89e8-a486eb68648b.png)

## Another Real-World Example
#### Without Using Unwrap
```swift
class LoginController: UIViewController {
    var token: Token?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // more code is more bugs
        guard let unwrappedToken = token else {
            // if this crashes we enter a 'nil' state in our app with no debug information
            return
        }
        LoginService.login(unwrappedToken)
    }
    
}
```
#### With Unwrap

```swift
class LoginController: UIViewController {
    var token: Token?
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginService.login(token.unwrap())
    }
}
```
#### Start Shreadding lines of code 
![screen shot 2017-12-20 at 12 57 13](https://user-images.githubusercontent.com/13857475/34201397-651f73ae-e585-11e7-8d61-f354a1be4e9b.png)

#### Clean, Succinct, and with more descriptive crashes!
![screen shot 2017-12-20 at 13 03 52](https://user-images.githubusercontent.com/13857475/34201662-4ef9c1aa-e586-11e7-8b1c-fd09908da352.png)

### Installing

- **For iOS 8+ projects** with [CocoaPods](https://cocoapods.org):
    ```ruby
    pod 'Sukari'
    ```
### Deployment

just `clone` the repo and run on Xcode


### Contributing

Please read [CONTRIBUTING.md](https://github.com/chrisbkarani/Sugar/blob/master/Contribution.md) for details on our code of conduct, and the process for submitting pull requests to us.


### Authors

#### Chris Karani

### License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/chrisbkarani/Sugar/blob/master/LICENSE) file for details

