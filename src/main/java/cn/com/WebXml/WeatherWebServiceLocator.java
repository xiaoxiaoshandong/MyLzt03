/**
 * WeatherWebServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package cn.com.WebXml;

public class WeatherWebServiceLocator extends org.apache.axis.client.Service implements cn.com.WebXml.WeatherWebService {

/**

 */

    public WeatherWebServiceLocator() {
    }


    public WeatherWebServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public WeatherWebServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for WeatherWebServiceSoap
    private java.lang.String WeatherWebServiceSoap_address = "http://www.webxml.com.cn/WebServices/WeatherWebService.asmx";

    public java.lang.String getWeatherWebServiceSoapAddress() {
        return WeatherWebServiceSoap_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String WeatherWebServiceSoapWSDDServiceName = "WeatherWebServiceSoap";

    public java.lang.String getWeatherWebServiceSoapWSDDServiceName() {
        return WeatherWebServiceSoapWSDDServiceName;
    }

    public void setWeatherWebServiceSoapWSDDServiceName(java.lang.String name) {
        WeatherWebServiceSoapWSDDServiceName = name;
    }

    public cn.com.WebXml.WeatherWebServiceSoap getWeatherWebServiceSoap() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(WeatherWebServiceSoap_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getWeatherWebServiceSoap(endpoint);
    }

    public cn.com.WebXml.WeatherWebServiceSoap getWeatherWebServiceSoap(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            cn.com.WebXml.WeatherWebServiceSoapStub _stub = new cn.com.WebXml.WeatherWebServiceSoapStub(portAddress, this);
            _stub.setPortName(getWeatherWebServiceSoapWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setWeatherWebServiceSoapEndpointAddress(java.lang.String address) {
        WeatherWebServiceSoap_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (cn.com.WebXml.WeatherWebServiceSoap.class.isAssignableFrom(serviceEndpointInterface)) {
                cn.com.WebXml.WeatherWebServiceSoapStub _stub = new cn.com.WebXml.WeatherWebServiceSoapStub(new java.net.URL(WeatherWebServiceSoap_address), this);
                _stub.setPortName(getWeatherWebServiceSoapWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("WeatherWebServiceSoap".equals(inputPortName)) {
            return getWeatherWebServiceSoap();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://WebXml.com.cn/", "WeatherWebService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://WebXml.com.cn/", "WeatherWebServiceSoap"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("WeatherWebServiceSoap".equals(portName)) {
            setWeatherWebServiceSoapEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
