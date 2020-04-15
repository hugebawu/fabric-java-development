const shim = require('fabric-shim')

class Chaincode {
  async Init(stub){
    console.log('--------Init--------')
    return shim.success(Buffer.from('cc init'))
  }
  async Invoke(stub){
    console.log('--------Invoke--------')
    return shim.success(Buffer.from('cc invoke'))    
  }
}

shim.start(new Chaincode)