# flutter版本仿boss直聘
简介：2年前，RN刚出来时做了个仿拉钩的demo，[react-native-lagou](https://github.com/heruijun/react-native-lagou).
这次flutter来了，想感受一下，索性用目前flutter的版本写的一个仿boss直聘应用。
时间有限，没完全仿照，去掉了一些功能，但是界面风格一致，有参考价值。

## 感悟
1. 与一些文章里介绍的非常相似，如果会RN，那么学起来会很快，flutter借鉴了RN的组件化思想，路由机制，状态机等。
2. Dart语法有些奇葩，但掌握之后，开发效率会很快，整个demo加起来开发了2天不到。
3. 可以同时在android和ios运行。
4. 性能很快，超过RN，因为没有bridge层。
5. 还是要多看官方文档和源码，才能碰到问题解决。
6. IDE还不是很友好，hot reload有时无效。
7. 还是比RN要复杂一些的。

## 先上效果
![img](https://github.com/heruijun/flutter_boss/blob/master/effect.gif)

## 环境问题
如果flutter环境有问题，在.bash_profile里加上如下内容
```
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export PATH=`pwd`/flutter/bin:$PATH
```

## 涉及技术点
1. Theme主题设置
```Dart
      theme: new ThemeData(
        primaryIconTheme: const IconThemeData(color: Colors.white),
        brightness: Brightness.light,
        primaryColor: new Color.fromARGB(255, 0, 215, 198),
        accentColor: Colors.cyan[300],
      )
```

2. 自定义TabBar
```Dart
     @override
      Widget build(BuildContext context) {
        assert(debugCheckHasMaterial(context));
    
        double height = _kTextAndIconTabHeight;
        Widget label = new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                child: new Image(
                  image: new AssetImage(this.icon),
                  height: 30.0,
                  width: 30.0,
                ),
                margin: const EdgeInsets.only(bottom: _kMarginBottom),
              ),
              _buildLabelText()
            ]
        );
      }
```

3. MD风格及一些组件应用
```Dart
    new SliverAppBar(
      expandedHeight: _appBarHeight,
      pinned: _appBarBehavior == AppBarBehavior.pinned,
      floating: _appBarBehavior == AppBarBehavior.floating ||
          _appBarBehavior == AppBarBehavior.snapping,
      snap: _appBarBehavior == AppBarBehavior.snapping,
      flexibleSpace: new FlexibleSpaceBar(
        title: new Text(_company.name,
            style: new TextStyle(color: Colors.white)),
        background: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Image.network(
              'https://img.bosszhipin.com/beijin/mcs/chatphoto/20170725/861159df793857d6cb984b52db4d4c9c.jpg',
              fit: BoxFit.cover,
              height: _appBarHeight,
            ),
          ],
        ),
      ),
    )
```

4. 解决了官方demo里路由跳转效果卡顿的问题
```Dart
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return new CompanyDetail(company);
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(
            opacity: animation,
            child: new SlideTransition(position: new Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation), child: child),
          );
        }
    ));
```

## TODO
1. 下拉筛选组件
2. mock server，模拟真实请求
3. 分页
4. 目录结构调整，更符合生产环境
5. viewpager轮播图
6. 路由机制封装

## 联系方式
微信：heruijun2258，注明来意。

