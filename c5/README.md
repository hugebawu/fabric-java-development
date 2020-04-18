# 链码开发进阶

- 理解链码的运行机制
- 理解跟踪链码状态更新的应用场景并掌握其使用方法
- 理解复合键的应用场景并掌握其使用方法
- 理解CouchDB状态库的应用场景并掌握其使用方法
- 理解通道事件服务的应用场景并掌握其使用方法
- 理解连接配置文件的作用并掌握其编写方法

## 一、运行预置代码

### 1、状态更新历史跟踪

在各终端都需要首先进入项目目录：

```
~$ cd ~/repo/c5/history-tracking
```

#### 1.1 启动网络

在1#终端初始化MSP配置然后启动网络：

```
~/repo/c5/history-tracking$ wiz net reset
~/repo/c5/history-tracking$ wiz net start
```

#### 1.2 启动链码

在2#终端启动链码：

```
~/repo/c5/history-tracking$ wiz cc start
```

#### 1.3 启动通道

在3#终端创建通道ch1并加入该通道，然后安装并激活链码：

```
~/repo/c5/history-tracking$ wiz ch start
```

然后进入管理终端：

```
~/repo/c5/history-tracking$ wiz admin
admin@org1>
```
  
#### 1.4 启动应用
  
在4#终端启动应用并观察应用输出：
  
```
~/repo/c5/history-tracking$ wiz app start 
```

### 2、使用复合键

在各终端都需要首先进入项目目录：

```
~$ cd ~/repo/c5/composite-key
```

#### 2.1 启动网络

在1#终端初始化MSP配置然后启动网络：

```
~/repo/c5/composite-key$ wiz net reset
~/repo/c5/composite-key$ wiz net start
```

#### 2.2 启动链码

在2#终端启动链码：

```
~/repo/c5/composite-key$ wiz cc start
```

#### 2.3 启动通道

在3#终端创建通道ch1并加入该通道，然后安装并激活链码：

```
~/repo/c5/composite-key$ wiz ch start
```

然后进入管理终端：

```
~/repo/c5/composite-key$ wiz admin
admin@org1>
```
  
#### 2.4 启动应用
  
在4#终端启动应用并观察应用输出：
  
```
~/repo/c5/composite-key$ wiz app start 
```

### 3、使用CouchDB状态库  `

#### 3.1 启动CouchDB
  
在1#终端启动CouchDB：
  
```
~$ ~/repo/tools/couchdb/bin/couchdb  
```
  
#### 3.2 启动网络

在2#终端清理couchdb数据、初始化MSP配置然后启动网络：

```
~/repo/c5/couchdb-demo$ ./reset-couchdb.sh  
~/repo/c5/couchdb-demo$ wiz net reset
~/repo/c5/couchdb-demo$ wiz net start
```

#### 3.3 启动链码

在3#终端启动链码：

```
~/repo/c5/couchdb-demo$ wiz cc start
```

#### 3.4 启动通道环境

在4#终端创建通道ch1并加入该通道，然后安装并激活链码：

```
~/repo/c5/couchdb-demo$ wiz ch start
```
  
#### 3.5 启动应用
  
在5#终端启动应用并观察应用输出：
  
```
~/repo/c5/couchdb-demo$ wiz app start 
```  

### 4、通道事件服务

在各终端都需要首先进入项目目录：

```
~$ cd ~/repo/c5/event-service
```

#### 4.1 启动网络

在1#终端初始化MSP配置然后启动网络：

```
~/repo/c5/event-service$ wiz net reset
~/repo/c5/event-service$ wiz net start
```

#### 4.2 启动链码

在2#终端启动链码：

```
~/repo/c5/event-service$ wiz cc start
```

#### 4.3 启动通道

在3#终端创建通道ch1并加入该通道，然后安装并激活链码：

```
~/repo/c5/event-service$ wiz ch start
```

然后进入管理终端：

```
~/repo/c5/event-service$ wiz admin
admin@org1>
```
  
#### 4.4 启动应用
  
在4#终端进入项目目录，启动应用并观察应用输出：
  
```
~/repo/c5/event-service$ wiz app start 
```

### 5、使用连接配置文件
  
在各终端都需要首先进入项目目录：

```
~$ cd ~/repo/c5/connect-profile
```
  
#### 5.1 启动网络

在1#终端进入项目目录，初始化MSP配置然后启动网络：

```
~/repo/c5/connect-profile$ wiz net reset
~/repo/c5/connect-profile$ wiz net start
```

#### 5.2 启动链码

在2#终端启动链码：

```
~/repo/c5/connect-profile$ wiz cc start
```

#### 5.3 启动通道

在3#终端创建通道ch1、加入该通道、安装并激活链码：

```
~/repo/c5/connect-profile$ wiz ch start
```

然后进入管理终端：

```
~/repo/c5/connect-profile$ wiz admin
admin@org1>
```
  
#### 5.4 启动应用
  
在4#终端进入项目目录，启动应用并观察应用输出：
  
```
~/repo/c5/connect-profile$ wiz app start 
```  
