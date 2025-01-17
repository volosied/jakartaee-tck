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

<html>
<head>
    <title>encodetest</title>
    <style type="text/css">
        caption.sansserif {
            font-family: sans-serif
        }        
    </style>
</head>

<body>
<f:view>
    
    <%--
        Table with Caption 
    --%>
    <h:panelGrid id="grid1" columns="3" > 
        <f:facet name="caption" >
            <h:outputText value="Caption Text For Grid1"/>
        </f:facet>
        <f:facet name="header">
            <h:outputText value="Header Text For Grid1"/>
        </f:facet>
        <h:column>
            <h:outputText value="3"/>
        </h:column>
        <h:column>
            <h:outputText value="7"/>
        </h:column>
        <h:column>
            <h:outputText value="31"/>
        </h:column>
        <h:column>
            <h:outputText value="127"/>
        </h:column>
        <h:column>
            <h:outputText value="8191"/>
        </h:column>
        <h:column>
            <h:outputText value="131071"/>
        </h:column>
        <f:facet name="footer">
            <h:outputText value="Footer Text For Grid1"/>
        </f:facet>
    </h:panelGrid>    

    <h:panelGrid id="grid2" columns="2" captionStyle="Color: red;" > 
        <f:facet name="caption" >
            <h:outputText value="Caption Text For Grid2"/>
        </f:facet>
        <f:facet name="header">
            <h:outputText value="Header Text For Grid2"/>
        </f:facet>
        <h:column>
            <h:outputText value="3"/>
        </h:column>
        <h:column>
            <h:outputText value="7"/>
        </h:column>
        <h:column>
            <h:outputText value="31"/>
        </h:column>
        <h:column>
            <h:outputText value="127"/>
        </h:column>
        <h:column>
            <h:outputText value="8191"/>
        </h:column>
        <h:column>
            <h:outputText value="131071"/>
        </h:column>
        <f:facet name="footer">
            <h:outputText value="Footer Text For Grid2"/>
        </f:facet>
    </h:panelGrid>    

    <h:panelGrid id="grid3" columns="3" captionClass="sansserif" > 
        <f:facet name="caption" >
            <h:outputText value="Caption Text For Grid3"/>
        </f:facet>
        <f:facet name="header">
            <h:outputText value="Header Text For Grid3"/>
        </f:facet>
        <h:column>
            <h:outputText value="3"/>
        </h:column>
        <h:column>
            <h:outputText value="7"/>
        </h:column>
        <h:column>
            <h:outputText value="31"/>
        </h:column>
        <h:column>
            <h:outputText value="127"/>
        </h:column>
        <h:column>
            <h:outputText value="8191"/>
        </h:column>
        <h:column>
            <h:outputText value="131071"/>
        </h:column>
        <f:facet name="footer">
            <h:outputText value="Footer Text For Grid3"/>
        </f:facet>
    </h:panelGrid>    

    <h:panelGrid id="grid4" columns="2" 
                            captionStyle="Color: red;" 
                            captionClass="sansserif" > 
        <f:facet name="caption" >
            <h:outputText value="Caption Text For Grid4"/>
        </f:facet>
        <f:facet name="header">
            <h:outputText value="Header Text For Grid4"/>
        </f:facet>
        <h:column>
            <h:outputText value="3"/>
        </h:column>
        <h:column>
            <h:outputText value="7"/>
        </h:column>
        <h:column>
            <h:outputText value="31"/>
        </h:column>
        <h:column>
            <h:outputText value="127"/>
        </h:column>
        <h:column>
            <h:outputText value="8191"/>
        </h:column>
        <h:column>
            <h:outputText value="131071"/>
        </h:column>
        <f:facet name="footer">
            <h:outputText value="Footer Text For Grid4"/>
        </f:facet>
    </h:panelGrid>    

</f:view>
</body>
</html>
