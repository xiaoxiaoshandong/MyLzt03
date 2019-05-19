/**
 * WeatherWebService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package cn.com.WebXml;

public interface WeatherWebService extends javax.xml.rpc.Service {

/**

 */
    public java.lang.String getWeatherWebServiceSoapAddress();

    public cn.com.WebXml.WeatherWebServiceSoap getWeatherWebServiceSoap() throws javax.xml.rpc.ServiceException;

    public cn.com.WebXml.WeatherWebServiceSoap getWeatherWebServiceSoap(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
