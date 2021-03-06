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
	    	url : "${basePath}/immune/update",
       		type:'post',  
       		data: $("#immuneForm").serialize(),
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
		//initDictionarySelect("province", "#provinceCode",$("#provinceCodeDB").val());
		 var option = $("option");
		 for(var i = 0 ; i < option.length ; i ++){
			  if("${immune.immunetype }" == option[i].value){
				  option[i].selected = "selected";
			  }
			 	  
		 }
	});
</script>
</head>
<body> 
	<form id="immuneForm" action="${basePath}/admin/SupplierServlet?flag=update" method="post">
	<input type="hidden" value = "${immune.id }"  name = "id">
	  <table width="100%">
	  	<tr>
	  		<td>疫苗名称：</td>
	  		<td>
	  			<input type="text" name="immunename" size="14"  value="${immune.immunename }"/>
	  		</td>
	  		
	  		<td>疫苗类型：</td>
	  		<td>
	  			<select id="immunetype" name="immunetype"  >
	  				<option value="">----请选择----</option>
	  				<option value="羊痘疫苗">羊痘疫苗</option>
	  				<option value="口蹄疫疫苗">口蹄疫疫苗</option>
	  				<option value="羊三联四防疫苗">羊三联四防疫苗</option>
	  			</select>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td>羊群类型：</td>
	  		<td>
	  			<input type="text" name="sheeptype" size="14" value="${immune.sheeptype }" />
	  		</td>
	  		<td>间隔时间（月）：</td>
	  		<td>
	  			<input type="text" id="intervals" name="intervals" size="14" value="${immune.intervals }" />
	  		</td>
	  	</tr>
	  	<tr>
	  		<td>是否必须：</td>
	  		<td>
	  			<input type="text" name="necessary" size="14" value="${immune.necessary }" />
	  		</td>
	  		<td valign="top" colspan="">备注：</td>
			<td >
				<textarea rows="2" cols="18" name="remark" >${immune.remark }</textarea>
			</td>
	  	</tr>
	  </table>
  </form>
</body>
</html>