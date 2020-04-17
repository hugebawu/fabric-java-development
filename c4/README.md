# 通道配置与更新

了解Fabric通道的启动过程，掌握通道的配置与更新方法。

## 一、运行预置代码

### 1、系统通道的配置区块

在终端1#进入项目目录，启动排序节点：

```
~$ cd ~/repo/c4/system-channel-config
~/repo/c4/system-channel-config$ ./start-orderer.sh
```

在终端2#进入项目目录，获取系统通道的当前配置区块：

```
~/repo/c4/system-channel-config$ ./fetch-config-block.sh
```

在终端2#查看系统通道配置区块和创世区块的差异：

```
~/repo/c4/system-channel-config$ diff artifact/genesis.yaml artifact/config-block.yaml
```

### 2、标准通道的配置区块

在终端1#进入项目目录，启动排序节点：

```
~$ cd ~/repo/c4/standard-channel-config
~/repo/c4/standard-channel-config$ ./start-orderer.sh
```

在终端2#进入项目目录，创建通道：

```
~/repo/c4/standard-channel-config$ ./create-channel.sh
```

在终端2#提取并查看标准通道的配置区块内容：

```
~/repo/c4/standard-channel-config$ ./fetch-config-block.sh
~/repo/c4/system-channel-config$ cat artifact/config-block.yaml
```

### 3、查看通道配置组

在终端1#进入项目目录，初始化并启动网络：

```
~$ cd ~/repo/c4/view-config-group
~/repo/c4/view-config-group$ wiz net reset
~/repo/c4/view-config-group$ wiz net start
```

在终端2#进入项目目录，提取系统通道配置区块中的配置组数据：

```
~/repo/c4/view-config-group$ ./fetch-config-group.sh
```

查看通道配置组数据：

```
~/repo/c4/view-config-group$ cat artifact/config.yaml
```

### 4、查看通道配置更新交易

在终端1#进入项目目录，初始化网络配置：

```
~$ cd ~/repo/c4/view-config-update
~/repo/c4/view-config-update$ wiz net reset
```

在终端2#进入项目目录，生成通道配置更新交易：

```
~/repo/c4/view-config-update$ ./view-config-update.sh
```

查看通道配置更新交易的内容：

```
~/repo/c4/view-config-update$ cat artifact/config-update.yaml
```
查看通道配置组数据：

```
~/repo/c4/view-config-group$ cat artifact/config.yaml
```

### 5、更新通道配置里的单个值

在终端1#进入项目目录，初始化并启动网络：

```
~$ cd ~/repo/c4/config-update-value
~/repo/c4/config-update-value$ wiz net reset 
~/repo/c4/config-update-value$ wiz net start
```

在终端2#启动链码：

```
~/repo/c4/config-update-value$ wiz cc start
```

在终端3#启动通道并激活链码：

```
~/repo/c4/config-update-value$ wiz ch start
```

在终端4#执行通道配置更新：提取配置、本地更新、提交修改后的配置：

```
~/repo/c4/config-update-value$ ./fetch-config.sh
~/repo/c4/config-update-value$ ./local-modify.sh
~/repo/c4/config-update-value$ ./update-config.sh
```