package main

import (
	_ "./initial" //这样会自动调用init (下划线的意思是只是引用init方法)
	_ "./routers"
	"github.com/astaxie/beego"
	"html/template"
	"net/http"
)

//go的调用顺序是main -> init
func main() {
	beego.ErrorHandler("404", page_not_found)
	beego.Run()
}

func page_not_found(rw http.ResponseWriter, r *http.Request) {
	t, _ := template.New("404.tpl").ParseFiles("views/404.tpl") //显示404页面

	data := make(map[string]interface{})
	data["content"] = "page not found"
	t.Execute(rw, data)
}
