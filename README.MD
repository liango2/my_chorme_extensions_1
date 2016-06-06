# 初始
## git配置
git config --global user.name liangyuan
git config --global user.email liangyuan@gmail.com
git config --global color.ui true


git config --list


C:\>cat %userprofile%\.gitconfig
[user]
        name = liango2
        email = 540625404@qq.com
[filter "lfs"]
        clean = git lfs clean %f
        smudge = git lfs smudge %f
        required = true
[color]
        ui = auto

C:\>

------------------------------
## git初始化: 创建repository

// 1.本地创建
git init
ls -A
cd .git/

// 2.克隆
git clone https://github.com/xxx/xxx
ls -A

------------------------------
# 分区
## git状态: 三个area 
// 初始: working area
git status

git add code.py
git add readme.txt  // 将会放到了staging area(也叫cache 也叫index)中
git status

git commit -m 'xxxxxxxx' // 将会放到history area中
git status
------------------------------
## git添加忽略文件
ls -A

echo '*~' > .gitignore
git add .gitignore

------------------------------
## git状态-简明扼要地说
git status -s  // -显示简明扼要的信息,不罗嗦
------------------------------
## git比对:查看代码区别-笼统地说

//1.
git diff // 查看working area 和staging area区别

//2.
git diff --staged // 查看staging area 和 history area区别

//3.
git diff HEAD        // 查看working area和history area中的区别
git diff --stat HEAD // -笼统地说


------------------------------
# 文件
## git重做文件
// 1.
git reset         xxxx.java      // 重设  (从history中取回到staging area)
// 2.
git checkout      xxxx.java      // 撤销 从staging area 中取回到working area
// 3.
git checkout HEAD xxxx.java      // 大撤销: 直接从history 中取回到working area

git commit -ma 'xxxxxxx'          // 大提交: 直接从working area到history

------------------------------
## git删除文件 
//1.
git rm xxxx.java // 删除 working area中的xxx.java
git commt -m 'xxxxx'

//2.
git rm --cached  xxx.java // 删除 stating area中把xxx.java删除,但是保留working area中的

## git重命名文件(使用mv)
//1. 简单的写法
git mv README.txt README.md 
ls
git commit -m 'rename README'

//2. 一个更复杂的写法
git rm --cached README.md
mv READMD.md README.txt
git add README.txt
git commit -m 'rename README'



## git呆到灰里面(紧急修复: 收拾桌面 放到抽屉)
// 有人告诉我有一个紧急修复,但是我的代码已经写了好多了
git stash // 把写了一大片的代码先放到抽屉里,撤回到原始状态以便紧急修复
git status
vi xxx.java
git commit -am '我的紧急修复'
// 然后,打开抽屉
git stash list
git stash pop // 灰里跑出来: 回到以前的状态,继续写代码...


* * *

Tuesday, June 7, 2016 2:48 AM

# java process manager - Google 搜索
https://www.google.com/search?q=java+process+manager+&oq=java+process+manager+&gs_l=serp.3..35i39l2j0i19j0i30i19l2j0i8i30i19l5.707819.711915.0.714545.21.16.0.0.0.0.307.1911.2-6j1.7.0....0...1c.1.64.serp..14.7.1908...0j0i3j0i30j0i8i30.Qmf9JY8Ap54

multithreading - Restricting thread count and Java concurrency - Stack Overflow
http://stackoverflow.com/questions/14653173/restricting-thread-count-and-java-concurrency

multithreading - How many threads can a Java VM support? - Stack Overflow
http://stackoverflow.com/questions/763579/how-many-threads-can-a-java-vm-support

Analyze slow and blocked processes
https://helpx.adobe.com/experience-manager/kb/AnalyzeSlowAndBlockedProcesses.html

java get started process count - Google 搜索
https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=java+get+started+process+count

Commons Exec – Apache Commons Exec Tutorial
http://commons.apache.org/proper/commons-exec/tutorial.html

TutorialTest xref
http://commons.apache.org/proper/commons-exec/xref-test/org/apache/commons/exec/TutorialTest.html

代码之美一---超时了怎么办？ - Coding EveryDay - ITeye技术网站
http://yeziwang.iteye.com/blog/846771

open source - Good Java Process Control Library - Stack Overflow
http://stackoverflow.com/questions/193166/good-java-process-control-library

Search · process manage windows language:Java
https://github.com/search?utf8=%E2%9C%93&q=process+manage++++windows++++++language%3AJava&type=Repositories&ref=searchresults

sfragata (Silvio Fragata Silva)
https://github.com/sfragata

liango2/Simulated-Dashboard-for-Task-Manager: A File Based Dashboard for Windows Task Manager using concrete subject processor and multiple observers with filter implementation
https://github.com/liango2/Simulated-Dashboard-for-Task-Manager

Search · ProcessManager language:java
https://github.com/search?utf8=%E2%9C%93&q=ProcessManager+language%3Ajava

liango2/ProcessManager-1: A java application to create and run Process objects.
https://github.com/liango2/ProcessManager-1

ankitC/processManager: Migratable Processing Framework
https://github.com/ankitC/processManager































