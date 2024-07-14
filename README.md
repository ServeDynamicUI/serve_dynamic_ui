**serve_dynamic_ui** is an open source Server-Driven UI library for Flutter. Create dynamic widgets in Flutter from jsons and extend to create your own dynamic widgets.

<img width="800" alt="Screenshot 2023-07-10 at 9 07 05 PM" src="https://i.ibb.co/frgrbKc/Screenshot-2023-07-10-at-9-07-05-PM-modified.png">

## Installation

To install **server_dynamic_ui**

run the command

```bash
  flutter pub add serve_dynamic_ui
```

## Features

<p align="center">
  <img src="https://github.com/user-attachments/assets/0880c16a-e275-41e6-8989-ee1dd8e97aed" alt="Pagination" height="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/43eec0eb-8c5d-4a0e-ad22-3191dd7e3e67" alt="Shimmer Effect" height="400" />
</p>


**1. It has in-built DynamicWidgets.**
   * Scaffold
   * Container
   * SizedBox
   * Text
   * Button
   * Image
   * Card
   * Column
   * Row
   * TabView
   * ListView
   * Loader
   * GestureDetector
   * Align
   * Positioned
   * Stack
   * TextField
   * Carousel
   * Percent Indicator
   * Shimmer Widgets

**2. Extend to Create Custom DynamicWidgets.**

**3. In-built actions (as of now Navigation action, Update a dynamic widget action, handling user input action, data event action).**

**4. Extend to Create Custom Actions.**

**5. Invoke methods in a DynamicWidget.**

**6. Update DynamicWidget state.**

**7. Listen to controllers(as of now scroll listener, text change listener, carousel change listener, data event listener).**

**8. Handle form inputs.**

**9. Load JSON from assets or from the network.**

**10. Dynamic Page caching.**

**11. Pagination Support in Screen.**

**12. Appbar can have dynamic left and right widgets.**

**13. Shimmer loading effects.**

**14. Screen state update.**

**15. Screen Pop Strategies (POP, POP_TO_ROOT, POP_UNTIL_SCREEN).**

**16. Refresh dynamic screens.**

**17. Session Manager Widget to handle Authentication.**

## Getting started

To use **serve_dynamic_ui**

initialize the package.

```dart
void main() {
  ServeDynamicUI.init();
  runApp(const MyApp());
}
```

Load the JSON and render the widget from asset.

```dart
@override
Widget build(BuildContext context) {
  return ServeDynamicUIMaterialApp(
    home: (context) {
      return ServeDynamicUI.fromAssets('assets/json/sample.json', context);
    },
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      useMaterial3: false,
    ),
  );
}
```

## Usage

**Initialize the package.**

```dart
void main() {
  ServeDynamicUI.init();
  runApp(const MyApp());
}
```

**structure of json**

```json
{
  "type": "registered_widget_name",
  //here you can add properties to configure the dynamic widget.
  "data": {
    "key": "required value to find the widget in widget tree"
    //other properties go here.
  }
}
```

**Example Json**

```json
{
  "type": "dy_scaffold",
  "data": {
    "key": "123456",
    "appBar": {
      "pageTitle": "Flutter Server UI Home Screen",
      "leftActions": [
        {
          "type": "dy_image",
          "data": {
            "key": "23424234234",
            "src": "assets/images/card_ic.png",
            "height": 30,
            "width": 30,
            "imageType": "asset",
            "fit": "fill",
            "clipBorderRadius": 20,
            "placeholderImagePath": "assets/images/icon_placeholder.png"
          }
        }
      ],
      "rightActions": [
        {
          "type": "dy_gesture_detector",
          "data": {
            "key": "24234234234",
            "onTapAction": {
              "actionString": "/moveToScreen",
              "extras": {
                "url": "https://raw.githubusercontent.com/ServeDynamicUI/serve_dynamic_ui/main/example/assets/json/scaffold.json?isPageCacheEnabled=true",
                "urlType": "network",
                "requestType": "get",
                "navigationType": "screen",
                "navigationStyle": "push",
                "loaderWidgetAssetPath": "assets/json/loader.json"
              }
            },
            "child": {
              "type": "dy_image",
              "data": {
                "key": "23424234234",
                "src": "https://upload.wikimedia.org/wikipedia/commons/5/5a/Perspective-Button-Stop-icon.png",
                "height": 30,
                "width": 30,
                "imageType": "network",
                "fit": "fill",
                "placeholderImagePath": "assets/images/icon_placeholder.png"
              }
            }
          }
        }
      ],
      "leftActionsWidth": 60
    },
    "children": [
      {
        "type": "dy_column",
        "data": {
          "key": "423243",
          "children": [
            {
              "type": "dy_gesture_detector",
              "data": {
                "key": "1234234",
                "onTapAction": {
                  "actionString": "/moveToScreen",
                  "extras": {
                    "url": "https://raw.githubusercontent.com/Arunshaik2001/demo_server_driven_ui/master/assets/json/dy_scaffold.json",
                    "urlType": "network",
                    "requestType": "get",
                    "navigationType": "screen",
                    "navigationStyle": "push",
                    "loaderWidgetAssetPath": "assets/json/loader.json"
                  }
                },
                "child": {
                  "type": "dy_widget_card",
                  "data": {
                    "key": "1323",
                    "margin": "10",
                    "elevation": 10,
                    "padding": "10",
                    "borderRadius": 10,
                    "body": {
                      "type": "dy_container",
                      "data": {
                        "key": "15345",
                        "padding": "10,0,0,0",
                        "child": {
                          "type": "dy_column",
                          "data": {
                            "key": "2457231",
                            "mainAxisAlignment": "spaceBetween",
                            "crossAxisAlignment": "start",
                            "children": [
                              {
                                "type": "dy_text",
                                "data": {
                                  "key": "1734233",
                                  "text": "Scaffold",
                                  "style": {
                                    "color": "0xffff0000",
                                    "fontSize": 20,
                                    "fontWeight": "bold"
                                  }
                                }
                              },
                              {
                                "type": "dy_container",
                                "data": {
                                  "key": "813123",
                                  "width": 200,
                                  "child": {
                                    "type": "dy_text",
                                    "data": {
                                      "key": "8327757234",
                                      "text": "a widget that provides basic structure for building app's layout.",
                                      "maxLines": 3
                                    }
                                  }
                                }
                              }
                            ]
                          }
                        }
                      }
                    },
                    "prefixImage": {
                      "type": "dy_image",
                      "data": {
                        "key": "16323233",
                        "src": "assets/images/icon_scaffold.png",
                        "height": 50,
                        "width": 50,
                        "imageType": "asset",
                        "fit": "fill",
                        "placeholderImagePath": "assets/images/icon_placeholder.png"
                      }
                    },
                    "action": {
                      "actionString": "/showSnackbar",
                      "extras": {
                        "title": "Scaffold"
                      }
                    }
                  }
                }
              }
            },
            {
              "type": "dy_gesture_detector",
              "data": {
                "key": "24234234",
                "onTapAction": {
                  "actionString": "/moveToScreen",
                  "extras": {
                    "url": "assets/json/container.json",
                    "urlType": "local",
                    "navigationType": "screen",
                    "navigationStyle": "push"
                  }
                },
                "child": {
                  "type": "dy_widget_card",
                  "data": {
                    "key": "22323",
                    "margin": "10",
                    "elevation": 10,
                    "padding": "10",
                    "borderRadius": 10,
                    "action": {
                      "actionString": "/showSnackbar",
                      "extras": {
                        "title": "Container"
                      }
                    },
                    "body": {
                      "type": "dy_container",
                      "data": {
                        "key": "345345",
                        "padding": "10,0,0,0",
                        "child": {
                          "type": "dy_column",
                          "data": {
                            "key": "2457231",
                            "mainAxisAlignment": "spaceBetween",
                            "crossAxisAlignment": "start",
                            "children": [
                              {
                                "type": "dy_text",
                                "data": {
                                  "key": "2232734233",
                                  "text": "Container",
                                  "style": {
                                    "color": "0xffff0000",
                                    "fontSize": 20,
                                    "fontWeight": "bold"
                                  }
                                }
                              },
                              {
                                "type": "dy_text",
                                "data": {
                                  "key": "223667757234",
                                  "text": "a widget that holds other widgets"
                                }
                              }
                            ]
                          }
                        }
                      }
                    },
                    "prefixImage": {
                      "type": "dy_image",
                      "data": {
                        "key": "2226323233",
                        "src": "https://www.saloodo.com/wp-content/uploads/2021/09/container-1-1.png",
                        "height": 50,
                        "width": 50,
                        "imageType": "network",
                        "fit": "fill",
                        "clipBorderRadius": 20,
                        "placeholderImagePath": "assets/images/icon_placeholder.png"
                      }
                    }
                  }
                }
              }
            }
          ]
        }
      }
    ]
  }
}
```
you can have **multiple child** in scaffold

you can pass dynamic widgets in **appbar left and right actions**

```json
{
  "appBar": {
    "pageTitle": "Flutter Server UI Home Screen",
    "leftActions": [
      {
        "type": "dy_image",
        "data": {
          "key": "23424234234",
          "src": "assets/images/card_ic.png",
          "height": 30,
          "width": 30,
          "imageType": "asset",
          "fit": "fill",
          "clipBorderRadius": 20,
          "placeholderImagePath": "assets/images/icon_placeholder.png"
        }
      }
    ],
    "rightActions": [
      {
        "type": "dy_gesture_detector",
        "data": {
          "key": "24234234234",
          "onTapAction": {
            "actionString": "/moveToScreen",
            "extras": {
              "url": "https://raw.githubusercontent.com/ServeDynamicUI/serve_dynamic_ui/main/example/assets/json/scaffold.json?isPageCacheEnabled=true",
              "urlType": "network",
              "requestType": "get",
              "navigationType": "screen",
              "navigationStyle": "push",
              "loaderWidgetAssetPath": "assets/json/loader.json"
            }
          },
          "child": {
            "type": "dy_image",
            "data": {
              "key": "23424234234",
              "src": "https://upload.wikimedia.org/wikipedia/commons/5/5a/Perspective-Button-Stop-icon.png",
              "height": 30,
              "width": 30,
              "imageType": "network",
              "fit": "fill",
              "placeholderImagePath": "assets/images/icon_placeholder.png"
            }
          }
        }
      }
    ],
    "leftActionsWidth": 60
  }
}
```

you can customize the appbar by passing desired properties as per your requirement.

**Load the JSON and render the widget from asset.**

```dart
@override
Widget build(BuildContext context) {
  return ServeDynamicUIMaterialApp(
    home: (context) {
      return ServeDynamicUI.fromAssets('assets/json/sample.json');
    },
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      useMaterial3: false,
    ),
  );
}
```

**Load the JSON and render the widget from the network with template json.**

```dart
  @override
Widget build(BuildContext context) {
  return ServeDynamicUIMaterialApp(
    home: (context) {
      return ServeDynamicUI.fromNetwork(
        DynamicRequest(
          url: 'https://github.com/Arunshaik2001/demo_server_driven_ui/blob/master/assets/json/dy_scaffold.json?isPageCacheEnabled=true',
          requestType: RequestType.get,
        ),
        templateJsonPath: 'assets/json/shimmer_pages/default_page_shimmer.json',
      );
    },
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      useMaterial3: false,
    ),
  );
}
```

If you want to enable page caching just pass query param **isPageCacheEnabled=true**

**Session Management**

If you want to handle auth session out of box for dynamic pages.

use **SessionManagerWidget**

```dart
    SessionManagerWidget(
      onUndetermined: () {
        return ServeDynamicUI.fromAssets(
          'assets/json/loader.json',
        );
      },
      onAuthenticated: () {
        return ServeDynamicUI.fromNetwork(
          DynamicRequest(
            url:
              'https://raw.githubusercontent.com/ServeDynamicUI/serve_dynamic_ui/main/example/assets/json/list_view.json?isPageCacheEnabled=true',
            requestType: RequestType.get,
          ),
          templateJsonPath: 'assets/json/shimmer_pages/default_page_shimmer.json',
        );
      },
      deAuthenticated: () {
        return ServeDynamicUI.fromNetwork(
          DynamicRequest(
            url:
              'https://raw.githubusercontent.com/ServeDynamicUI/serve_dynamic_ui/main/example/assets/json/sample.json?isPageCacheEnabled=true',
            requestType: RequestType.get,
          ),
          templateJsonPath: 'assets/json/shimmer_pages/default_page_shimmer.json',
        );
      },
      onAuthenticationInProgress: () {
        return ServeDynamicUI.fromAssets(
            'assets/json/loader.json',
        );
        },
      deAuthenticationInProgress: () {
        return ServeDynamicUI.fromAssets(
          'assets/json/loader.json',
        );
      },
      onAuthenticationExpired: () {
       return const SizedBox();
      },
      notAuthenticated: () {
      return ServeDynamicUI.fromNetwork(
        DynamicRequest(
          url:
          'https://raw.githubusercontent.com/ServeDynamicUI/serve_dynamic_ui/main/example/assets/json/sample.json?isPageCacheEnabled=true',
          requestType: RequestType.get,
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10)),
          templateJsonPath:
            'assets/json/shimmer_pages/default_page_shimmer.json',
        );
      },
      onAuthenticationFailed: () {
            return ServeDynamicUI.fromAssets(
             'assets/json/loader.json',
            );
      },
)
```

There are multiple events for session management all cases are handled here.
So to transition between multiple session states you need to use **SessionManagerState.instance**

whenever you want to transition between session state use it like this

```dart
    SessionManagerState.instance.sessionStreamController.sink.add(
      SessionOnAuthenticatedEvent(
        authInfo: {
          'email': value['textFieldData'][0],
          'userName': value['textFieldData'][1],
        },
      ),
    );
```

just add the event session stream.
**SessionOnAuthenticatedEvent** it takes a optional authInfo which will be securely stored to manage user info if not passed it will generate a secret session key.

```dart
   SessionManagerState.instance.sessionStreamController.sink.add(SessionDeAuthenticatedEvent());
```

if you want to log out use **SessionDeAuthenticatedEvent**

There are multiple session states

**SessionUndeterminedEvent**

**SessionAuthenticationExpiredEvent**

**SessionOnAuthenticationInProgressEvent**

**SessionNotAuthenticatedEvent**

**SessionAuthenticationFailedEvent**

**SessionDeAuthenticationInProgressEvent**

**SessionOnAuthenticatedEvent**

**SessionDeAuthenticatedEvent**


### Shimmer Loading Pages

If you want, you can create shimmer loading pages for network pages.

There are many dynamic shimmer widgets using which you can create shimmer pages or you can create your custom shimmer effects

```json
{
  "type": "dy_scaffold",
  "data": {
    "key": "default_page_shimmer",
    "crossAxisAlignment": "start",
    "appBar": {
      "pageTitle": "Flutter Server UI Home Screen",
      "leftActions": [
        {
          "type": "dy_image",
          "data": {
            "key": "2226323233",
            "src": "assets/images/card_ic.png",
            "height": 30,
            "width": 30,
            "imageType": "asset",
            "fit": "fill",
            "clipBorderRadius": 20,
            "placeholderImagePath": "assets/images/icon_placeholder.png"
          }
        }
      ],
      "rightActions": [
        {
          "type": "dy_gesture_detector",
          "data": {
            "key": "1234234",
            "onTapAction": {
              "actionString": "/moveToScreen",
              "extras": {
                "url": "https://raw.githubusercontent.com/Arunshaik2001/demo_server_driven_ui/master/assets/json/dy_scaffold.json",
                "urlType": "network",
                "requestType": "get",
                "navigationType": "screen",
                "navigationStyle": "push",
                "loaderWidgetAssetPath": "assets/json/loader.json"
              }
            },
            "child": {
              "type": "dy_image",
              "data": {
                "key": "222632323233",
                "src": "https://upload.wikimedia.org/wikipedia/commons/5/5a/Perspective-Button-Stop-icon.png",
                "height": 30,
                "width": 30,
                "imageType": "network",
                "fit": "fill",
                "placeholderImagePath": "assets/images/icon_placeholder.png"
              }
            }
          }
        }
      ],
      "leftActionsWidth": 60
    },
    "padding": "10,0,10,10",
    "children": [
      {
        "type": "dy_shimmer_column",
        "data": {
          "key": "dy_shimmer_column",
          "itemCount": 10,
          "interItemSpacing": 10,
          "childItems": [
            {
              "type": "dy_shimmer_widget_card",
              "data": {
                "key": "dy_shimmer_widget_card",
                "padding": "10,15,15,15",
                "margin": "2",
                "height": 80,
                "borderRadius": 10,
                "prefixImage": {
                  "type": "dy_shimmer_image",
                  "data": {
                    "key": "dy_shimmer_image",
                    "placeholderImagePath": "assets/images/icon_placeholder.png",
                    "clipBorderRadius": 10,
                    "height": 50,
                    "width": 50,
                    "fit": "fill",
                    "shimmerBaseColor": "0x00000000"
                  }
                },
                "body": {
                  "type": "dy_shimmer_column",
                  "data": {
                    "key": "dy_shimmer_column",
                    "itemCount": 1,
                    "interItemSpacing": 10,
                    "crossAxisAlignment": "start",
                    "childItems": [
                      {
                        "type": "dy_shimmer_button",
                        "data": {
                          "key": "dy_shimmer_button",
                          "height": 10,
                          "width": 100,
                          "buttonBorderRadius": 0,
                          "shimmerBaseColor": "0xFFE0E0E0",
                          "shimmerHighlightColor": "0xFFF5F5F5"
                        }
                      },
                      {
                        "type": "dy_shimmer_row",
                        "data": {
                          "key": "dy_shimmer_row",
                          "itemCount": 1,
                          "interItemSpacing": 0,
                          "crossAxisAlignment": "start",
                          "childItems": [
                            {
                              "type": "dy_shimmer_button",
                              "data": {
                                "key": "dy_shimmer_button",
                                "height": 10,
                                "width": 200,
                                "buttonBorderRadius": 0,
                                "shimmerBaseColor": "0xFFE0E0E0",
                                "shimmerHighlightColor": "0xFFF5F5F5"
                              }
                            }
                          ]
                        }
                      }
                    ]
                  }
                }
              }
            }
          ]
        }
      }
    ]
  }
}
```

pass the shimmer json path in **templateJsonPath='assets/json/shimmer_pages/default_page_shimmer.json'**

**Pagination in Dynamic Screens**

Dynamic Scaffold supports pagination

you have to make **paginated=true** for pagination
and use **nextUrl** property in **dy_scaffold** this url is a paginated url

```
for ex:
"https://raw.githubusercontent.com/Arunshaik2001/serve_dynamic_ui/scaffold-pagination/example/assets/json/sample1.json",
"https://your_domain//assets/json/pokedyn_homepage?offset=5&limit=10.json"
```

**nextUrl** should return json in a specific format

if **nextUrl** returned json is not in the format below, it will create issues rendering children.

```json
{
  "children": [{
    "type": "dy_container",
    "data": {
      "key": "1231223233",
      "child": {
        "type": "dy_card",
        "data": {
          "key": "123994545123",
          "color": "0xffff0000",
          "margin": "10",
          "elevation": 10,
          "linearGradient": "-1.0,0.0;1.0,0.0;0xff6D59D4,0xff879CFB",
          "borderRadius": 20,
          "child": {
            "type": "dy_text",
            "data": {
              "key": "343245454",
              "text": "Card",
              "height": 100,
              "width": 200,
              "textAlign": "center",
              "style": {
                "color": "0xffffffff",
                "fontSize": 25,
                "fontWeight": "bold"
              }
            }
          }
        }
      }
    }
  }],
  "nextUrl": "https://your_domain.com/assets/json/pokedyn_homepage?offset=10&limit=10.json"
}
```

if you don't pass any **paginatedLoaderWidget** it will use default loader.
default loader is shown at bottom(last element) of children

you can also choose to show loader on top of page just like in stack, using **showPaginatedLoaderOnTop=true**

example paginated loader widget. you can define your own loader.

```json
    {
      "type": "dy_scaffold",
      "data": {
        "paginatedLoaderWidget": {
          "type": "dy_loader",
          "data": {
            "key": "13131",
            "mainAxisAlignment": "center",
            "crossAxisAlignment": "center",
            "containerWidth": -1,
            "loadingText": "Loading...",
            "containerColor": "0xFF9E9E9E",
            "containerColorOpacity": 0.9,
            "style": {
              "color": "0xFFFFFFFF",
              "fontSize": 20
            }
          }
        }
      }
    }
```


**Extend to Create Custom DynamicWidget**

Developer has to extend the class with **DynamicWidget**.

**DynamicWidget** looks like this

```dart
///[DynamicWidget] : an abstract class that helps to create a dynamic widget from json.
@JsonSerializable(
  createToJson: false,
  createFactory: false,
)
abstract class DynamicWidget {
  final String key;

  double? get dyHeight;

  double? get dyWidth;

  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets? margin;
  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets? padding;

  @JsonKey(includeFromJson: false, includeToJson: false)
  DynamicWidget? parent;

  DynamicWidget({
    required this.key,
    this.parent,
    this.margin,
    this.padding,
  });

  ///helps to build in-built flutter widget.
  Widget build(BuildContext context);

  ///called build build is invoked
  void preBuild();

  void postBuild();

  ///called on widgets which are being disposed
  void onDispose();

  ///this factory constructor takes the json and creates a dynamic widget and its sub children.
  factory DynamicWidget.fromJson(Map<String, dynamic> json) {
    try {
      String type = json[Strings.type];
      DynamicWidgetHandler? dynamicWidgetHandler =
      DynamicWidgetHandlerRepo.getDynamicWidgetHandlerForType(type);
      if (dynamicWidgetHandler != null && json.containsKey(Strings.data)) {
        DynamicWidget widget = dynamicWidgetHandler(json[Strings.data]);
        List<DynamicWidget?>? children = widget.childWidgets;
        children?.forEach((element) {
          element?.parent = widget;
        });
        widget.preBuild();
        return widget;
      } else {
        debugPrint(
            'failed to create dynamic widget ${json[Strings.type]} ${json[Strings.data][Strings.key]}');
        return DynamicContainer(
            width: 0.0, showBorder: false, key: 'failed_container_key');
      }
    } catch (e) {
      debugPrint(
          'failed to create dynamic widget  ${json[Strings.type]} ${json[Strings.data][Strings.key]}');
      return DynamicContainer(
          width: 0.0, showBorder: false, key: 'exception_container_key');
    }
  }

  ///used to invoke methods in a dynamic widget
  FutureOr<dynamic> invokeMethod(String methodName, {
    Map<String, dynamic>? params,
  });

  ///list of children under this instance.
  List<DynamicWidget>? get childWidgets;
}

```

**DynamicWidget.fromJson** factory constructor to convert json to DynamicWidget object.

**build** method to create a **Widget**.

**invokeMethod** method to invoke any methods in a DynamicWidget.

**childWidgets** getter to maintain the child widgets under this widget.

**Example Custom DynamicWidget**

You can define your own properties and JSON should have key names as the class property names.
this project uses **json_serialization** and **json_annotation**.

```dart
class DynamicWidgetCard extends DynamicWidget {
  DynamicWidget? prefixImage;
  DynamicWidget? body;
  double? elevation;
  double? borderRadius;
  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets? margin;
  @JsonKey(fromJson: WidgetUtil.getEdgeInsets)
  EdgeInsets? padding;
  ActionDTO? action;

  DynamicWidgetCard({
    required String key,
    this.prefixImage,
    this.body,
    this.elevation,
    this.borderRadius,
    this.margin,
    this.padding,
    this.action,
  }) : super(
    key: key,
  );

  factory DynamicWidgetCard.fromJson(Map<String, dynamic> json) =>
      _$DynamicWidgetCardFromJson(json);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      ///just long press on the card.
      onLongPress: () {
        if (action != null) {
          ActionHandlersRepo.handle(action, this, context, (value) {
            debugPrint(value);
          });
        }
      },
      child: Card(
        elevation: elevation,
        margin: margin ?? EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Row(
            children: [
              if (prefixImage != null) prefixImage!.build(context),
              if (body != null) body!.build(context),
            ],
          ),
        ),
      ),
    );
  }

  @override
  List<DynamicWidget?>? get childWidgets => [prefixImage, body];

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}
}
```

Now to register.

```dart
void main() {
  Map<String, DynamicWidgetHandler> widgetHandlerMap = {
    "dy_widget_card": (json) => DynamicWidgetCard.fromJson(json)
  };

  ServeDynamicUI.init(
    widgetHandlers: widgetHandlerMap,
  );
  runApp(const MyApp());
}
```

**ServeDynamicUI.init()** takes optional parameter **widgetHandlers** where you can pass the custom widget in a map so that you can add more custom dynamic widgets.

**Create custom action**

```dart
abstract class ActionHandler {
  void handleAction(BuildContext? context, Uri action,
      Map<String, dynamic>? extras, OnHandledAction? onHandledAction) async {}
}
```

**handleAction** is the only method in **ActionHandler** to handle the logical task.

Now, to register this.

```dart
void main() {
  Map<RegExp, ActionHandler> actionHandlerMap = {
    RegExp(r'(^/?showSnackbar/?$)'): SnackBarActionHandler()
  };

  ServeDynamicUI.init(
    actionHandlers: actionHandlerMap,
  );
  runApp(const MyApp());
}
```

Regex is used. so you need to pass the action as action string ***actionString: /actionName?query1=value1&query2=value2**
It is recommended to follow the above pattern.

So, in json it looks like this

```json
"onTapAction": {
  "actionString": "/moveToScreen?popAndNavigateStrategy=popCurrent",
  "extras": {
    "url": "https://raw.githubusercontent.com/Arunshaik2001/demo_server_driven_ui/master/assets/json/dy_scaffold.json",
    "urlType": "network",
    "requestType": "get",
    "navigationType": "screen",
    "navigationStyle": "push",
    "loaderWidgetAssetPath": "assets/json/loader.json"
  }
}
```

you can pass the values you need in the **extras** map to handle the action.

you can also **popAndNavigateStrategy** pass navigation strategy to pop screens.

```
    popCurrent: it will pop the current screen and adds the new screen.
    popToRoot: it will pop till root screen and adds the new screen.
    popUntilScreen: it will pop screens till screenName=NAME which you will pass in query param.
```

**FormWidget**

A widget that validates the input data and gets the values in a map.

```dart
abstract class FormWidget {
  Map<String, dynamic> getValues();

  bool validate();
}
```

Extend Custom Dynamic Widget with **FormWidget** like **TextField**.

```dart
class DynamicTextField extends DynamicWidget implements FormWidget {
  final String initialText;
  TextFieldDTO? textFieldDecoration;

  DynamicTextField({required String key,
    required this.initialText,
    this.textFieldDecoration})
      : super(key: key);

  @override
  List<DynamicWidget?>? get childWidgets => [];

  @override
  Widget build(BuildContext context) {
    ...
    .
  }

  @override
  Map<String, dynamic> getValues() {
    return {Strings.textFieldData: _controller?.text ?? ''};
  }

  @override
  bool validate() {
    TextEditingController? controller = _controller;
    if (controller?.text != null && (controller?.text.isNotEmpty ?? false)) {
      bool isValid = true;
      if (StringUtil.isNotEmptyNorNull(regexValidator)) {
        RegExp regExp = RegExp(regexValidator!);
        isValid = regExp.hasMatch(controller!.text);
      }
      this.isValid.value = isValid;
      return isValid;
    }
    this.isValid.value = false;
    return false;
  }

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}
}
```

You can validate and decide how you want to send data in the Dynamic Widget.

you can pass **regexValidator** string to validate the text.

**To navigate between screens**

To go from one screen to another you need can use **/moveToScreen** action

```json
{
  "actionString": "/moveToScreen",
  "extras": {
    "url": "https://raw.githubusercontent.com/Arunshaik2001/demo_server_driven_ui/master/assets/json/dy_scaffold.json",
    "urlType": "network",
    "requestType": "get",
    "navigationType": "screen",
    "navigationStyle": "push",
    "loaderWidgetAssetPath": "assets/json/loader.json"
  }
}
```

here in **extras**

* **url**:  here you can pass asset path or network path
* **urlType**: define whether url is `network` or `local`.
* **requestType**: type of request (get, post, delete, put).
* **navigationType**: type of navigation (screen, dialog, bottomSheet).
* **loaderWidgetAssetPath**: you can pass asset path which will be shown as loader widget while package fetch the network json.

**To fetch form input**

To get the user input in a page use this action **/form**.

```json
  {
    "actionString": "/form"
  }
```

**To update static/dynamic screen**

To get the user input in a page use this action **/form**.

```json
  {
    "actionString": "/dataEventHook",
    "extras": {
      "dataEventId": "9102673423343",
      "data": {
        "methodName": "UPDATE_TEXT",
        "newText": "Hello, I have updated the title."
      }
    }
  }
```

use **dataEventHook** and pass **dataEventId** which is being listened by the widget

you need to extend **DataEventListener** class to listen and add this listener using

```dart
    DynamicListeners.addListener("dataEventHookId", DataEventListener());
```

this method you have to override

```dart
    @override
void onDataEvent(String dataEventKey, Map<String, dynamic> data) {
  String methodName = data['methodName'];
  switch (methodName) {
    case updateText:
      String newText = data[Strings.newText];
      _dynamicTextState.updateTitle(newText);
  }
}
```

**To refresh dynamic page**

if you want to refresh a dynamic page use the same **dataEventHook** and pass **dataEventId** equal RELOAD

```json
  {
    "actionString": "/dataEventHook",
    "extras": {
      "dataEventId": "RELOAD"
    }
  }
```

**RELOAD** is the event hook id

You should pass your page refresh events in **dy_scaffold**

```json
  { 
    "type": "dy_scaffold",
    "data": {
      "pageRefreshEvents": [
        "RELOAD"
      ]
    }
  }
```
In above example scaffold has
**YOUR_PAGE_EVENT_HOOK_ID=RELOAD**

**To update a dynamic Widget**

To update a widget. you need to use the **/updateWidget** action and in the **extras** map pass the **widgetKey** and **methodName** you want to invoke and pass **params** map with the required data.

```json
  "action": {
    "actionString": "/updateWidget",
    "extras": {
      "widgetKey": "update_text_key",
      "methodName": "UPDATE_TEXT",
      "params": {
        "newText": "Updated Text Value"
      }
    }
  }
```

**Important:** To make state changes the root widget must be **DynamicProvider** but you don't need to worry about it as it is handled by the package.

If you want to update a dynamic widget. first, create a state class.

I am showing you by taking the example of the **DynamicText** class.

```dart
class DynamicTextState {
  final ValueNotifier<String?> textNotifier;

  DynamicTextState(String? title,) : textNotifier = ValueNotifier<String?>(title);

  void updateTitle(String? newTitle) {
    textNotifier.value = newTitle;
  }
}
```

Now, create a getter that returns the state class instance for a unique widget key.
**DynamicProvider** has 2 maps **stateCache** and **controllerCache** which stores state classes and controller classes.
So that you will have a single instance of state class and controller class for a unique widget instance.

```dart
  DynamicTextState? __dynamicTextState;

DynamicTextState get _dynamicTextState {
  DynamicProvider? dynamicProvider =
  WidgetResolver.getTopAncestorOfType<DynamicProvider>(this);
  if (dynamicProvider == null) {
    return DynamicTextState(text);
  }
  if (__dynamicTextState != null) {
    return __dynamicTextState!;
  } else {
    if (key == null) {
      __dynamicTextState = DynamicTextState(text);
    } else {
      __dynamicTextState = dynamicProvider.stateCache.putIfAbsent(
        key,
            () => DynamicTextState(text),
      ) as DynamicTextState?;
    }
  }
  return __dynamicTextState!;
}

```

**Listen to controllers**
If you want that you need to listen to scroll controllers or text controllers present in a dynamic widget.
you can do something like this.

For scroll listener extend ScrollListener which has methods **onScrolled** **onScrolledToEnd** **onScrolledToStart** all have widget key which is the key of a widget which is being scrolled.

```dart
class WidgetScrollListener extends ScrollListener {
  @override
  void onScrolled(String? widgetKey) {
    debugPrint('onScrolled $widgetKey');
  }

  @override
  void onScrolledToEnd(String? widgetKey) {
    debugPrint('onScrolledToEnd $widgetKey');
  }

  @override
  void onScrolledToStart(String? widgetKey) {
    debugPrint('onScrolledToStart $widgetKey');
  }
}
```

now, you can register it like this.

```dart
DynamicListeners.addListener("scrollable_widget_key", WidgetScrollListener());
```

In the same way, for Text change listeners.

```dart
class TextUpdateListener extends TextChangeListener {
  @override
  void onTextChanged(String? widgetKey, String newValue) {
    debugPrint('onTextChanged $widgetKey $newValue');
  }
}
```

add this as listener

```dart
  DynamicListeners.addListener("text_field_key", TextUpdateListener());
```

there is one listener for carousel scroll

```dart

class CarouselSliderChangeListener extends CarouselChangeListener {
  @override
  void onPageChanged(
      String? widgetKey, int index, CarouselPageChangedReason changeReason) {
    print('widgetKey: $widgetKey, index: $index, changeReason: $changeReason');
  }

  @override
  void onScrolled(String? widgetKey, double? value) {
    print('widgetKey: $widgetKey, value: $value');
  }
}

```

add this as listener

```dart
  DynamicListeners.addListener("carousel_widget-_key", CarouselSliderChangeListener());
```

## Page caching on flutter web app:

For page caching this package use floor package which internally depends on sqflite and if you are intending to develop flutter web app and want to enable page caching. you need to follow few steps:

1. Add the dependency:

```yaml
  dependencies:
    sqflite_common_ffi_web: '>=0.1.0-dev.1'
```

2. install binaries using the command:

```bash
$ dart run sqflite_common_ffi_web:setup
```

3. run the command again using the force option:

```bash
$ dart run sqflite_common_ffi_web:setup --force
```

4. add this script in web/index.html inside <head>

```html

<script src="sqflite_sw.js"></script>
```

5. make sure you add before calling serve_dynamic_ui init();

```dart
   WidgetsFlutterBinding.ensureInitialized();
```

To know more check out [example app](https://github.com/Arunshaik2001/serve_dynamic_ui/tree/main/example).

Checkout full working app with server using serverpod [pokedyn-app](https://github.com/ServeDynamicUI/pokedyn-app).

## Additional information

Please create issues [here](https://github.com/Arunshaik2001/serve_dynamic_ui/issues).

If you like to contribute to this project. Feel free to raise pull requests. 🙂
