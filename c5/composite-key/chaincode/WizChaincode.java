package com.hubwiz.demo;

import org.hyperledger.fabric.shim.ChaincodeBase;
import org.hyperledger.fabric.shim.ChaincodeStub;
import org.hyperledger.fabric.shim.ledger.QueryResultsIterator;
import org.hyperledger.fabric.shim.ledger.KeyModification;
import org.hyperledger.fabric.shim.ledger.CompositeKey;
import org.hyperledger.fabric.shim.ledger.KeyValue;

import com.google.protobuf.ByteString;
import org.json.JSONObject;
import org.json.JSONArray;
import java.util.List;

public class WizChaincode extends ChaincodeBase {
  @Override
  public Response init(ChaincodeStub stub){
    System.out.println("--------init--------");
    return newSuccessResponse();
  }
  
  @Override
  public Response invoke(ChaincodeStub stub){
    String fcn = stub.getFunction();
    System.out.format("--------invoke: %s--------\n",fcn);
    List<String> args = stub.getParameters();
    switch(fcn){
      case "registerCar": return registerCar(stub,args);
      case "getCar": return getCar(stub,args);
      case "getCarsByBrand": return getCarsByBrand(stub,args);
    }
    return newErrorResponse("unimplemented method");
  }
  
  private Response registerCar(ChaincodeStub stub,List<String> args){
    if(args.size() != 5) return newErrorResponse("no enough arguments");
        
    JSONObject jo = new JSONObject();
    jo.put("id",args.get(0));
    jo.put("brand",args.get(1));
    jo.put("model",args.get(2));
    jo.put("color",args.get(3));
    jo.put("owner",args.get(4));
    
    stub.putStringState(args.get(0),jo.toString());
    
    CompositeKey key = stub.createCompositeKey("brand->id",args.get(1),args.get(0));
    stub.putStringState(key.toString(),"\u0000");
    
    return newSuccessResponse(String.format("car registered: %s\n",args.get(0)));
  }
  
  private Response getCar(ChaincodeStub stub,List<String> args){
    if(args.size() != 1) return newErrorResponse("arguments mismatch");
    String id = args.get(0);
    
    String carStr = stub.getStringState(id);
    if(carStr == null || carStr.length() == 0) return newErrorResponse(String.format("car not found: %s\n",id));
    return newSuccessResponse(carStr,toBytes(carStr));
  }
  
  private Response getCarsByBrand(ChaincodeStub stub,List<String> args){
    if(args.size() != 1) return newErrorResponse("arguments mismatch");
    String brand = args.get(0);
    
    CompositeKey key = stub.createCompositeKey("brand->id",brand);
    System.out.println("key=>" + key.toString());
    QueryResultsIterator<KeyValue> iterator = stub.getStateByPartialCompositeKey(key.toString());
    JSONArray ja = new JSONArray();
    for(KeyValue kv: iterator){
      CompositeKey fkey = stub.splitCompositeKey(kv.getKey());
      String id = fkey.getAttributes().get(1);
      String carStr = stub.getStringState(id);
      JSONObject jo = new JSONObject(carStr);
	  ja.put(jo);	
    }
    String ret = ja.toString();
    return newSuccessResponse(ret,toBytes(ret));
  }
  
  private byte[] toBytes(String str){
    return ByteString.copyFromUtf8(str).toByteArray();
  }
  
  public static void main(String[] args){
    System.out.println("wizcc");
    new WizChaincode().start(args);
  }
}