
<%@ page import="jquerydatepickertag.DatesTest" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'datesTest.label', default: 'DatesTest')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'datesTest.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="dob" title="${message(code: 'datesTest.dob.label', default: 'Dob')}" />
                        
                            <g:sortableColumn property="dateRegistered" title="${message(code: 'datesTest.dateRegistered.label', default: 'Date Registered')}" />
                        
                            <g:sortableColumn property="dateEnrolled" title="${message(code: 'datesTest.dateEnrolled.label', default: 'Date Enrolled')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${datesTestInstanceList}" status="i" var="datesTestInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${datesTestInstance.id}">${fieldValue(bean: datesTestInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${datesTestInstance.dob}" /></td>
                        
                            <td><g:formatDate date="${datesTestInstance.dateRegistered}" /></td>
                        
                            <td><g:formatDate date="${datesTestInstance.dateEnrolled}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${datesTestInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
