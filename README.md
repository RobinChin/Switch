## Synopsis

A simple and easy use switch.

## Code Example

```Swift
class ViewController: UIViewController {

    let mySwitch = Switch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mySwitch)
        mySwitch.addTarget(self, action: #selector(switchHandle), for: .valueChanged)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let bounds = UIScreen.main.bounds
        let margin: CGFloat = 40.0
        let width = view.bounds.width - 2.0 * margin
        mySwitch.frame = CGRect(x: margin, y: margin + bounds.height / 2, width: width, height: 90.0)
    }
    
    func switchHandle() {
        print(mySwitch.isOn)
    }
}
```

## Motivation

I need a switch ,so I creat it and share to anyone who needs it.


## Installation

Just downlond the project and copy <b>Switch.swift</b> & <b>SwitchBasicLayer.swift</b> & <b>SwitchThumbLayer.swift</b> to your project.

## API Reference

property | description
---- | ---
isOn | get/set switch's current value.
switchTintColor |  switch's color.
highlightTintColor |  switch's "On" color
thumbTintColor | thumb's color
curvaceousness | switch's corner ratio


## License

MIT
