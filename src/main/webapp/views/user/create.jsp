<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Create post</title>
    <style>
        *{box-sizing:border-box}body{margin:0;min-height:100vh;background:#eef5fb;color:#1f2d3d;font-family:Arial,sans-serif;padding-bottom:105px}.page{max-width:900px;margin:auto;padding:26px 20px}header{display:flex;justify-content:space-between;align-items:center;border-bottom:1px solid #d5e2ed;padding-bottom:18px}.logo{font-size:20px;font-weight:bold;letter-spacing:3px;color:#229ed9}.logo span{color:#168ac1}.status{color:#7b91a4;font-size:12px}.content{max-width:700px;margin:55px auto 0}.eyebrow{color:#229ed9;font-size:12px;letter-spacing:1.5px;font-weight:bold}.content h1{font-size:clamp(40px,7vw,70px);line-height:.98;margin:14px 0}.content h1 em{color:#229ed9;font-style:normal}.intro{color:#6f8292;line-height:1.6}.form-card{background:#fff;border:1px solid #dce8f1;border-radius:18px;padding:28px;margin-top:28px;box-shadow:0 10px 25px #5a79951a}label{display:block;margin:16px 0 7px;font-size:12px;color:#607789;font-weight:bold}input,textarea{width:100%;padding:13px 14px;border:1px solid #d4e1eb;border-radius:10px;background:#f8fbfd;color:#1f2d3d}textarea{min-height:160px;resize:vertical}button{width:100%;margin-top:22px;padding:14px;border:0;border-radius:10px;background:#229ed9;color:#fff;font-weight:bold;cursor:pointer}button:hover{background:#168ac1}.nav{position:fixed;bottom:18px;left:50%;transform:translateX(-50%);display:flex;gap:4px;padding:8px;background:#fff;border:1px solid #dce8f1;border-radius:18px;box-shadow:0 10px 28px #5a799530}.nav a{min-width:72px;padding:9px;color:#8ba0b0;text-align:center;text-decoration:none;font-size:11px;border-radius:12px}.nav a:hover,.nav a.active{background:#e3f4fc;color:#168ac1}.icon{display:block;font-size:23px;margin-bottom:4px}.username{font-weight: bold;font-size: 25px;color: #172331;}
        .nav {
            position: fixed;
            z-index: 20;
            left: 50%;
            bottom: 18px;
            transform: translateX(-50%);
            display: flex;
            gap: 4px;
            padding: 8px;
            background: white;
            border: 1px solid #dce8f1;
            border-radius: 18px;
            box-shadow: 0 10px 28px rgba(90, 121, 149, 0.22);
            white-space: nowrap;
        }

        .nav a {
            min-width: 72px;
            padding: 9px 8px;
            border-radius: 12px;
            color: #8ba0b0;
            text-align: center;
            text-decoration: none;
            font-size: 11px;
            transition: 0.2s ease;
        }

        .nav a:hover {
            background: #e3f4fc;
            color: #168ac1;
            transform: translateY(-2px);
        }

        .icon {
            display: block;
            margin-bottom: 4px;
            font-size: 22px;
            line-height: 1;
        }

        @media (max-width: 600px) {
            .nav {
                width: calc(100% - 20px);
                justify-content: space-between;
            }

            .nav a {
                min-width: 0;
                flex: 1;
                padding: 8px 3px;
                font-size: 10px;
            }

            .icon {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
<div class="page"><header><div class="logo">Blog<span></span></div><div class="status">CREATE</div>
<% if ( session.getAttribute("username") != null ) { %>
    <div class="username">${sessionScope.get("username")}</div>
<%}%>
</header>
    <main class="content"><div class="eyebrow">CREATE / NEW POST</div><h1>Share the <em>idea.</em></h1><p class="intro">Write an observation, decision, or update that helps people make a better next move.</p><section class="form-card"><form  method="post"><label for="title">Title</label><input id="title" name="title" type="text" required><input type="hidden" name="user_id" value="<%=session.getAttribute("id")%>"><label for="body">Post content</label><textarea id="body" name="content" required></textarea><a href="/create"><button type="submit">Publish post</button></a></form></section></main></div>
<nav class="nav">
    <a href="${pageContext.request.contextPath}/">
        <span class="icon">⌂</span>
        <span>Home</span>
    </a>

    <a class="active" href="${pageContext.request.contextPath}/create">
        <span class="icon">＋</span>
        <span>Create</span>
    </a>

    <a href="${pageContext.request.contextPath}/my_uploads">
        <span class="icon">↥</span>
        <span>Uploads</span>
    </a>
    <% if (session.getAttribute("id") == null) { %>
    <a href="${pageContext.request.contextPath}/login">
        <span class="icon">⇥</span>
        <span>Login</span>
    </a>

    <a href="${pageContext.request.contextPath}/reg">
        <span class="icon">♙</span>
        <span>Register</span>
    </a>
    <%} else {%>

    <a href="${pageContext.request.contextPath}/logout">
        <span class="icon">⇥</span>
        <span>Logout</span>
    </a>

    <%}%>
</nav>
</body></html>
