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
    System.out.println("--------invoke--------");
    return newSuccessResponse();
  }
   
  private byte[] toBytes(String str){
    return ByteString.copyFromUtf8(str).toByteArray();
  }
  
  public static void main(String[] args){
    System.out.println("wizcc");
    new WizChaincode().start(args);
  }
}