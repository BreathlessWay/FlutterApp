# FlutterApp的学习Demo

> 参考文档

1. [Dart](https://www.dartcn.com/)
2. [Flutter中文网](https://flutterchina.club/)
3. [Flutter实战](https://book.flutterchina.club/)

> 一些问题

1. 将图片添加到项目时，需要更新pubspec文件才能访问它们
2. 在Dart中，未初始化的变量的初始值为`null`
3. shared_preferences实现LocalStorage
4. url_launcher可以实现webview
5. 启动Simulator模拟器: `open -a Simulator`
6. 安卓启动图设置的图片不需要图片后缀名

##### Flutter 安卓卡在Running Gradle task 'assembleDebug'...

1. 修改`FlutterApp/android/build.gradle`文件
```
buildscript {
    ext.kotlin_version = '1.3.50'
    repositories {
        // 修改处
        // google()
        // jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:3.5.0'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}

allprojects {
    repositories {
        // 修改处
        // google()
        // jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
    }
}

rootProject.buildDir = '../build'
subprojects {
    project.buildDir = "${rootProject.buildDir}/${project.name}"
}
subprojects {
    project.evaluationDependsOn(':app')
}

task clean(type: Delete) {
    delete rootProject.buildDir
}

```
2. 修改flutter sdk包中`flutter/packages/flutter_tools/gradle/flutter.gradle`文件
```
import static groovy.io.FileType.FILES

import com.android.builder.model.AndroidProject
import com.android.build.OutputFile
import groovy.json.JsonSlurper
import java.nio.file.Path
import java.nio.file.Paths
import java.util.regex.Matcher
import java.util.regex.Pattern
import org.apache.tools.ant.taskdefs.condition.Os
import org.gradle.api.DefaultTask
import org.gradle.api.GradleException
import org.gradle.api.Project
import org.gradle.api.Plugin
import org.gradle.api.Task
import org.gradle.api.file.CopySpec
import org.gradle.api.file.FileCollection
import org.gradle.api.tasks.Copy
import org.gradle.api.tasks.InputFiles
import org.gradle.api.tasks.OutputDirectory
import org.gradle.api.tasks.TaskAction
import org.gradle.api.tasks.bundling.Jar

buildscript {
    repositories {
        // 修改处
        // google()
        // jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:3.5.0'
    }
}

android {
    compileOptions {
        sourceCompatibility 1.8
        targetCompatibility 1.8
    }
}

apply plugin: FlutterPlugin

class FlutterPlugin implements Plugin<Project> {
    // 修改处
    // private static final String MAVEN_REPO = "https://storage.googleapis.com/download.flutter.io";
    private static final String MAVEN_REPO = "https://storage.flutter-io.cn/download.flutter.io";
    ...
}
```