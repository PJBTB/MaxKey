<!DOCTYPE html>
<%@ page 	language="java"   import="java.util.*" 	pageEncoding="UTF-8"%>
<%@ taglib 	prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="s"  uri="http://sso.maxkey.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  	<title>Form-Based SSO Submit</title>
 	<link type="text/css" rel="stylesheet" href="<s:Base />/css/base.css"/>
  	<link rel="shortcut icon" type="image/x-icon" href="<s:Base />/images/favicon.ico"/>
	<base href="<s:BasePath/>"/>

  	<script type="text/javascript" src="<s:Base/>/jquery/jquery-1.11.2.min.js"></script>
  
  	<script type="text/javascript">
			$(function(){
				<c:if test="${true	== isExtendAttr}">
					var attrIndex = 0;
	
					function addExtendAttr(attribute,attributeValue){
						var html =  '<tr  id="extendTr_' + attrIndex + '"><td>'+attribute+'：</td><td>';   
							html += '<input type="text" id="attribute_' + attrIndex + '" name="'+attribute+'" class="" title="" value="'+attributeValue+'"/>';   
				       	 	html += '</td></tr>'; 
				       	 	
						$('#extendAttrBody').append(html);
						attrIndex++;
					}
					
					var extendAttrJson = eval("("+'${extendAttr}'+")");
					for(extendAttrIndex in extendAttrJson){
						addExtendAttr(extendAttrJson[extendAttrIndex].attr,extendAttrJson[extendAttrIndex].value);
					};
				</c:if>
				
				$("#formbasedsubmit").submit();

			});
		</script>
</head>

<body  style="display:none">
	<form id="formbasedsubmit" name="formbasedsubmit" action="${action}" method="post">
		<table>
			<tr>
				<td>username</td>
				<td><input type="text" id="identity_formbased_username" name="${usernameMapping}" value="${username}" /></td>
			</tr>
			<tr>
				<td>password</td>
				<td><input type="password" id="identity_formbased_password" name="${passwordMapping}" value="${password}" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<table>
						<tbody id="extendAttrBody"></tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input id="formbasedsubmitbutton" type="button" value="submit"/></td>
			</tr>
		</table>
	</form>
</body>
</html>
