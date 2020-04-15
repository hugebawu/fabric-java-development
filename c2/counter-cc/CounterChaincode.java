package com.hubwiz.demo;

import java.util.List;
import org.hyperledger.fabric.shim.ChaincodeBase;
import org.hyperledger.fabric.shim.ChaincodeStub;
import com.google.protobuf.ByteString;

public class CounterChaincode extends ChaincodeBase{
  @Override
  public Response init(ChaincodeStub stub){
    System.out.println("--------init--------");
    stub.putStringState("value","0");
    return newSuccessResponse("init");
  }
  @Override
  public Response invoke(ChaincodeStub stub){
    System.out.println("--------invoke--------");
    String fcn = stub.getFunction();
    List<String> args = stub.getParameters();
    System.out.format("fcn => %s",fcn);
    switch(fcn){
      case "inc": return inc(stub,args);
      case "reset": return reset(stub,args);
      case "value": return value(stub,args);
    }
    return newErrorResponse("unimplemented method => " + fcn);
  }
  
  private Response inc(ChaincodeStub stub, List<String> args){
    int step = 1;
    if(args.size() > 0 ) step = Integer.parseInt(args.get(0));
    String valueStr = stub.getStringState("value");
    int value = Integer.parseInt(valueStr);
    value += step;
    stub.putStringState("value",Integer.toString(value));
    return newSuccessResponse(String.format("updated => %d",value));
  }
  
  private Response reset(ChaincodeStub stub, List<String> args){
    stub.putStringState("value","0");
    return newSuccessResponse("reset to zero");
  }
  
  private Response value(ChaincodeStub stub, List<String> args){
    String value = stub.getStringState("value");
    return newSuccessResponse(value,ByteString.copyFromUtf8(value).toByteArray());
  }
  
  public static void main(String[] args){
    System.out.format("hello I am chaincode. Nice to meet you\n");
    new CounterChaincode().start(args);
  }
}