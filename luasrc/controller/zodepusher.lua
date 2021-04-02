module("luci.controller.zospusher",package.seeall)

function index()

	if not nixio.fs.access("/etc/config/zospusher")then
		return
	end

	entry({"admin", "services", "zospusher"}, alias("admin", "services", "zospusher", "setting"),_("推送服务"), 30).dependent = true
	entry({"admin", "services", "zospusher", "setting"}, cbi("zospusher/setting"),_("配置"), 40).leaf = true
	entry({"admin", "services", "zospusher", "advanced"}, cbi("zospusher/advanced"),_("高级设置"), 50).leaf = true
	entry({"admin", "services", "zospusher", "client"}, form("zospusher/client"), "在线设备", 80)
	entry({"admin", "services", "zospusher", "log"}, form("zospusher/log"),_("日志"), 99).leaf = true
	entry({"admin", "services", "zospusher", "get_log"}, call("get_log")).leaf = true
	entry({"admin", "services", "zospusher", "clear_log"}, call("clear_log")).leaf = true
	entry({"admin", "services", "zospusher", "status"}, call("act_status")).leaf=true
end

function act_status()
	local e={}
	e.running=luci.sys.call("ps|grep -v grep|grep -c zospusher >/dev/null")==0
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end

function get_log()
	luci.http.write(luci.sys.exec(
		"[ -f '/tmp/zospusher/zospusher.log' ] && cat /tmp/zospusher/zospusher.log"))
end

function clear_log()
	luci.sys.call("echo '' > /tmp/zospusher/zospusher.log")
end