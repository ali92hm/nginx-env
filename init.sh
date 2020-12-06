#!/bin/sh

cat > /usr/share/nginx/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx Env Printer!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx Env Printer!</h1>
<h3>App: ${APP_NAME}</h3>
<h3>Version: ${APP_VERSION}</h3>
<h4>Rest of the variables</h4>
<ul id="all_vars">
</ul>

    <script>
        var allVariables = "$(echo $(printenv))";
        var variableArray = allVariables.split(" ");
        for(var i = 0; i < variableArray.length; i++) {
            var node = document.createElement("LI");
            var textnode = document.createTextNode(variableArray[i]);
            node.appendChild(textnode);
            document.getElementById("all_vars").appendChild(node);
        }
    </script>
</body>
</html>
EOF
