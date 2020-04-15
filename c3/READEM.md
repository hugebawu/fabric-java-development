身份验证与权限管理
理解Fabric的身份验证机制与权限管理机制，掌握设计部署Fabric网络 的工具和思路。

使用预置代码
1、非对称密码学
在1#终端进入asym-crypto目录，完成密钥生成、数据签名和签名认证流程。

首先执行以下命令生成密钥对：

~/repo/c3/asym-crypto$ ./generate-keypair.sh
然后使用生成的私钥对文件hey-jude.tx的内容进行签名：

~/repo/c3/asym-crypto$ ./sing-data.sh
最后使用公钥对数据和签名进行认证：

~/repo/c3/asym-crypto$ ./verify-data-and-signature.sh
2、基于OpenSSL的PKI实现
在1# 终端进入openssl-pki目录，完成CA初始化、CSR生成和证书签发流程。

首先执行如下命令初始化CA：

~/repo/c3/openssl-pki$ ./init-ca.sh
然后（用户）执行如下命令生成CSR：

~/repo/c3/openssl-pki$ ./applier-generate-csr.sh
最后（CA）执行如下命令完成证书的签发：

~/repo/c3/openssl-pki$ ./ca-issue-cert.sh
任何第三方可以验证一个用户证书是否指定的CA所签发：

~/repo/c3/openssl-pki$ ./verify-cert-signed-by-ca.sh
3、本地MSP配置
在1#终端进入local-msp目录，生成MSP配置目录：

~/repo/c3/local-msp$ ./init-msp.sh
查看第三个机构的第一个Peer节点的MSP目录内容：

~/repo/c3/local-msp$ ./view-msp-of-peer0-org3.sh
4、通道MSP配置
在1#终端进入项目目录，初始化网络配置并启动网络：

~$ cd ~/repo/c3/channel-msp
~/repo/c3/channel-msp$ wiz net reset
~/repo/c3/channel-msp$ wiz net start
在2#终端提取系统通道的MSP配置：

~/repo/c3/channel-msp$ ./fetch-msp-config.sh
查看系统通道MSP配置：

~/repo/c3/channel-msp$ cat artifact/msp-config.yaml
5、通道访问控制策略
在1#终端进入项目目录，初始化网络配置并启动网络：

~$ cd ~/repo/c3/channel-policy
~/repo/c3/channel-policy$ wiz net reset
~/repo/c3/channel-policy$ wiz net start
在2#终端提取系统通道的顶层策略配置：

~/repo/c3/channel-policy$ ./fetch-channel-policy.sh
查看系统通道的顶层策略：

~/repo/c3/channel-policy$ cat artifact/channel-policies.yaml