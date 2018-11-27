var navs = [{
	"title": "首页",
	"icon": "fa-stop-circle",
	"href": "zhuan/index.jsp",
	"spread": false
},{
	"title": "员工管理",
	"icon": "fa-stop-circle",
	"href": "admin_user",
	"spread": false
},
{
	"title": "会员管理",
	"icon": "fa-cogs",
	"spread": false,
	"children": [{
		"title": "会员类型",
		"icon": "fa-table",
		"href": "admin_cardType"
	}, {
		"title": "会员列表",
		"icon": "fa-navicon",
		"href": "admin_cards"
	}]
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
		"href": "admin_selling"
	}]
},
{
	"title": "报表",
	"icon": "fa-cogs",
	"spread": false,
	"children": [{
		"title": "营业额",
		"icon": "fa-table",
		"href": "charts_sumprices"
	}
	,
	{
		"title": "支付方式",
		"icon": "fa-table",
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
		"icon": "fa-navicon",
		"href": "m_sumlistNumber"
	}]
},
{
	"title": "位置管理",
	"icon": "fa-stop-circle",
	"href": "admin_teahouse",
	"spread": false
},
{
	"title": "打印",
	"icon": "fa-stop-circle",
	"href": "charts/press.jsp",
	"spread": false
}
];