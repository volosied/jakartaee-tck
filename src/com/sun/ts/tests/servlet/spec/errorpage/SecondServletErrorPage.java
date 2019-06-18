/*
 * Copyright (c) 2007, 2018 Oracle and/or its affiliates. All rights reserved.
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
 * $URL$ $LastChangedDate$
 */

package com.sun.ts.tests.servlet.spec.errorpage;

import com.sun.ts.tests.servlet.common.util.Data;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Simple Servlet-based error page that displays error related req attributes.
 */

public class SecondServletErrorPage extends HttpServlet {

  private static final String STATUS_CODE = "javax.servlet.error.status_code";

  private static final String EXCEPTION_TYPE = "javax.serlvet.error.exception_type";

  private static final String MESSAGE = "javax.servlet.error.message";

  private static final String EXCEPTION = "javax.servlet.error.exception";

  private static final String REQUEST_URI = "javax.servlet.error.request_uri";

  private static final String SERVLET_NAME = "javax.servlet.error.servlet_name";

  private static final String EXP_MESSAGE = "error page invoked";

  /**
   * Invoked by container
   */
  public void service(HttpServletRequest req, HttpServletResponse res)
      throws ServletException, IOException {

    PrintWriter pw = res.getWriter();
    pw.println("Second ErrorPage");
    pw.println("Servlet Name: " + req.getAttribute(SERVLET_NAME));
    pw.println("Request URI: " + req.getAttribute(REQUEST_URI));
    pw.println("Status Code: " + req.getAttribute(STATUS_CODE));
    pw.println("Exception Type: " + req.getAttribute(EXCEPTION_TYPE));
    pw.println("Exception: " + req.getAttribute(EXCEPTION));
    pw.print("Message: ");
    if (((String) req.getAttribute(MESSAGE)).indexOf(EXP_MESSAGE) > -1) {
      pw.println(EXP_MESSAGE);
    } else {
      pw.println(Data.FAILED);
    }
  }
}