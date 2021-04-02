f = SimpleForm("zospusher")
f.reset = false
f.submit = false
f:append(Template("zospusher/log"))
return f
