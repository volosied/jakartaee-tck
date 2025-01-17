/*
 * Copyright (c) 2009, 2020 Oracle and/or its affiliates. All rights reserved.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse Public License v. 2.0, which is available at
 * http://www.eclipse.org/legal/epl-2.0.
 *
 * This Source Code may also be made available under the following Secondary
 * Licenses when the conditions for such availability set forth in the
 * Eclipse Public License v. 2.0 are satisfied: GNU General Public License,
 * version 2 with the GNU Classpath Exception, which is available at
 * https://www.gnu.org/software/classpath/license.html.
 *
 * SPDX-License-Identifier: EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0
 */

/*
 * $Id$
 */

package com.sun.ts.tests.jsf.api.jakarta_faces.component.uiselectboolean;

import java.io.IOException;
import java.io.PrintWriter;

import com.sun.ts.tests.jsf.api.jakarta_faces.component.common.BufferedResponseWrapper;
import com.sun.ts.tests.jsf.api.jakarta_faces.component.common.TCKValidator;
import com.sun.ts.tests.jsf.api.jakarta_faces.component.common.TCKValueChangeListener;
import com.sun.ts.tests.jsf.common.util.JSFTestUtil;

import jakarta.el.ExpressionFactory;
import jakarta.el.ValueExpression;
import jakarta.faces.component.UIComponent;
import jakarta.faces.component.UIComponentBase;
import jakarta.faces.component.UIInput;
import jakarta.faces.component.UISelectBoolean;
import jakarta.faces.component.UIViewRoot;
import jakarta.faces.context.FacesContext;
import jakarta.el.MethodExpression;
import jakarta.faces.event.MethodExpressionValueChangeListener;
import jakarta.faces.validator.MethodExpressionValidator;
import jakarta.faces.event.PhaseId;
import jakarta.faces.event.ValueChangeEvent;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TestServlet
    extends com.sun.ts.tests.jsf.api.jakarta_faces.component.uiinput.TestServlet {

  /**
   * <p>
   * Initializes this {@link jakarta.servlet.Servlet}.
   * </p>
   * 
   * @param config
   *          this Servlet's configuration
   * @throws ServletException
   *           if an error occurs
   */
  @Override
  public void init(ServletConfig config) throws ServletException {
    super.init(config);
    setRendererType("jakarta.faces.Checkbox");
  }

  /**
   * <p>
   * Creates a new {@link UIComponent} instance.
   * </p>
   * 
   * @return a new {@link UIComponent} instance.
   */
  @Override
  protected UIComponentBase createComponent() {
    return new UISelectBoolean();
  }

  // ------------------------------------------- Test Methods ----

  @Override
  public void uiComponentGetSetValueExpressionTest(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {

    BufferedResponseWrapper wrapper = new BufferedResponseWrapper(response);

    super.uiComponentGetSetValueExpressionTest(request, wrapper);
    String result = wrapper.getBufferedWriter().toString();

    PrintWriter out = response.getWriter();

    if (result.indexOf(JSFTestUtil.PASS) == -1) {
      out.println(result);
      return;
    }

    // default processing of get,setValueExpression is ok, now validate
    // processing specific to UIGraphic
    request.setAttribute("value", "selectedValue");

    ExpressionFactory factory = JSFTestUtil
        .getExpressionFactory(servletContext);
    ValueExpression expression = factory.createValueExpression(
        getFacesContext().getELContext(), "#{requestScope.value}",
        java.lang.String.class);

    UISelectBoolean selBoolean = (UISelectBoolean) createComponent();

    selBoolean.setValueExpression("selected", expression);

    if (!"selectedValue".equals(selBoolean.getValue())) {
      out.println(
          JSFTestUtil.FAIL + " setValueExpression() with a key of 'selected'"
              + " didn't set the ValueExpression provided as the value"
              + " of the component.");
      out.println("Expected: " + expression);
      out.println("Received: " + selBoolean.getValue());
      return;
    }

    out.println(JSFTestUtil.PASS);

  }

  // Test event queuing and broadcasting (any phase listeners)
  @Override
  public void uiInputBroadcastTest(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {

    PrintWriter out = response.getWriter();
    FacesContext facesContext = getFacesContext();
    UIInput input = (UIInput) createComponent();
    input.setRendererType(null);
    UIViewRoot root = facesContext.getApplication().getViewHandler()
        .createView(facesContext, "/root");
    root.getChildren().add(input);
    ValueChangeEvent event = new ValueChangeEvent(input, null, null);
    event.setPhaseId(PhaseId.PROCESS_VALIDATIONS);

    // Register three listeners
    input.addValueChangeListener(new TCKValueChangeListener("AP0"));
    input.addValueChangeListener(new TCKValueChangeListener("AP1"));
    input.addValueChangeListener(new TCKValueChangeListener("AP2"));

    // Fire events and evaluate results
    TCKValueChangeListener.trace(null);
    input.queueEvent(event);
    root.processDecodes(facesContext);
    root.processValidators(facesContext);
    root.processApplication(facesContext);
    String trace = TCKValueChangeListener.trace();
    String expectedTrace = "/AP0@PROCESS_VALIDATIONS/AP1@PROCESS_VALIDATIONS/AP2@PROCESS_VALIDATIONS";
    if (!expectedTrace.equals(trace)) {
      out.println(JSFTestUtil.FAIL + " Unexpected listener trace.");
      out.println("Expected trace: " + expectedTrace);
      out.println("Trace received: " + trace);
      return;
    }

    out.println(JSFTestUtil.PASS);
  }

  @Override
  public void uiInputBroadcastValueChangeListenerTest(
      HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    FacesContext facesContext = getFacesContext();
    UIInput input = (UIInput) createComponent();
    input.setRendererType(null);
    UIViewRoot root = new UIViewRoot();
    root.getChildren().add(input);

    TCKValueChangeListener listener = new TCKValueChangeListener("VCLR");

    MethodExpression binding = getApplication().getExpressionFactory().createMethodExpression(
      facesContext.getELContext(), "#{requestScope.reqVCL.processValueChange}", null, 
        new Class[] { ValueChangeEvent.class });
    MethodExpressionValueChangeListener lnr = new MethodExpressionValueChangeListener(binding);

    request.setAttribute("reqVCL", listener);
    input.addValueChangeListener(lnr);

    ValueChangeEvent event = new ValueChangeEvent(input, null, null);
    event.setPhaseId(PhaseId.PROCESS_VALIDATIONS);
    TCKValueChangeListener.trace(null);
    input.queueEvent(event);
    root.processDecodes(facesContext);
    root.processValidators(facesContext);
    root.processApplication(facesContext);

    String trace = TCKValueChangeListener.trace();

    if (trace.length() == 0) {
      out.println(JSFTestUtil.FAIL + " The ValueChangeListener as referenced"
          + " by ValueChangeListenerRef 'requestScope.reqVCL.processValueChange'"
          + " was not invoked.");
      return;
    }

    if (!"/VCLR@PROCESS_VALIDATIONS".equals(trace)) {
      out.println(JSFTestUtil.FAIL + " Unexpected Listener trace.");
      out.println("Expected: /VCLR@PROCESS_VALIDATIONS");
      out.println("Received: " + trace);
      return;
    }

    out.println(JSFTestUtil.PASS);
  }

  @Override
  public void uiInputValidate3aTest(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    UIInput input = (UIInput) createComponent();
    FacesContext context = getFacesContext();
    UIViewRoot root = getApplication().getViewHandler().createView(context,
        "/root");
    context.setViewRoot(root);
    root.getChildren().add(input);

    // Verify that a UIInput instance that has a local value,
    // and the valid property is true all validators associated
    // with the component are invoked, if the component is marked
    // invalid by a validator, no listener is invoked.
    input.setSubmittedValue("previous");
    input.setRendererType(null);

    // Setup the validators
    TCKValidator validator1 = new TCKValidator("VL1", false);
    TCKValidator validator2 = new TCKValidator("VL2", true);

    input.addValidator(validator1);
    request.setAttribute("TCKValidator", validator2);

    MethodExpression binding = getApplication().getExpressionFactory().createMethodExpression(
      context.getELContext(), "#{requestScope.TCKValidator.validate}", null, 
        new Class[] { FacesContext.class, UIComponent.class, Object.class });
    MethodExpressionValidator validator = new MethodExpressionValidator(binding);

    input.addValidator(validator);

    // Setup the listeners
    TCKValueChangeListener listener = new TCKValueChangeListener("VCL1");

    input.addValueChangeListener(listener);
    input.setSubmittedValue("new-value");

    TCKValueChangeListener.trace(null);
    TCKValidator.clearTrace();

    root.processValidators(context);

    String valTrace = TCKValidator.getTrace();
    if (!"/VL1/VL2".equals(valTrace)) {
      out.println(JSFTestUtil.FAIL + " Validator trace did not return as "
          + "expected.");
      out.println("Traced expected: /VL1/VL2");
      out.println("Trace received: " + valTrace);
      return;
    }

    String listenerTrace = TCKValueChangeListener.trace();
    if (listenerTrace.length() != 0) {
      out.println(JSFTestUtil.FAIL + " ValueChangeListener was incorrectly"
          + " invoked after a Validator marked the component as invalid.");
      return;
    }
    out.println(JSFTestUtil.PASS);
  }

  @Override
  public void uiInputValidate3bTest(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    UIInput input = (UIInput) createComponent();
    FacesContext context = getFacesContext();
    UIViewRoot root = getApplication().getViewHandler().createView(context,
        "/root");
    context.setViewRoot(root);
    root.getChildren().add(input);

    // Verify that a UIInput instance that has a local value,
    // and the valid property is true all validators associated
    // with the component are invoked, if the component is marked
    // invalid by a validator, no listener is invoked.
    input.setSubmittedValue("previous");
    input.setRendererType(null);

    // Setup the validators
    TCKValidator validator1 = new TCKValidator("VL1", false);
    TCKValidator validator2 = new TCKValidator("VL2", true);

    input.addValidator(validator1);
    request.setAttribute("TCKValidator", validator2);

    MethodExpression binding = getApplication().getExpressionFactory().createMethodExpression(
      context.getELContext(), "#{requestScope.TCKValidator.validate}", null, 
        new Class[] { FacesContext.class, UIComponent.class, Object.class });
    MethodExpressionValidator validator = new MethodExpressionValidator(binding);

    input.addValidator(validator);

    // Setup the listeners
    TCKValueChangeListener listener = new TCKValueChangeListener("VCL1");

    input.addValueChangeListener(listener);
    input.setSubmittedValue("new-value");

    TCKValueChangeListener.trace(null);
    TCKValidator.clearTrace();

    // Next, all validators succeed, and the value differs from the previous.
    // ensure the listener was invoked.
    validator2.markInvalid(false);
    TCKValueChangeListener.trace(null);
    TCKValidator.clearTrace();
    input.setValid(true);

    root.processValidators(context);

    String valTrace = TCKValidator.getTrace();
    if (!"/VL1/VL2".equals(valTrace)) {
      out.println(JSFTestUtil.FAIL + " Validator trace did not return as "
          + "expected.");
      out.println("Traced expected: /VL1/VL2");
      out.println("Trace received: " + valTrace);
      return;
    }

    String listenerTrace = TCKValueChangeListener.trace();
    if (!"/VCL1@ANY_PHASE".equals(listenerTrace)) {
      out.println(JSFTestUtil.FAIL + " Unexpected listener trace.");
      out.println("Expected: /VCL1@ANY_PHASE");
      out.println("Received: " + listenerTrace);
      return;
    }

    out.println(JSFTestUtil.PASS);
  }

  @Override
  public void uiInputValidate3cTest(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    UIInput input = (UIInput) createComponent();
    FacesContext context = getFacesContext();
    UIViewRoot root = getApplication().getViewHandler().createView(context,
        "/root");
    context.setViewRoot(root);
    root.getChildren().add(input);

    // Verify that a UIInput instance that has a local value,
    // and the valid property is true all validators associated
    // with the component are invoked, if the component is marked
    // invalid by a validator, no listener is invoked.
    input.setSubmittedValue("previous");
    input.setRendererType(null);

    // Setup the validators
    TCKValidator validator1 = new TCKValidator("VL1", false);
    TCKValidator validator2 = new TCKValidator("VL2", true);

    input.addValidator(validator1);
    request.setAttribute("TCKValidator", validator2);

    MethodExpression binding = getApplication().getExpressionFactory().createMethodExpression(
      context.getELContext(), "#{requestScope.TCKValidator.validate}", null, 
        new Class[] { FacesContext.class, UIComponent.class, Object.class });
    MethodExpressionValidator validator = new MethodExpressionValidator(binding);

    input.addValidator(validator);

    // Setup the listeners
    TCKValueChangeListener listener = new TCKValueChangeListener("VCL1");

    input.addValueChangeListener(listener);
    input.setSubmittedValue("new-value");

    TCKValueChangeListener.trace(null);
    TCKValidator.clearTrace();

    // If the new and previous values do not differ,
    // the listener will not be invoked.
    input.setSubmittedValue("value");
    input.setValue("value");
    TCKValueChangeListener.trace(null);
    TCKValidator.clearTrace();

    root.processValidators(context);

    String valTrace = TCKValidator.getTrace();
    if (!"/VL1/VL2".equals(valTrace)) {
      out.println(
          "Test FAILED[3].  Validator trace did not return as " + "expected.");
      out.println("Traced expected: /VL1/VL2");
      out.println("Trace received: " + valTrace);
      return;
    }

    String listenerTrace = TCKValueChangeListener.trace();
    if (listenerTrace.length() != 0) {
      out.println("Test FAILED[3].  ValueChangeListener was incorrectly"
          + " invoked after a Validator marked the component as invalid.");
      return;
    }

    out.println(JSFTestUtil.PASS);
  }

  // ---------------- UISelectBoolean Tests

  public void uiSelectBooleanIsSetSelectedTest(HttpServletRequest request,
      HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    UISelectBoolean select = (UISelectBoolean) createComponent();
    boolean value = true;
    select.setSelected(value);
    boolean result = select.isSelected();

    if (!result) {
      out.println(
          JSFTestUtil.FAIL + " UISelectBoolean.isselected() didn't return"
              + " the value as set by UISelectBoolean.setSelected().");
      out.println("Expected: " + value);
      out.println("Received: " + result);
      return;
    }

    out.println(JSFTestUtil.PASS);

  } // uiSelectBooleanIsSetSelectedTest
}
