[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8"/>
    <title>景区列表</title>
    <link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
    <script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
    <script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
 	
</head>
<body>

<form id="listForm" action="list.jhtml" method="吴get">
    <div class="bar">
    	<input type="text" name="wxShopId" value="${wxShopId}" style="display:none;"/>
        <input type="text" name="searchValue" value="${pageable.searchValue}" placeholder="活动主题"/>
        <button type="submit" class="button">查询</button>
        <button type="button" class="button" onclick="location.href='list.jhtml';">重置</button>
    </div>
    <div class="bar">   
        <a href="activity.jhtml" class="button">
        ${message("admin.common.add")}
        </a>
      	<a href="javascript:;" id="deleteButton" class="button">
        ${message("admin.common.delete")}
        </a>
    </div>

    <table id="listTable" class="list">
        <tr>
            <th class="check">
                <input type="checkbox" id="selectAll"/>
            </th>
            <th>
                <a href="javascript:;" class="sort" name="name">产品ID</a>
            </th>
            <th>
                <a href="javascript:;" class="sort" name="name">微商城ID</a>
            </th>
			 <th>
                <a href="javascript:;" class="sort" name="name">活动主题</a>
            </th>       
            <th>
                <a href="javascript:;" class="sort" name="name">创建时间</a>
            </th>
			 <th>
                <a href="javascript:;" class="sort" name="name">活动状态</a>
            </th>
            <th>
                <span>${message("admin.common.handle")}</span>
            </th>

        </tr>       
    [#list page.records as productActivity]
        <tr>
        	<td>
                <input type="checkbox" name="ids" value="${productActivity.id}"/>
            </td>
        	<td>	
          		${productActivity.activityProductId}    	 
            </td>
            <td>
          		${productActivity.shopId}    	 
            </td>
            <td>	
          		${productActivity.title}	    	 
            </td>           
            <td>
            	${productActivity.createDate?string("yyyy-MM-dd HH:mm:ss")}
            </td>
            <td>
            	${productActivity.activityState}
            </td>
            <td> 
                <a  href="update.jhtml?activityProductId=${productActivity.activityProductId}&shopId=${productActivity.shopId}">[编辑]</a>             	
            </td>
        </tr>
    [/#list]
    </table>
   
	[@pagination pageNumber = page.current totalPages = page.pages]
			[#include "/admin/include/pagination2.ftl"]
	[/@pagination]
</form>
</body>
</html>