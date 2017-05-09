<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>字典管理</title>
	<jsp:include page="/common.jsp"></jsp:include>
	<script type="text/javascript">
		$(function(){
			$('#data-table').datagrid( {
				url : '${basePath}/dic/query',
				rownumbers : true,
				autoRowHeight : true, 
				singleSelect : true,
				pagination : true,
				nowrap: false,
				toolbar: [{
					text:'添加',
					iconCls: 'icon-add',
					handler: function(){addDictionary();}
				},'-',{
					text:'修改',
					iconCls: 'icon-edit',
					handler: function(){updateDictionary();}
				},'-',{
					text:'删除',
					iconCls: 'icon-remove',
					handler: function(){deleteDictionary();}
				}],
				columns:[[
				    {field : 'id',align : 'center',halign:'center',checkbox : true}, 
				    {field : 'dicno',title : '字典类型ID',halign:'center',width : 120},
				    {field : 'dictype',title : '字典类型名称',halign:'center',width : 150},
				    {field : 'diccode',title : '字典项编码',halign:'center',width : 80},
				    {field : 'dicvalue',title : '字典项值',halign:'center',width : 80}, 
				    {field : 'dicsort',title : '排序',halign:'center',width : 80}, 
				    {field : 'validateflag',title : '是否生效',halign:'center',width : 150,formatter:function(value,rowData,rowIndex){
				    	if(value == "0"){
				    		return "生效"
				    	}else if(value == "1"){
				    		return "失效"
				    	}
				    }},
				    {field : 'remark',title : '备注',halign:'center',width : 200}
				]]
			});
			
			$('#dlg-frame').dialog( {
				title : '字典管理',
				width :  600,
				height : 250,
				top:50,
				left:200,
				closed : true,
				cache : false,
				modal : true,
				buttons : [ {
					text : '确定',
					iconCls : 'icon-ok',
					handler : function() {
						if (confirm("确定执行下一步操作？")) {
							frameContent.window.doServlet();
						}
					}
				}, {
					text : '关闭',
					iconCls : 'icon-cancel',
					handler : function() {
						$('#dlg-frame').dialog("close");
					}
				} ]
			});
			
		});
		
		function doSearch(){
			var dicType = $("#dictype").val();
			var dicCode = $("#diccode").val();
			var dicValue = $("#dicvalue").val();
			$('#data-table').datagrid('reload',{
				dictype:dicType,diccode:dicCode,dicvalue:dicValue
			} );
		}
		function doClear(){
			$("#dictype").val("");
			$("#diccode").val("");
			$("#dicvalue").val("");
		}
		function addDictionary(){
			var path = "${basePath}/init/dictionary_add";
			document.getElementById('frameContent').src = path;
			$('#dlg-frame').dialog('open');
		}
		
		function updateDictionary(){
			var obj = $('#data-table').datagrid('getSelected');
			if (obj == null || obj.id == null) {
				$.messager.alert('提示', "请先选中一行(只允许单行操作)", 'error');
				return;
			}		
			var path = "${basePath}/dic/updateinit?id=" + obj.id;
			document.getElementById('frameContent').src = path;
			$('#dlg-frame').dialog('open');
		}
		
		function deleteDictionary(){
			var obj = $('#data-table').datagrid('getSelected');
			if (obj == null || obj.id == null) {
				$.messager.alert('提示', "请先选中一行(只允许单行操作)", 'error');
				return;
			}	
			var url = "${basePath}/dic/delete";
			$.ajax( {
				url : url,
				type : 'post',
				data : {
					id : obj.id
				},
				dataType : 'text',
				success : function(data) {
					if(data>0)
					doSearch();
				},
				error : function(transport) {
					$.messager.alert('提示', "系统产生错误,请联系管理员!", "error");
				}
			});
		}
	</script>
</head>
<body>
	<div id="tb" title="查询条件区" class="easyui-panel"  style="padding:3px;width:85%" iconCls="icon-search">
		<table align="center">
			<tr>
				<td><span>字典类型名称:</span></td>
				<td><input id="dictype" name="dictype"/></td>
				<td><span>字典项编码:</span></td>
				<td><input id="diccode" name="diccode"/></td>
				<td><span>字典项值:</span></td>
				<td>
					<input id="dicvalue" name="dicvalue"/>
				</td>
				<td>
					<a href="####" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="doSearch()">查询</a>
					<a href="####" class="easyui-linkbutton" plain="true" iconCls="icon-clear" onclick="doClear()">清除</a>
				</td>
			</tr>
		</table>
	</div>
	<table id="data-table" style="height:500px" title="数据列表" width="85%"></table>
	<div id="dlg-frame">
		<iframe width="99%" height="100%" name="frameContent" id="frameContent"
			frameborder="0"></iframe>
	</div>
	</body>
</html>