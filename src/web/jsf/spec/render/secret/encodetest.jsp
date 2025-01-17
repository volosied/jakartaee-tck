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
        .secret {
            background-color: blue;
        }
    </style>
</head>

<body>
<f:view>
    <h:form id="form">
        <h:inputSecret id="secret1" value="secret value"/>
        <h:inputSecret id="secret2"
                       value="secret value"
                       redisplay="true"/>
        <h:inputSecret id="secret3"
                       value="secret value"
                       styleClass="secret"
                       redisplay="false"/>
        <h:inputSecret id="secret4"
                       value="secret value"
                       autocomplete="off"/>
        <h:inputSecret id="secret5"
                       value="secret value"
                       autocomplete="on"/>
        <h:inputSecret id="secret6"
                       value="value"
                       disabled="true"/>
        <h:inputSecret id="secret7"
                       value="value"
                       disabled="false"/>
        <h:inputSecret id="secret8"
                       value="value"
                       readonly="true"/>
        <h:inputSecret id="secret9"
                       value="value"
                       readonly="false"/>
    </h:form>
</f:view>
</body>
</html>
