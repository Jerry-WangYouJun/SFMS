<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>供应商修改页面</title>
	<jsp:include page="/common.jsp"></jsp:include>
	<style type="text/css">
		table{
			font-size:12px;
		}
		textarea{
			font-size:12px;
		}
	</style>
<script type="text/javascript">
	function doServlet(){
		$.ajax({
	    	url : "${basePath}/supplier/update",
       		type:'post',  
       		data: $("#supplierForm").serialize(),
       		dataType: 'text',
       		success: function(data){
	       		if(data>0) {
	       			parent.doSearch();
	       			parent.$('#dlg-frame').dialog("close");
		       	}
       		},
       		error: function(transport) { 
       			$.messager.alert('提示',"系统产生错误,请联系管理员!","error");
        	} 
       	});
	}
	$(function(){
		initDictionarySelect("province", "#provinceCode",$("#provinceCodeDB").val());
	});
</script>
</head>
<body> 
	<form id="supplierForm" action="${basePath}/admin/SupplierServlet?flag=update" method="post">
	  <table width="100%">
	  	<tr>
	  		<td>供应商编号：</td>
	  		<td>
	  			<input type="hidden" id="id" name="id" value="${supplier.id }"/>
	  			<input type="text" name="supplierno" size="14" value="${supplier.supplierno }"/>
	  		</td>
	  		<td>供应商名称：</td>
	  		<td>
	  			<input type="text" name="suppliername" size="14" value="${supplier.suppliername }" />
	  		</td>
	  		<td>所在地区：</td>
	  		<td>
	  			<input type="hidden" id="provinceCodeDB" value="${supplier.provincecode }"/>
	  			<select id="provinceCode" name="provincecode" >
	  				<option value="">---请选择---</option>
	  			</select>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td>联系方式：</td>
	  		<td>
	  			<input type="text" id="suppliertel" name="suppliertel" size="14" value="${supplier.suppliertel }"/>
	  		</td>
	  		<td>邮箱：</td>
	  		<td>
	  			<input type="text" name="supplieremail" size="20"  value="${supplier.supplieremail }"/>
	  		</td>
	  		<td>传真：</td>
	  		<td>
	  			<input type="text" name="suppliertax" size="14" value="${supplier.suppliertax }"></input>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td>联系人姓名：</td>
	  		<td>
	  			<input type="text" name="username" size="14" value="${supplier.username }"></input>
	  		</td>
	  		<td>联系人手机：</td>
	  		<td><input type="text" name="usertel" size="14"  value="${supplier.usertel }"/></td>
	  	</tr>
	  		<tr>
	  		<td>供应商详细地址：</td>
	  		<td colspan="5">
	  			<input type="text" name="supplieraddress" size="60"  value="${supplier.supplieraddress }" />
	  		</td>
	  	</tr>
	  	<tr>
	  		<td valign="top" colspan="">备注：</td>
			<td colspan="5">
				<textarea rows="2" cols="60" name="remark">${supplier.remark }</textarea>
			</td>
	  	</tr>
	  </table>
  </form>
</body>
</html>