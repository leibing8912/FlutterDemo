# FlutterDemo

### 注意点

* flutter代码逻辑、界面实现在lib目录下的dart文件，用dart语言编写，每个界面都是一个widget，分为有状态和无状态的widget，有状态的widget表示这个能根据状态变化，否则反之.

* flutter资源配置、库依赖在pubspec.yaml文件中.

* flutter工程编译生成android apk在build\app\outputs\apk路径.

* flutter工程编译时会生成android和ios两个工程，实际上也就完成了对原生的翻译工作，我们可以在对应的工程下完成跟原生类似的工作.

* 本demo的入口在main.dart的main()方法，通过调用runApp实现开启主界面，主界面实现是在index.dart中，是一个有状态的widget，实现了tab功能，然后每个tab都对应一个StatefulWidget分别实现各自对应的逻辑展示功能，这个就不一一细讲了.

* flutter原生widget基本只实现最简单的功能，比如image，这个没做缓存功能，于是我们自己编写dart实现或采用第三方实现，我们可以在pubspec.yaml文件中添加对应依赖.

### 效果

![动图效果](/test1.gif)