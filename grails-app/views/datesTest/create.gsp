

<%@ page import="jquerydatepickertag.DatesTest" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'datesTest.label', default: 'DatesTest')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>

        <!-- This needs to be here in order for the jqueryDatePicker TagLib to work -->
        <g:javascript src="jquery/jquery-1.4.4.js" />
        <g:javascript src="jquery/ui/jquery.ui.core.js"/>
        <g:javascript src="jquery/ui/jquery.ui.widget.js"/>
        <g:javascript src="jquery/ui/jquery.ui.datepicker.js"/>

    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${datesTestInstance}">
            <div class="errors">
                <g:renderErrors bean="${datesTestInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dob"><g:message code="datesTest.dob.label" default="Dob" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: datesTestInstance, field: 'dob', 'errors')}">
                                    <!-- <g:datePicker name="dob" precision="day" value="${datesTestInstance?.dob}"  /> -->

                                    <!-- My custom Jquery DatePicker that does the binding to the field in the domain class -->
                                    <g:jqDatePicker name="dob"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateRegistered"><g:message code="datesTest.dateRegistered.label" default="Date Registered" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: datesTestInstance, field: 'dateRegistered', 'errors')}">
                                    <!--<g:datePicker name="dateRegistered" precision="day" value="${datesTestInstance?.dateRegistered}"  /> -->

                                    <!-- My custom Jquery DatePicker that does the binding to the field in the domain class -->
                                    <g:jqDatePicker name="dateRegistered"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateEnrolled"><g:message code="datesTest.dateEnrolled.label" default="Date Enrolled" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: datesTestInstance, field: 'dateEnrolled', 'errors')}">
                                    <!--<g:datePicker name="dateEnrolled" precision="day" value="${datesTestInstance?.dateEnrolled}"  /> -->

                                    <!-- My custom Jquery DatePicker that does the binding to the field in the domain class -->
                                    <g:jqDatePicker name="dateEnrolled"/>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
