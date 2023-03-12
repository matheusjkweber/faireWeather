# Faire Weather APP
<p align="center">
  <p align="center">
    The Faire Weather App is an app built to show the temperature consumed from the FaireAPI.
  </p>
</p>

<p align="center">
<img src= "https://github.com/matheusjkweber/faireWeather/blob/main/Resources/app.png?raw=true" width="400" >
</p>

## Architecture
The Faire Weather App is built using the <a href="https://github.com/uber/RIBs">RIB architecture</a>, which is a cross-platform architecture framework used in Uber's project. The name means Router, Interactor and Builder. <br />
The usage of the RIB architecture was defined because it provides: state management, testability, isolation and escalation. <br />
Also, the RIB architecture is very good to handle dependency management due its state management. 
The Faire Weather App is built as follow: <br/>

<br />
<p align="center">
<img src= "https://github.com/matheusjkweber/faireWeather/blob/readme/Resources/FaireArchitecture.png?raw=true" width="400" >
</p>

### Root RIB 
The Root RIB is responsible for consolidating the root scope of the app. If necessary add more states, they can be added under this RIB. Also it is responsible for creating and maintaining the FaireAPI, injecting in any children that want to access it. <br />

The Root RIB is responsible for holding the Root scope, and with this, it will create the dependencies used across the entire app. The dependencies are injected by the RootComponent. 
### Main RIB 
The Main RIB is responsible for the main part of the app, everything else should be optional. The main view of the app should contain the main information that the app needs to pass: the weather. The Main RIB is responsible for consuming the FaireAPI, treating the information and passing along its children.<br/>

The Main RIB can receive as many components needed to mount its screen. In the future, I should build a plugin system and make the components more generic.

### CitySelector RIB 
The CitySelector RIB is responsible for showing the current city being shown and, in the future, selecting other cities to show.
### WeatherDisplay RIB 
The WeatherDisplay RIB is responsible for displaying the main weather information.
### WeatherDetails RIB 
The WeatherDetails RIB is responsible for showing more information regarding the weather.

### More Information
Also, the FaireWeather uses an own API developed by me using the <a href="https://malcolmkmd.medium.com/writing-network-layer-in-swift-protocol-oriented-approach-4fa40ef1f908">Malcolm Kumwenda`s Medium Tutorial</a>. In the future, support for RXSwift will be added.

## Requirements

- iOS 13.0+
- Xcode 14.2

## Installation

#### CocoaPods
To install the FaireWeather app you must have [CocoaPods](http://cocoapods.org/) installed, and run the following command:

```
pod install
```

#### CocoaPods
In order to test the app, you need to change the target to *faireWeatherTests* and run the *cmd+U* command.