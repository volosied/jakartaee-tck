<%--

    Copyright (c) 2009, 2022 Oracle and/or its affiliates. All rights reserved.

    This program and the accompanying materials are made available under the
    terms of the Eclipse Public License v. 2.0, which is available at
    http://www.eclipse.org/legal/epl-2.0.

    This Source Code may also be made available under the following Secondary
    Licenses when the conditions for such availability set forth in the
    Eclipse Public License v. 2.0 are satisfied: GNU General Public License,
    version 2 with the GNU Classpath Exception, which is available at
    https://www.gnu.org/software/classpath/license.html.

    SPDX-License-Identifier: EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0

--%>

<%@ taglib uri="jakarta.faces.core" prefix="f" %>
<%@ taglib uri="jakarta.faces.html" prefix="h" %>

<%@ include file="include.jsp" %>

<html>
<head>
    <title>encodetest</title>
    <style type="text/css">
        th.sansserif {
            font-family: sans-serif
        }

        td.sansserif {
            font-family: sans-serif
        }
        
        .columnClass {
            font-family: sans-serif
        }
    </style>
</head>

<body>
<f:view>

    <%--
        Table with column level headers and footers
    --%>
    <h:dataTable id="data1" value="#{requestScope.DataList}" var="data1">
        <h:column>
            <f:facet name="header">
                <h:outputText value="Name Header"/>
            </f:facet>
            <h:outputText value="#{data1.name}"/>
        </h:column>
        <h:column>
            <f:facet name="footer">
                <h:outputText value="Gender Footer"/>
            </f:facet>
            <h:outputText value="#{data1.gender}"/>
        </h:column>
        <h:column>
            <f:facet name="header">
                <h:outputText value="Age Header"/>
            </f:facet>
            <f:facet name="footer">
                <h:outputText value="Age Footer"/>
            </f:facet>
            <h:outputText value="#{data1.age}"/>
        </h:column>
    </h:dataTable>
    
     <%--
        Table with column level headers and footers
        with headerClass and footerClass attributes defined
    --%>
    <h:dataTable id="data2" 
                 value="#{requestScope.DataList}" 
                 var="data2"
                 headerClass="sansserif"
                 footerClass="sansserif">
        <h:column>
            <f:facet name="header">
                <h:outputText value="Name Header"/>
            </f:facet>
            <h:outputText value="#{data2.name}"/>
        </h:column>
        <h:column>
            <f:facet name="footer">
                <h:outputText value="Gender Footer"/>
            </f:facet>
            <h:outputText value="#{data2.gender}"/>
        </h:column>
        <h:column>
            <f:facet name="header">
                <h:outputText value="Age Header"/>
            </f:facet>
            <f:facet name="footer">
                <h:outputText value="Age Footer"/>
            </f:facet>
            <h:outputText value="#{data2.age}"/>
        </h:column>
    </h:dataTable>
    
    
     <%--
      validate rendering when footerClass and headerClass are
      specified on both the data table and the column
    --%>
    <h:dataTable id="data3" 
                 value="#{requestScope.DataList}" 
                 var="data3"
                 headerClass="sansserif"
                 footerClass="sansserif">
        <h:column headerClass="columnClass">
            <f:facet name="header">
                <h:outputText value="Name Header"/>
            </f:facet>
            <h:outputText value="#{data3.name}"/>
        </h:column>
        <h:column>
            <f:facet name="footer">
                <h:outputText value="Gender Footer"/>
            </f:facet>
            <h:outputText value="#{data3.gender}"/>
        </h:column>
        <h:column footerClass="columnClass">
            <f:facet name="header">
                <h:outputText value="Age Header"/>
            </f:facet>
            <f:facet name="footer">
                <h:outputText value="Age Footer"/>
            </f:facet>
            <h:outputText value="#{data3.age}"/>
        </h:column>
    </h:dataTable>
    
</f:view>
</body>
</html>
