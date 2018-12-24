var navs = [{
	"title": "首页",
	"icon": "fa-home",
	"href": "zhuan/index.jsp",
	"spread": false
},{
	"title": "员工管理",
	"icon": "fa-users",
	"href": "admin_user",
	"spread": false
},
{
	"title": "会员管理",
	"icon": "fa-user",
	"spread": false,
	"children": [{
		"title": "会员类型",
		"icon": "fa-table",
		"href": "admin_cardType"
	}, {
		"title": "会员列表",
		"icon": "fa-navicon",
		"href": "admin_cards"
	},{
		"title":"旧卡",
		"icon":"fa-credit-card",
		"href":"old_card"
	}
	]
},
{
	"title": "订单记录",
	"icon": "fa-file-text",
	"href": "admin/order.jsp",
	"spread": false
},
{
	"title": "商品管理",
	"icon": "fa-cogs",
	"spread": false,
	"children": [{
		"title": "商品类型",
		"icon": "fa-table",
		"href": "admin_sellingtype"
	}, {
		"title": "商品列表",
		"icon": "fa-navicon",
		"href": "admin_sellings"
	}]
},
{
	"title": "报表",
	"icon": "fa-line-chart",
	"spread": false,
	"children": [{
		"title": "营业额",
		"icon": "fa-jpy",
		"href": "charts_sumprices"
	}
	,
	{
		"title": "支付方式",
		"icon": "fa-money",
		"href": "charts_paytype"
	},
	/*{
		"title": "会员卡",
		"icon": "fa-table",
		"href": "admin_sellingtype"
	}
	,
	{
		"title": "支付宝",
		"icon": "fa-table",
		"href": "admin_sellingtype"
	}
	,
	{
		"title": "微信",
		"icon": "fa-table",
		"href": "admin_sellingtype"
	}*/
	
	{
		"title": "烟酒",
		"icon": "fa-navicon",
		"href": "admin_selling"
	}, {
		"title": "库存",
		"icon": "fa-indent",
		"href": "m_sumlistNumber"
	},{
		"title": "业绩",
		"icon": "fa-list-alt",
		"href": "admin_PerEvaluation"
	}]
},
{   
	"title": "位置管理",
	"icon": "fa-globe",
	"href": "admin_teahouse",
	"spread": false
},
{
	"title": "打印",
	"icon": "fa-pencil-square",
	"href": "charts/press.jsp",
	"spread": false
},
{
	"title": "日志",
	"icon": "fa-book",
	"href": "log_get",
	"spread": false
},

];