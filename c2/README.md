# 快速上手Fabric区块链开发

- 了解PKI和X509证书
- 使用OpenSSL建立最小CA
- 构造最简Fabric网络
- 开发计数器链码
- 开发去中心化计数器应用。

## 使用预置代码

### 1、查验X509证书

在1#终端进入项目目录：

```
~$ cd ~/repo/c2/cert-x509
```

查看CA根证书和Admin用户证书：

```
~/repo/c2/cert-x509$ ./view-ca-cert.sh
~/repo/c2/cert-x509$ ./view-admin-cert.sh
```

验证Admin证书是否由CA签发：

```
~/repo/c2/cert-x509$ ./verify-admin-cert.sh
```

### 2、发行X509证书

使用openssl建立一个CA，并发行用于Fabric网络的X509V3证书。

在终端1#执行如下命令：

```
~$ cd ~/repo/c2/mini-ca
~/repo/c2/mini-ca$ ./generate-identity
```

查看artifact目录下生成的证书：

```
~/repo/c2/mini-ca$ ls artifact/*-cert.pem
```

### 3、组织本地MSP目录

在1#终端进入项目目录，执行脚本初始化本地MSP目录：

```
~$ cd ~/repo/c2/local-msp
~/repo/c2/local-msp$ ./init-msp.sh
```

查看本地msp目录的结构和内容：

```
~/repo/c2/local-msp$ tree msp
```

### 4、启动最小Fabric网络

#### 4.1 启动排序节点

在1#终端进入项目目录,启动Fabric排序节点：

```
~$ cd ~/repo/c2/solo-network
~/repo/c2/solo-network$ ./start-orderer.sh
```

#### 4.2 启动对等节点

在2#终端进入项目目录，启动Fabric对等节点：

```
~$ cd ~/repo/c2/solo-network
~/repo/c2/solo-network$ ./start-peer.sh
```

#### 4.3 创建通道

在3#终端进入项目目录，创建通道ch1：

```
~$ cd ~/repo/c2/solo-network
~/repo/c2/solo-network$ ./create-channel.sh
```

然后将当前对等节点加入通道：

```
~/repo/c2/solo-network$ ./join-channel.sh
```

#### 4.4 启动Fabric链码

在4#终端进入项目目录，启动链码：

```
~$ cd ~/repo/c2/counter-cc
~/repo/c2/counter-cc$ ./start.sh
```

#### 4.5 在Fabric通道安装并激活链码

在3#终端执行如下命令安装并激活counter-cc链码：

```
~/repo/c2/solo-network$ ./install-chaincode.sh
~/repo/c2/solo-network$ ./instantiate-chaincode.sh
```

#### 4.6 测试链码调用

在3#终端的网管环境内执行如下命令查询链码：

```
~/repo/c2/solo-network$ ./query-chaincode.sh
```

使用如下命令提交计数器增长交易：

```
~/repo/c2/solo-network$ ./invoke-chaincode.sh
```

### 5、运行Fabric应用

在5#终端进入项目目录，启动应用并观察其输出：

```
~$ cd ~/repo/ch2/counter-dapp
~/repo/ch2/counter-dapp$ ./start.sh
```

### 6、使用WIZ工具箱

在1#终端进入项目目录，启动网络：

```
~/repo/c2/wiz-demo$ wiz net reset && wiz net start
```

在2#终端进入项目目录，启动链码：

```
~/repo/c2/wiz-demo$ wiz cc start
```

在3#终端进入项目目录，启动通道环境，然后进入管理终端查看已激活链码

```
~/repo/c2/wiz-demo$ wiz ch start
~/repo/c2/wiz-demo$ wiz admin
admin@org1> peer chaincode list --instantiated -C ch1
```

在4#终端进入项目目录，启动应用：

```
~/repo/c2/wiz-demo$ wiz app start
```
