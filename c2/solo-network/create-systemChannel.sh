#!/bin/bash

configtxgen -outputBlock genesis.block \
-profile SampleInsecureSolo \
#-channelID SysCh #这里取这个系统通道ID非法，会出错，干脆不取了。



#Error creating channelconfig bundle: initializing configtx manager failed: bad channel ID: channel ID 'SysCh' contains illegal characters               
#panic: Error creating channelconfig bundle: initializing configtx manager failed: bad channel ID: channel ID 'SysCh' contains illegal characters 