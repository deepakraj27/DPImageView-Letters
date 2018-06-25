# DPImageView-Letters

An easy, helpful UIImageView category that generates letter initials as a placeholder for user images, with a custom background color and double border with custom stroke width

Completely supports SWIFT 4 and SWIFT 3, written excusively for you.

Inspired by https://github.com/bachonk/UIImageView-Letters

1. Without Circular View and Border           |  2. With Circular View and Border
:-------------------------:|:-------------------------:
![](https://github.com/deepakraj27/DPImageView-Letters/blob/master/ScreenShots/nonCircular.png)  |  ![](https://github.com/deepakraj27/DPImageView-Letters/blob/master/ScreenShots/circular.png)

### Manual Installation

1. Drag and Drop the `DPImageView-letters.swift` file to your project. 
2. Thats it! Enjoy!

### Usage

Since `DPImageView-letters.swift` is created as extension to the `ImageView` you don't need to import this in each class seperately. Simply add it to your project after that it is done.

### Methods
Call this method to any `ImageView` inside the project. This method will find the initials of the provided text and it will select a random color as background color and it will provide you a way to make your image view as circular or not and it can also give a dual border to the imageview with text attributes changes

+ `func setImage(string: String?, color: UIColor? = nil, circular: Bool = false, stroke: Bool = false, textAttributes: [NSAttributedStringKey: Any]? = nil)`

`string` is the string used to generate the initials. This should be a user's full name if available.

`color` is an optional parameter that sets the background color of the image. Pass in `nil` to have a color automatically generated for you.

`circular` is a boolean parameter that will automatically clip the image to a circle if enabled.

`stroke` is a boolean parameter that will automatically draw a border to a circle if enabled. (it also provides you dual border)

`textAttributes` is an optional dictionary of predefined character attributes for text. You can find the list of available keys in NSAttributedString

If you want to keep the same color for a given name, you can use the following method from `UIColor` extension:
`static func colorHash(name: String?) -> UIColor`

You can get random color using the method `static var random: UIColor`.


##### Example

```
imageView.setImage(string:name, color: UIColor.colorHash(name: name), circular: false, stroke: false) // Check the first example screenshot for the output 

imageView.setImage(string:name, color: UIColor.colorHash(name: name), circular: true, stroke: false) // Check the second example screenshot for the output 
```

Good luck. Try adding more improvements to the code
