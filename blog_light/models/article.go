package models

import (
	//"strconv"
	"time"

	"fmt"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql" //需要添加mysql的驱动
)

type Article struct {
	Id       int
	Title    string
	Uri      string
	Keywords string
	Summary  string
	Content  string
	Author   string
	Created  int64 //创建时间,以unix为单位记时间
	Viewnum  int
	Status   int
}

//获取article table
func (this *Article) TableName() string {
	return "article"
}

//默认初始化调用init方法
func init() {
	//orm.RegisterDriver("mysql", orm.DRMySQL)
	//orm.RegisterDataBase("default", "mysql", "root:@/blog?charset=utf8", 30)
	orm.RegisterModel(new(Article))
	//orm.RunSyncdb("default", false, true)
	fmt.Println("RegisterModel Article..")
}

//获取文章
func GetArticle(id int) (Article, error) {
	o := orm.NewOrm()
	o.Using("default")
	art := Article{Id: id}
	err := o.Read(&art) //自带函数

	//if err == orm.ErrNoRows {
	//return art, nil
	//}
	return art, err
}

//更新文章
func UpdateArticle(id int, updArt Article) error {
	o := orm.NewOrm()
	o.Using("default")
	art := Article{Id: id} //beego orm默认通过id进行查找

	art.Title = updArt.Title
	art.Uri = updArt.Uri
	art.Keywords = updArt.Keywords
	art.Summary = updArt.Summary
	art.Content = updArt.Content
	art.Author = updArt.Author
	art.Status = updArt.Status
	art.Created = updArt.Created //时间不要更改
	_, err := o.Update(&art)     //自带函数
	return err
}

//更新文章
func RemoveArticle(id int) error {
	o := orm.NewOrm()
	o.Using("default")
	art := Article{Id: id}   //beego orm默认通过id进行查找
	_, err := o.Delete(&art) //自带函数
	return err
}

//添加文章
func AddArticle(updArt Article) (int64, error) {
	o := orm.NewOrm()
	o.Using("default")
	art := new(Article)

	art.Title = updArt.Title
	art.Uri = updArt.Uri
	art.Keywords = updArt.Keywords
	art.Summary = updArt.Summary
	art.Content = updArt.Content
	art.Author = updArt.Author
	art.Created = time.Now().Unix()
	art.Viewnum = 1
	art.Status = updArt.Status

	id, err := o.Insert(art) //自带函数
	return id, err
}

//文章列表
func ListArticle(condArr map[string]string, page int, offset int) (num int64, err error, art []Article) {
	o := orm.NewOrm()
	qs := o.QueryTable("article") //使用 orm.QuerySeter 进行高级查询
	cond := orm.NewCondition()
	if condArr["title"] != "" {
		cond = cond.And("title__icontains", condArr["title"])
	}
	if condArr["keywords"] != "" {
		cond = cond.Or("keywords__icontains", condArr["keywords"])
	}
	if condArr["status"] != "" {
		//status, _ := strconv.Atoi(condArr["status"])
		cond = cond.And("status", condArr["status"])
	}
	qs = qs.SetCond(cond)
	if page < 1 {
		page = 1
	}
	if offset < 1 {
		offset = 9
	}
	start := (page - 1) * offset
	var articles []Article
	num, err1 := qs.Limit(offset, start).All(&articles)
	return num, err1, articles
}

func CountArticle(condArr map[string]string) int64 {
	o := orm.NewOrm()
	qs := o.QueryTable("article")
	cond := orm.NewCondition()
	if condArr["title"] != "" {
		cond = cond.And("title__icontains", condArr["title"])
	}
	if condArr["keywords"] != "" {
		cond = cond.Or("keywords__icontains", condArr["keywords"])
	}
	if condArr["status"] != "" {
		cond = cond.And("status", condArr["status"])
	}
	num, _ := qs.SetCond(cond).Count()
	return num
}
