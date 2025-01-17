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
            hr {
                border: 0;
                width: 90%;
                color: #990033;
                background-color: #990033;
                height: 5px;
            }
        </style>
    </head>
    
    <body>
        <f:view>
            <hr>
            <h:outputLabel for="form1" value="Test Case: 1" />
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
                <h:message for="form1:input1" 
                           id="message1"
                           showDetail="true"
                           showSummary="true"/>
            </h:form>
            
            <hr>
            <h:outputLabel for="form2" value="Test Case: 2" />
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
                <h:message for="form2:input2" 
                           id="message2"
                           style="Color: red;"
                           styleClass="underline"
                           showDetail="true"
                           showSummary="true"/>
            </h:form>
            
            <hr>
            <h:outputLabel for="form3" value="Test Case: 3" />
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
                <h:message for="form3:input3" 
                           id="message3"
                           infoStyle="Color: blue;"
                           infoClass="underline"
                           showDetail="true"
                           showSummary="true"/>
            </h:form>
            
            <hr>
            <h:outputLabel for="form4" value="Test Case: 4" />
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
                <h:message for="form4:input4" 
                           id="message4"
                           warnStyle="Color: green;"
                           warnClass="underline"
                           showDetail="true"
                           showSummary="true"/>
            </h:form>
            
            <hr>
            <h:outputLabel for="form5" value="Test Case: 5" />
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
                <h:message for="form5:input5" 
                           id="message5"
                           errorStyle="Color: yellow;"
                           errorClass="underline"
                           showDetail="true"
                           showSummary="true"/>
            </h:form>
            
            <hr>
            <h:outputLabel for="form6" value="Test Case: 6" />
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
                <h:message for="form6:input6" 
                           id="message6"
                           fatalStyle="Color: red;"
                           fatalClass="underline"
                           showDetail="true"
                           showSummary="true"/>
            </h:form>
            
            <hr>
            <h:outputLabel for="form7" value="Test Case: 7" />
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
                <h:message for="form7:severity7" id="message7"
                           dir="LTR"                   
                           lang="en"
                           infoStyle="Color: blue;"
                           warnStyle="Color: green;"
                           errorStyle="Color: yellow;" 
                           fatalStyle="Color: red;"/>
            </h:form>
            
            <hr>
            <h:outputLabel for="form8" value="Test Case: 8" />
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
                <h:message for="form8:severity8" id="message8"
                           dir="LTR"                   
                           lang="en"
                           infoClass="class_info"
                           warnClass="class_warn"
                           errorClass="class_error" 
                           fatalClass="class_fatal"/>
            </h:form>
            
            <hr>
            <h:outputLabel for="form9" value="Test Case: 9" />
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
                <h:message for="form9:severity9" id="message9"
                           dir="LTR"                   
                           lang="en"
                           showSummary="true"
                           showDetail="true"/>
            </h:form>
            
            <hr>
            <h:outputLabel for="form10" value="Test Case: 10" />
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
                <h:message for="form10:severity10" id="message10"
                           dir="LTR"                   
                           lang="en"
                           showSummary="true"
                           showDetail="false"/>
            </h:form>
            
            <hr>
            <h:outputLabel for="form11" value="Test Case: 11" />
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
                <h:message for="form11:severity11" id="message11"
                           dir="LTR"                   
                           lang="en"
                           showSummary="false"
                           showDetail="true"/>
            </h:form> 
            
            <hr>
            <h:outputLabel for="form12" value="Test Case: 12" />
            <h:form id="form12">
                Case_12 ID: 
                <h:inputText id="id12"
                             value="#{Message.id}" 
                             required="true"/>
                Case_12 Severity: 
                <h:inputText id="severity12"
                             value="#{Message.severity}" 
                             required="true"/>
                <h:commandButton id="button12" value="Submit"/>
                <h:message for="form12:severity12" id="message12"
                           dir="LTR"                   
                           lang="en"
                           showSummary="false"
                           showDetail="false"/>
            </h:form>
        </f:view>
    </body>
</html>
