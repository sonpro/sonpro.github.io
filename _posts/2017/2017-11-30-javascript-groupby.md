---
layout: "post"
title: "javascript groupby"
date: "2017-11-30 00:39"
categories : javascript
tag:groupby
---


# Javascript function : groupby

자바스크립트에서 object array의 groupby

```javascript

var data = [
                {"name":"a","age":"10"}
                ,{"name":"b","age":"10"}
                ,{"name":"a","age":"30"}
                ,{"name":"a","age":"100"}
                ,{"name":"a","age":"100"}
                ,{"name":"b","age":"30"}
              ];

  $.each(data, function(){
    console.log("key="+this.name+" val="+this.age);
  });

  var data2 = groupByName(data);

  console.log("---> after");
  $.each(data2, function(){
    console.log("key="+this.name+" val="+this.age);
  });

//grouping key word를 받도록 개선할 수 있을듯하다
//현재버전은 grouping key는 고정
//underscore.js 라는 library 에서  확장기능을 제공해준다
  function groupByName(obj){
    var result = new Array();
    $.each(obj, function(){
      var idx = result.map(function(x){return x.name;}).indexOf(this.name);
      if(idx==-1){
        result.push(this);
      }else{
        result[idx].age = parseInt(result[idx].age) + parseInt(this.age);
      }
    });
    return result;
  }

```

>참고 
> [wikipedia : underscore.js](https://en.wikipedia.org/wiki/Underscore.js)
> [blog : underscore](http://seoh.blog/2012/10/09/getting-cozy-with-underscore-js/)
