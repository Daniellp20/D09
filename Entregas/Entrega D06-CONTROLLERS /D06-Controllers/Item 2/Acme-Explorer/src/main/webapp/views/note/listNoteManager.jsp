<%--
 * list.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="notes" requestURI="note/manager/list.do" id="row">
	
	
	
	<security:authorize access = "hasRole('MANAGER')">
	<spring:message code="note.display" var="display"/>
	<display:column title="${display}" sortable="true">
		<spring:url value="note/manager/display.do" var="editURL">
			<spring:param name="noteId" value="${row.id}" />
		</spring:url>
		<a href="${editURL}"><spring:message code="note.display" /></a>
	</display:column>
	</security:authorize>
	�
	
	<security:authorize access = "hasRole('MANAGER')">
	<spring:message code="note.reply" var="Reply" />
	<display:column title="${Reply}" sortable="true">
		<jstl:if test="${row.replyMoment==null}">
		<spring:url value="note/manager/reply.do" var="replyURL">
			<spring:param name="noteId" value="${row.id}" />
		</spring:url>
		<a href="${replyURL}"><spring:message code="note.reply" /></a>
		</jstl:if>
	</display:column>
	
	</security:authorize>
	
	
	
	<!-- Attributes -->
	
	<spring:message code="note.body" var="bodyHeader" />
	<display:column property="body" title="${bodyHeader}" sortable="true" />
	
	<spring:message code="note.format.date" var="pattern"></spring:message>
	<spring:message code="note.createdMoment" var="createdMomentHeader" />
	<display:column property="createdMoment" title="${createdMomentHeader}" sortable="true" format="${pattern}"/>
	
	<spring:message code="note.remark" var="remarkHeader" />
	<display:column property="remark" title="${remarkHeader}" sortable="true"/>
	
	<spring:message code="note.format.date" var="pattern"></spring:message>
	<spring:message code="note.replyMoment" var="replyMomentHeader" />
	<display:column property="replyMoment" title="${replyMomentHeader}" sortable="true" format="${pattern}"/>
	
	
</display:table>

