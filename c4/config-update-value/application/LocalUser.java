package com.hubwiz.demo;

import org.hyperledger.fabric.sdk.User;
import org.hyperledger.fabric.sdk.Enrollment;
import org.hyperledger.fabric.sdk.security.CryptoSuite;
import org.hyperledger.fabric.sdk.security.CryptoPrimitives;
import org.hyperledger.fabric.sdk.identity.X509Enrollment;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Set;
import java.security.PrivateKey;

public class LocalUser implements User{
  private String name;
  private String mspid;
  private Enrollment enrollment;
  
  LocalUser(String name,String mspid,String keyFile,String certFile) throws Exception{
    this.name = name;
    this.mspid = mspid;
    this.enrollment = getEnrollment(keyFile,certFile);
  }
  
  private Enrollment getEnrollment(String keyFile,String certFile) throws Exception{
    byte[] keyPem = Files.readAllBytes(Paths.get(keyFile));
    byte[] certPem = Files.readAllBytes(Paths.get(certFile));
    CryptoPrimitives suite = new CryptoPrimitives();
    PrivateKey privateKey = suite.bytesToPrivateKey(keyPem);
    return new X509Enrollment(privateKey,new String(certPem));
  }
  
  @Override
  public String getName(){
    return name;
  }
  
  @Override
  public Set<String> getRoles(){
    return null;
  }  
  
  @Override  
  public String getAccount(){
    return null;
  }
  
  @Override  
  public String getAffiliation(){
    return null;
  }
  
  @Override  
  public Enrollment getEnrollment(){
    return enrollment;
  }
  
  @Override
  public String getMspId(){
    return mspid;
  }
  
}