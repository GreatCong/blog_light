package controllers

import (
	"github.com/astaxie/beego"
)

type BaseController struct {
	beego.Controller //继承了默认的controler
	isLogin          bool
}

//验证登录
func (this *BaseController) Prepare() {
	userLogin := this.GetSession("userLogin")
	if userLogin == nil {
		this.isLogin = false
	} else {
		this.isLogin = true
	}
	this.Data["isLogin"] = this.isLogin
}

//404信息
func (this *BaseController) Go404() {
	this.TplName = "404.tpl"
	return
}
