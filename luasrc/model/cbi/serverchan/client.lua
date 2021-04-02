f = SimpleForm("zospusher")
luci.sys.call("/usr/bin/zospusher/zospusher client")
f.reset = false
f.submit = false
f:append(Template("zospusher/client"))
return f
