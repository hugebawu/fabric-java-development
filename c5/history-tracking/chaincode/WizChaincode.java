package com.hubwiz.demo;

import org.hyperledger.fabric.shim.ChaincodeBase;
import org.hyperledger.fabric.shim.ChaincodeStub;
import org.hyperledger.fabric.shim.ledger.QueryResultsIterator;
import org.hyperledger.fabric.shim.ledger.KeyModification;

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
    System.out.println("--------invoke--------");
    String fcn = stub.getFunction();
    List<String> args = stub.getParameters();
    System.out.println("===>" + fcn);
    switch(fcn){
      case "createAsset": return createAsset(stub,args);
      case "transferAsset": return transferAsset(stub,args);
      case "getAsset": return getAsset(stub,args);
      case "getAssetHistory": return getAssetHistory(stub,args);
    }
    return newErrorResponse("unimplemented method");
  }
  
  private Response createAsset(ChaincodeStub stub,List<String> args){
    String id = args.get(0);
    String owner = args.get(1);
    String desc = args.get(2);
    
    String assetStr = stub.getStringState(id);
    System.out.println("=> " + assetStr);
    if(assetStr != null && assetStr.length() > 0 ) return newErrorResponse(String.format("asset %s already exists",id));
    JSONObject asset = new JSONObject();
    asset.put("id",id);
    asset.put("owner",owner);
    asset.put("desc",desc);
    stub.putStringState(id,asset.toString());
    return newSuccessResponse(String.format("asset %s created",id));
  }
  
  private Response transferAsset(ChaincodeStub stub,List<String> args){
    String id = args.get(0);
    String newOwner = args.get(1);
    
    String assetStr = stub.getStringState(id);
    if(assetStr == null || assetStr.length() == 0) return newErrorResponse(String.format("asset %s not found",id));
    JSONObject asset = new JSONObject(assetStr);
    asset.put("owner",newOwner);
    stub.putStringState(id,asset.toString());
    return newSuccessResponse(String.format("asset %s updated",id));
  }
  
  private Response getAsset(ChaincodeStub stub,List<String> args){
    String id = args.get(0);
    
    String assetStr = stub.getStringState(id);
    if(assetStr == null || assetStr.length() == 0) return newErrorResponse(String.format("asset %s not found",id));
    return newSuccessResponse(assetStr,ByteString.copyFromUtf8(assetStr).toByteArray());
  }
  
  private Response getAssetHistory(ChaincodeStub stub,List<String> args){
    String id = args.get(0);
    
    JSONArray ja = new JSONArray();
    QueryResultsIterator<KeyModification>  iterator = stub.getHistoryForKey(id);
    for(KeyModification m: iterator){
      System.out.println(m.getTxId());
      JSONObject jo = new JSONObject();
      jo.put("txid",m.getTxId());
      jo.put("value",m.getStringValue());
      jo.put("timestamp",m.getTimeStamp().toString());
      jo.put("deleted",Boolean.valueOf(m.isDeleted()));
      ja.put(jo);
    }
    String str = ja.toString();
    return newSuccessResponse(str,ByteString.copyFromUtf8(str).toByteArray());
  }
  
  public static void main(String[] args){
    System.out.println("wizcc");
    new WizChaincode().start(args);
  }
}