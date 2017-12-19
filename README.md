<p align="center">
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/language-Swift4-orange.svg"></a>
<a href="https://developer.apple.com/ios"><img src="https://img.shields.io/badge/platform-iOS11-blue.svg?style=flat"></a>
<a href="https://https://github.com/lyimin/beautifulApp/blob/develop/LICENSE"><img src="http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat"></a>
</p>

# Sugar
🌋 Powerful, Elegant Syntactical Sugar for Swift 🌋

# Description

Enjoy Beutiful Syntactic Enhancements that will save you **Hundreds Or Thousands** of lines of Code

## Simply add Sugar to your initializers

-   `this()` is an extension on all NSObject subclasses

    ```swift
    let fileManager = FileManager().this {
       $0.urls(for: .applicationDirectory, in: .userDomainMask)
    }
    ```
    
    Clean up your initialization Code
    
```swift
let tableView = UITableView().this {
    $0.backgroundColor = .white
    $0.register(UserCell.self, forCellReuseIdentifier: "CellID")
    $0.separatorStyle = .none
    $0.allowsSelection = false
}
```

Initialize in **this** way.

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

### Easy Customization

- Use your own Types With a simple Extension

    ```swift
    extension CustomType: This {}
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginButton)
    }
}

```

Unwrap lets you easily require `Optional` values to be non-`nil`, or crash with ease.

Often Times you have to handle many optionals in your code Using `Guard` or `If let` in order to unwrap optional values in your code.
This Has Two Problems.
1. It Causes Code Congestion, making your code harder to read and maintain
2. After Unwrapping with `Guard` or `If let` you recieve absolutely No debuging information.

Unwrap Solves these problems by providing Syntactical Sugar to your code.
Quickly and easy unwrap your optionals with `.unwrap` and provide debug information such as which line and file the crash happened with `.unwrap(debug:)`

## Usage

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
}
```

### Installing

- **For iOS 8+ projects** with [CocoaPods](https://cocoapods.org):

    ```ruby
    pod 'This'


## Deployment

just `clone` the repo and run on Xcode


## Contributing

Please read [CONTRIBUTING.md](https://github.com/chrisbkarani/This/blob/master/Contribution.md) for details on our code of conduct, and the process for submitting pull requests to us.


## Authors

* **Chris Karani** - 

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/chrisbkarani/This/blob/master/LICENSE) file for details
