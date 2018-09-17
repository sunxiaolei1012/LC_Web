var navs = [{
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
		"href": "admin_card"
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
}

];