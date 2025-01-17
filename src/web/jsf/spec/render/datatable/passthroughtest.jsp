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
    <title>passthroughtest</title>
</head>

<body>
<f:view>
    <h:dataTable id="data1"
                 value="#{requestScope.DataList}"
                 var="data1"
                 bgcolor="blue"
                 border="1"
                 cellpadding="1"
                 cellspacing="1"
                 dir="LTR"
                 frame="box"
                 lang="en"
                 onclick="js1"
                 ondblclick="js2"
                 onkeydown="js3"
                 onkeypress="js4"
                 onkeyup="js5"
                 onmousedown="js6"
                 onmousemove="js7"
                 onmouseout="js8"
                 onmouseover="js9"
                 onmouseup="js10"
                 rules="all"
                 style="Color: red;"
                 summary="DataTableSummary"
                 title="DataTableTitle"
                 width="100%">
        <h:column>
            <h:outputText value="#{data1.name}"/>
        </h:column>
        <h:column>
            <h:outputText value="#{data1.gender}"/>
        </h:column>
        <h:column>
            <h:outputText value="#{data1.age}"/>
        </h:column>
    </h:dataTable>
</f:view>

</body>
</html>
