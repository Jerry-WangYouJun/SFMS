<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>入库查询</title>
	<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css">
	<script type="text/javascript" src="${basePath}/js/datagrid-detailview.js"></script>
	
	<script type="text/javascript">
		$(function(){
			$('#data-table').datagrid( {
				view: detailview,
				url : '${basePath}/instock/query',
				rownumbers : true,
				autoRowHeight : true, 
				singleSelect : true,
				pagination : true,
				nowrap: false,
				toolbar: [{
					text:'添加',
					iconCls: 'icon-add',
					handler: function(){addInstock();}
				},'-',{
					text:'修改',
					iconCls: 'icon-edit',
					handler: function(){updateInstock();}
				},'-',{
					text:'删除',
					iconCls: 'icon-remove',
					handler: function(){deleteInstock();}
				},'-',{
					text:'选择产品',
					iconCls: 'icon-addGoods',
					handler: function(){hangUpGoods();}
				},'-',{
					text:'记账',
					iconCls: 'icon-page-edit',
					handler: function(){confirmInstock();}
				},'-',{
					text:'详情',
					iconCls: 'icon-detail',
					handler: function(){detailInstock();}
				}],
				columns:[[
				    {field : 'id',align : 'center',halign:'center',checkbox : true}, 
				    {field : 'instockNo',title : '入库单号',halign:'center',width : 180},
				    {field : 'stockName',title : '仓库名称',halign:'center',width : 180},
				    {field : 'supplierName',title : '供货供应商名称',halign:'center',width : 180},
				    {field : 'instockState',title : '入库单状态',halign:'center',width : 80,formatter:function(value,rowData,rowIndex){
				    		if (value == "00") {
								return "创建";
							}else if (value == "02") {
								return "记账"
							} else {
								return value;
							}
				    }}, 
				    {field : 'instockDate',title : '入库日期',halign:'center',width : 100},
				    {field : 'remark',title : '备注',halign:'center',width : 200}
				]],
				detailFormatter: function(rowIndex, rowData){
					return '<div style="padding:2px"><table id="goodsGrid-' + rowIndex + '"></table></div>';  
				},
				onExpandRow:function(rowIndex, rowData){
					$('#goodsGrid-' + rowIndex).datagrid( {
						url : '${basePath}/instockDetail/search',
						queryParams:{
							instockId:rowData.id
						},
						autoRowHeight : true, 
						singleSelect : true,
						nowrap: false,
						checkOnSelect:false,
						columns:[[
								    {field : 'productno',title : '产品编号',halign:'center',width : 180},
								    {field : 'productname',title : '产品名称',halign:'center',width : 120},
								    {field : 'productstandard',title : '产品规格',halign:'center',width : 180}, 
								    {field : 'productnum',title : '产品数量',halign:'center',width : 100 ,formatter:function(value,rowData,index){
								    	if(isNaN(value)){
								    		return value;
								    	}else{
								    		return formatNum(value,2);
								    	}
								    	
								    }},
								    {field : 'unit',title : '计量单位',halign:'center',width : 80},
								    {field : 'price',title : '产品单价',halign:'center',width : 100,formatter:function(value,rowData,index){
								    	if(isNaN(value)){
								    		return value;
								    	}else{
								    		return formatNum(value,2);
								    	}
								    }},
								    {field : 'totalprice',title : '产品总价',halign:'center',width : 180,formatter:function(value,rowData,index){
								    	if(isNaN(value)){
								    		return value;
								    	}else{
								    		return formatNum(value,2);
								    	}
								    }},
								]],
						onLoadSuccess:function(){
							$('#goodsGrid-' + rowIndex).datagrid("appendRow",{
								productno:'<span class="subtotal">合计：</span>',
								productnum:'<span class="subtotal">' + getTotal("goodsGrid-" + rowIndex,"productnum") + '</span>',
								totalprice:'<span class="subtotal">' + getTotal("goodsGrid-" + rowIndex,"totalprice")  + '</span>',
							});
						},
						onSelect:function(rowIndex, rowData){
							$('#data-table').datagrid("unselectAll");
						}
					});
				}
			});
			
			$('#dlg-frame').dialog( {
				title : '入库管理',
				width :  800,
				height : 520,
				top:20,
				left:100,
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
				},{
					text : '关闭',
					iconCls : 'icon-cancel',
					handler : function() {
						$('#dlg-frame').dialog("close");
					}
				} ]
			});
			
			$('#dlg-detailFrame').dialog( {
				title : '入库管理',
				width :  900,
				height : 520,
				top:20,
				left:100,
				closed : true,
				cache : false,
				modal : true
			});
			
			//初始化下拉框
			
			//入库状态
			initDictionarySelect("stockState","#search-instockState");
			//仓库
			initStockSelect("#search-stockId");
			//供应商
			initSupplierSelect("#search-supplierId");
			
		});
		
		function doSearch(){
			var instockNo = $("#search-instockNo").val();
			var stockId = $("#search-stockId").val();
			var supplierId = $("#search-supplierId").val();
			var instockState = $("#search-instockState").val();
			var instockDateStart = $("#search-instockDateStart").datebox("getValue");
			var instockDateEnd = $("#search-instockDateEnd").datebox("getValue");
			$('#data-table').datagrid('reload',{
				instockNo:instockNo,stockId:stockId,supplierId:supplierId,instockState:instockState,
				instockDateStart:instockDateStart,instockDateEnd:instockDateEnd
			} );
		}
		function doClear(){
			$("#search-instockNo").val("");
			$("#search-stockId").val("");
			$("#search-supplierId").val("");
			$("#search-instockState").val("");
			$("#search-instockDateStart").combo("setText","");
			$("#search-instockDateStart").combo("setValue","");
			$("#search-instockDateEnd").combo("setText","");
			$("#search-instockDateEnd").combo("setValue","");
		}
		function addInstock(){
			var path = "${basePath}/instock/save_input";
			document.getElementById('frameContent').src = path;
			$('#dlg-frame').dialog('open');
		}
		
		function updateInstock(){
			var obj = $('#data-table').datagrid('getSelected');
			if (obj == null || obj.id == null) {
				$.messager.alert('提示', "请先选中一行(只允许单行操作)", 'error');
				return;
			}		
			if(obj.instockState != "00"){
				$.messager.alert('提示', "当前选中的入库申请单状态不是【创建状态】,无法进行[修改]操作！", 'error');
				return;
			}
			var path = "${basePath}/instock/save_input/" + obj.id;
			document.getElementById('frameContent').src = path;
			$('#dlg-frame').dialog('open');
		}
		
		function deleteInstock(){
			var obj = $('#data-table').datagrid('getSelected');
			if (obj == null || obj.id == null) {
				$.messager.alert('提示', "请先选中一行(只允许单行操作)", 'error');
				return;
			}	
			if(obj.instockState != "00"){
				$.messager.alert('提示', "当前选中的入库申请单状态不是【创建状态】,无法进行[删除]操作！", 'error');
				return;
			}
			$.messager.confirm("操作提示", "确定要进行删除操作么?", function(data){
				if(data){
					var url = "${basePath}/instock/delete/"+obj.id;
					$.ajax( {
						url : url,
						type : 'post',
						data : $("#dataForm").serialize(),
						dataType : 'json',
						success : function(data) {
							$.messager.alert('提示', data.msg);
							doSearch();
						},
						error : function(transport) {
							$.messager.alert('提示', "系统产生错误,请联系管理员!", "error");
						}
					});
				}
			});
		}
		
		function hangUpGoods(){
			var obj = $('#data-table').datagrid('getSelected');
			if (obj == null || obj.id == null) {
				$.messager.alert('提示', "请先选中一行(只允许单行操作)", 'error');
				return;
			}
			if(obj.instockState != "00"){
				$.messager.alert('提示', "当前选中的入库申请单状态不是【创建状态】,无法进行[选择产品]操作！", 'error');
				return;
			}
			var path = "${basePath}/instock/hang/" + obj.id;
			document.getElementById('frameContent').src = path;
			$('#dlg-frame').dialog('open');
		}
		
		function detailInstock(){
			var obj = $('#data-table').datagrid('getSelected');
			if (obj == null || obj.id == null) {
				$.messager.alert('提示', "请先选中一行(只允许单行操作)", 'error');
				return;
			}
			var path = "${basePath}/instock/detail/" + obj.id;
			document.getElementById('frameDetailContent').src = path;
			$('#dlg-detailFrame').dialog('open');
		}
		
		function confirmInstock(){
			var obj = $('#data-table').datagrid('getSelected');
			if (obj == null || obj.id == null) {
				$.messager.alert('提示', "请先选中一行(只允许单行操作)", 'error');
				return;
			}	
			if(obj.instockState != "00"){
				$.messager.alert('提示', "当前选中的入库申请单状态不是【创建状态】,无法进行[记账]操作！", 'error');
				return;
			}
			var url = "${basePath}/instock/confirm/" + obj.id;
			$.ajax( {
				url : url,
				type : 'post',
				data : {
				},
				dataType : 'json',
				success : function(data) {
					$.messager.alert('提示', data.msg);
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
		<span>入库单号:</span>
		<input id="search-instockNo" name="instockNo"/>
		<span>所在仓库:</span>
		<select id="search-stockId" name="stockId">
			<option value="">---请选择---</option>
		</select> 
		<span>供货供应商:</span>
		<select id="search-supplierId" name=supplierId>
			<option value="">---请选择---</option>
		</select> <br/>
		<span>入库单状态:</span>
		<select id="search-instockState" name="instockState">
			<option value="">---请选择---</option>
		</select>
		<span>入库日期:</span>
		<input id="search-instockDateStart" class="easyui-datebox"  name="instockDateStart" data-options="editable:false"/>-
		<input id="search-instockDateEnd" class="easyui-datebox"  name="instockDateEnd" data-options="editable:false"/>
		<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="doSearch()">查询</a>
		<a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-clear" onclick="doClear()">清除</a>
	</div>
	<form:form id="dataForm" action="${basePath}/instock/delete" method="post">
		<input type="hidden" name="_method" value="DELETE"/>
		<table id="data-table" style="height:510px" title="数据列表" width="85%"></table>
	</form:form>
	<div id="dlg-frame">
		<iframe width="99%" height="98%" name="frameContent" id="frameContent"
			frameborder="0"></iframe>
	</div>
	<div id="dlg-detailFrame">
		<iframe width="99%" height="98%" name="frameDetailContent" id="frameDetailContent"
			frameborder="0"></iframe>
	</div>
	
</body>
</html>