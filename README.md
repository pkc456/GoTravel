# GoTravel
GoTravel is an application that consist of one screen containing our 3 travel modes (Train, Buses & flights). I use `segmentBar` on navigation bar title to change travel mode. I use this style idea from native music app from `apple.`

This project provide:
- Use GCD and ARC
- A guarantee that main thread will never be blocked
- An asynchronous image downloader
- Offline cache support

NOTE: Latest version of [Alamofire](https://github.com/Alamofire/Alamofire) requires iOS 8 or later (because of ld: `embedded dylibs/frameworks are only supported on iOS 8.0 and later`). 

## Dependencies

- [Alamofire](https://github.com/Alamofire/Alamofire)
- [AlamofireImage](https://github.com/Alamofire/AlamofireImage/)

## Future Enhancements

- Due to time contraints, I integrate the segment bar on navigation title to change travel mode. I have experience in integrating the [PageMenu](https://github.com/uacaps/PageMenu) in one of my food category application named [HungerMafia](https://itunes.apple.com/us/app/hungermafia-food-restaurants/id998248067?mt=8). This page menu library allow the user to switch between any kind of view controller with an easy tap or swipe gesture.

