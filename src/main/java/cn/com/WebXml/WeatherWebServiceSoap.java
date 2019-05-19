/**
 * WeatherWebServiceSoap.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package cn.com.WebXml;

public interface WeatherWebServiceSoap extends java.rmi.Remote {

    /**

     */
    public java.lang.String[] getSupportCity(java.lang.String byProvinceName) throws java.rmi.RemoteException;

    /**

     */
    public java.lang.String[] getSupportProvince() throws java.rmi.RemoteException;

    /**

     */
    public cn.com.WebXml.GetSupportDataSetResponseGetSupportDataSetResult getSupportDataSet() throws java.rmi.RemoteException;

    /**

     */
    public java.lang.String[] getWeatherbyCityName(java.lang.String theCityName) throws java.rmi.RemoteException;

    /**

     */
    public java.lang.String[] getWeatherbyCityNamePro(java.lang.String theCityName, java.lang.String theUserID) throws java.rmi.RemoteException;
}
