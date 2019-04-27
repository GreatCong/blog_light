package initial

import (
	"fmt"
)

func init() {
	InitSql() //注册数据库
	InitTplFunc()
	fmt.Println("init ok")
}
