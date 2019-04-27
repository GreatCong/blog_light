package initial

import (
	"../utils"

	"github.com/astaxie/beego"
)

func InitTplFunc() {
	beego.AddFuncMap("date_mh", utils.GetDateMH) //我们是引用untils下的方法，重写取了一个名子，用AddFuncMap来映射
	beego.AddFuncMap("date", utils.GetDate)
	beego.AddFuncMap("avatar", utils.GetGravatar) //这个模板主要是随机加载用户评论的头像

}
