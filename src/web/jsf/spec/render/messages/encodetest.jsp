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
            .text {background-color: blue;}
            .underline {text-decoration: underline;}
            .class_info {text-decoration: none}
            .class_warn {text-decoration: overline}
            .class_error {text-decoration: line-through}
            .class_fatal {text-decoration: underline}
        </style>
    </head>
    
    <body>
        <f:view>
            <HR size=5 width="95%">
            <font>Test Case: 1</font>
            <h:form id="form1">
                Case_1 ID: 
                <h:inputText id="id1"
                             value="#{Message.id}" 
                             required="true"/>
                Case_1 Severity: 
                <h:inputText id="input1"
                             value="#{Message.severity}" 
                             required="true"/>
                <h:commandButton id="button1" value="Submit"/>
                <h:messages id="message1"
                            showDetail="true"
                            showSummary="true"/>
            </h:form>
            
            <HR size=5 width="95%">
            <font>Test Case: 2</font>
            <h:form id="form2">
                Case_2 ID: 
                <h:inputText id="id2"
                             value="#{Message.id}" 
                             required="true"/>
                Case_2 Severity: 
                <h:inputText id="input2"
                             value="#{Message.severity}" 
                             required="true"/>
                <h:commandButton id="button2" value="Submit"/>
                <h:messages id="message2"
                            styleClass="underline"
                            showDetail="true"
                            showSummary="true"/>
            </h:form>
            
            <HR size=5 width="95%">
            <font>Test Case: 3</font>
            <h:form id="form3">
                Case_3 ID: 
                <h:inputText id="id3"
                             value="#{Message.id}" 
                             required="true"/>
                Case_3 Severity:
                <h:inputText id="input3"
                             value="#{Message.severity}" 
                             required="true"/>
                <h:commandButton id="button3" value="Submit"/>
                <h:messages id="message3"
                            infoStyle="Color: blue;"
                            infoClass="underline"
                            showDetail="true"
                            showSummary="true"/>
            </h:form>
            
            <HR size=5 width="95%">
            <font>Test Case: 4</font>
            <h:form id="form4">
                Case_4 ID:
                <h:inputText id="id4" 
                             value="#{Message.id}" 
                             required="true"/>
                Case_4 Severity: 
                <h:inputText id="input4" 
                             value="#{Message.severity}"
                             required="true"/>
                <h:commandButton id="button4" value="Submit"/>
                <h:messages id="message4"
                            warnStyle="Color: green;"
                            warnClass="underline"
                            showDetail="true"
                            showSummary="true"/>
            </h:form>
            
            <HR size=5 width="95%">
            <font>Test Case: 5</font>
            <h:form id="form5">
                Case_5 ID:
                <h:inputText id="id5" 
                             value="#{Message.id}" 
                             required="true"/>
                Case_5 Severity: 
                <h:inputText id="input5" 
                             value="#{Message.severity}"
                             required="true"/>
                <h:commandButton id="button5" value="Submit"/>
                <h:messages id="message5"
                            errorStyle="Color: yellow;"
                            errorClass="underline"
                            showDetail="true"
                            showSummary="true"/>
            </h:form>
            
            <HR size=5 width="95%">
            <font>Test Case: 6</font>
            <h:form id="form6">
                Case_6 ID:
                <h:inputText id="id6" 
                             value="#{Message.id}" 
                             required="true"/>
                Case_6 Severity: 
                <h:inputText id="input6" 
                             value="#{Message.severity}"
                             required="true"/>
                <h:commandButton id="button6" value="Submit"/>
                <h:messages id="message6"
                            fatalStyle="Color: red;"
                            fatalClass="underline"
                            showDetail="true"
                            showSummary="true"/>
            </h:form>
            
            <HR size=5 width="95%">
            <font>Test Case: 7</font>
            <h:form id="form7">
                Case_7 ID: 
                <h:inputText id="id7"
                             value="#{Message.id}" 
                             required="true"/>
                Case_7 Severity: 
                <h:inputText id="severity7"
                             value="#{Message.severity}" 
                             required="true"/>
                <h:commandButton id="button7" value="Submit"/>
                <h:messages id="message7"
                            infoStyle="Color: blue;"
                            warnStyle="Color: green;"
                            errorStyle="Color: yellow;" 
                            fatalStyle="Color: red;"/>
            </h:form>
            
            <HR size=5 width="95%">
            <font>Test Case: 8</font>
            <h:form id="form8">
                Case_8 ID: 
                <h:inputText id="id8"
                             value="#{Message.id}" 
                             required="true"/>
                Case_8 Severity: 
                <h:inputText id="severity8"
                             value="#{Message.severity}" 
                             required="true"/>
                <h:commandButton id="button8" value="Submit"/>
                <h:messages id="message8"
                            infoClass="class_info"
                            warnClass="class_warn"
                            errorClass="class_error" 
                            fatalClass="class_fatal"/>
            </h:form>
            
            <HR size=5 width="95%">
            <font>Test Case: 9</font>
            <h:form id="form9">
                Case_9 ID: 
                <h:inputText id="id9"
                             value="#{Message.id}" 
                             required="true"/>
                Case_9 Severity: 
                <h:inputText id="severity9"
                             value="#{Message.severity}" 
                             required="true"/>
                <h:commandButton id="button9" value="Submit"/>
                <h:messages id="message9"
                            showSummary="true"
                            showDetail="false"/>
            </h:form>
            
            <HR size=5 width="95%">
            <font>Test Case: 10</font>
            <h:form id="form10">
                Case_10 ID: 
                <h:inputText id="id10"
                             value="#{Message.id}" 
                             required="true"/>
                Case_10 Severity: 
                <h:inputText id="severity10"
                             value="#{Message.severity}" 
                             required="true"/>
                <h:commandButton id="button10" value="Submit"/>
                <h:messages id="message10"
                            showSummary="false"
                            showDetail="true"/>
            </h:form> 
            
            <HR size=5 width="95%">
            <font>Test Case: 11</font>
            <h:form id="form11">
                Case_11 ID: 
                <h:inputText id="id11"
                             value="#{Message.id}" 
                             required="true"/>
                Case_11 Severity: 
                <h:inputText id="severity11"
                             value="#{Message.severity}" 
                             required="true"/>
                <h:commandButton id="button11" value="Submit"/>
                <h:messages id="message11"
                            showSummary="false"
                            showDetail="false"/>
            </h:form>
            
            <HR size=5 width="95%">
            <font>Test Case: 12</font>
            <h:form id="form12">
                Case_12 ID: 
                <h:inputText id="id12"
                             value="#{Message.id}" 
                             required="true"/>
                Case_12 Severity: 
                <h:inputText id="input12"
                             value="#{Message.severity}" 
                             required="true"/>
                <h:commandButton id="button12" value="Submit"/>
                <h:messages id="message12"
                            layout="table"
                            showDetail="true"
                            showSummary="true"/>
            </h:form>
            
            <HR size=5 width="95%">
            <font>Test Case: 13</font>
            <h:form id="form13">
                Case_13 ID: 
                <h:inputText id="id13"
                             value="#{Message.id}" 
                             required="true"/>
                Case_13 Severity: 
                <h:inputText id="input13"
                             value="#{Message.severity}" 
                             required="true"/>
                <h:commandButton id="button13" value="Submit"/>
                <h:messages id="message13"
                            layout="table"
                            styleClass="underline"
                            showDetail="true"
                            showSummary="true"/>
            </h:form>  
            
            <HR size=5 width="95%">
            <font>Test Case: 14</font>
            <h:form id="form14">
                Case_14 ID: 
                <h:inputText id="id14"
                             value="#{Message.id}" 
                             required="true"/>
                Case_14 Severity:
                <h:inputText id="input14"
                             value="#{Message.severity}" 
                             required="true"/>
                <h:commandButton id="button14" value="Submit"/>
                <h:messages id="message14"
                            layout="table"
                            showDetail="false"
                            showSummary="true"/>
            </h:form>
            
            <HR size=5 width="95%">
            <font>Test Case: 15</font>
            <h:form id="form15">
                Case_15 ID: 
                <h:inputText id="id15"
                             value="#{Message.id}" 
                             required="true"/>
                Case_15 Severity:
                <h:inputText id="input15"
                             value="#{Message.severity}" 
                             required="true"/>
                <h:commandButton id="button15" value="Submit"/>
                <h:messages id="message15"
                            layout="table"
                            showDetail="true"
                            showSummary="false"/>
            </h:form>
            
            <HR size=5 width="95%">
            <font>Test Case: 16</font>
            <h:form id="form16">
                Case_16 ID:
                <h:inputText id="id16" 
                             value="#{Message.id}" 
                             required="true"/>
                Case_16 Severity: 
                <h:inputText id="input16" 
                             value="#{Message.severity}"
                             required="true"/>
                <h:commandButton id="button16" value="Submit"/>
                <h:messages id="message16"
                            layout="table"
                            showDetail="false"
                            showSummary="false"/>
            </h:form>
   
        </f:view>
    </body>
</html>
