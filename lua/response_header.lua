ngx.header.Foo = 'Bar'

--无关大小写,当然，在nginx的location中使用lua_transform_underscores_in_response_headers命令可以不区分大小写
ngx.header['Foo2'] = 'Bar2'
ngx.header['foo2'] = 'bar2'

--下划线会被转换成破折号
ngx.header['Foo2_Bar'] = 'Foo2_Bar';	--output:Foo2-Bar: Foo2_Bar