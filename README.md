# WifiVision in Flutter
> UI prototype

## How to run?
Java 17 is needed because of the AR Library.
Recommended is the JDK from Eclipse Temurin.
You can provide it with the environment variable:
```shell
JAVA_HOME="path_to_sdk"
```

Then just run it with:
```shell
flutter run --debug
```

## App layout
- **/lib**
  - */views*
    - Here are the pages implemented after the Figma.
  - */widgets*
    - Primarily custom widgets which implement the Figma.
  - */main.dart*
    - Entrypoint of the app.
  - */theme.dart*
    - Global styling of the app, for example styling the provided Material Widgets.
- **/assets**
  - */fonts*
    - Inter, ABeeZee.
- **/android**
  - */app*
    - */src*
      - */main*
        - */AndroidManifest.xml*
          - Setting permissions for android.
- **/ios**
  - */Podfile*
    - Setting permissions and deployment target.
  - */Runner*
    - */Info.plist*
      - Again setting permissions and deployment target in xCode.