<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<input type="text" id="username">&nbsp;<span id="helpSpan"></span>
<script>
    (function () {
        function creatXmlHttp() {
            var xmlHttp = null;
            if (window.ActiveXObject) {
                xmlHttp = new ActiveXObject("MicroSoft.xmlHttp");
            } else {
                xmlHttp = new XMLHttpRequest();
            }
            return xmlHttp;
        }

        document.querySelector("#username").onchange = function () {
            var username = this.value;
            var xmlHttp = creatXmlHttp();
            //客户端中文转换encodeURIComponent(username)
            xmlHttp.open("get", "/checkusername?username=" + encodeURIComponent(username));
            xmlHttp.onreadystatechange = function () {
                var readystate = xmlHttp.readyState;
                if (readystate == 4) {
                    var httpState = xmlHttp.status;
                    if (httpState == 200) {
                        var result = xmlHttp.responseText;
                        if (result == "yes") {
                            document.querySelector("#helpSpan").innerText = "√";
                        } else {
                            document.querySelector("#helpSpan").innerText = "该名称已被占用！";
                        }
                    } else {
                        alert("服务器请求异常:" + httpState);
                    }
                }
            };
            xmlHttp.send();
        }
    })();
</script>
</body>
</html>
