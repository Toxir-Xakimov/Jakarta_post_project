<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View post</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            min-height: 100vh;
            background: #eef5fb;
            color: #1f2d3d;
            font-family: Arial, sans-serif;
            padding-bottom: 110px;
        }

        .page {
            max-width: 900px;
            margin: auto;
            padding: 26px 20px;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 18px;
            border-bottom: 1px solid #d5e2ed;
            padding-bottom: 18px;
        }

        .logo {
            color: #229ed9;
            font-size: 22px;
            font-weight: bold;
            letter-spacing: 3px;
        }

        .logo span { color: #168ac1; }
        .status { color: #7b91a4; font-size: 12px; }

        .username {
            color: #172331;
            font-size: 17px;
            font-weight: bold;
        }


        .post-card {
            position: relative;
            background: white;
            border: 1px solid #dce8f1;
            border-radius: 20px;
            padding: 34px;
            box-shadow: 0 12px 30px rgba(90, 121, 149, .13);
            padding: 34px;
        }

        .post-title {
            margin: 0 0 18px;
            color: #172331;
            font-size: clamp(34px, 6vw, 58px);
            line-height: 1;
            overflow-wrap: anywhere;
        }

        .post-meta {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 30px;
            color: #8ba0b0;
            font-size: 13px;
        }

        .post-content {
            border-top: 1px solid #e4edf3;
            padding-top: 26px;
            color: #4d6374;
            font-size: 16px;
            line-height: 1.8;
            white-space: pre-wrap;
            overflow-wrap: anywhere;
        }


        .post-actions {
            display: flex;
            align-items: center;
            gap: 10px;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        /* Common Button Styles */
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            padding: 8px 14px;
            font-size: 13px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.2s ease-in-out;
            border: 1px solid transparent;
            outline: none;
            user-select: none;
        }

        /* Icon Sizing */
        .btn-icon {
            width: 16px;
            height: 16px;
        }

        /* Active Click Shrink Effect */
        .btn:active {
            transform: scale(0.97);
        }

        /* Update Button Style (Modern Indigo/Blue) */
        .btn-update {
            background-color: #EEF2FF;
            color: #4338CA;
            border-color: #C7D2FE;
            position: relative;
        }

        .btn-update:hover {
            background-color: #4338CA;
            color: #FFFFFF;
            border-color: #4338CA;
            box-shadow: 0 2px 4px rgba(67, 56, 202, 0.2);
        }

        /* Remove Button Style (Soft Red / Destructive) */
        .btn-remove {
            background-color: #FEF2F2;
            color: #DC2626;
            border-color: #FECACA;
            position: relative;
        }

        .btn-remove:hover {
            background-color: #DC2626;
            color: #FFFFFF;
            border-color: #DC2626;
            box-shadow: 0 2px 4px rgba(220, 38, 38, 0.2);
        }

        /* Focus outline for accessibility */
        .btn:focus-visible {
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.4);
        }


        .nav {
            position: fixed;
            z-index: 10;
            left: 50%;
            bottom: 18px;
            transform: translateX(-50%);
            display: flex;
            gap: 4px;
            padding: 8px;
            background: white;
            border: 1px solid #dce8f1;
            border-radius: 18px;
            box-shadow: 0 10px 28px rgba(90, 121, 149, .22);
        }

        .nav a {
            min-width: 72px;
            padding: 9px 8px;
            border-radius: 12px;
            color: #8ba0b0;
            font-size: 11px;
            text-align: center;
            text-decoration: none;
        }



        .view-count {
            position: absolute;
            top: 22px;
            right: 28px;
            color: #8ba0b0;
            font-size: 13px;
            font-weight: 600;
        }




        .nav a:hover { background: #e3f4fc; color: #168ac1; }
        .icon { display: block; margin-bottom: 4px; font-size: 22px; line-height: 1; }

        @keyframes appear {
            from { opacity: 0; transform: translateY(12px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 600px) {
            header { align-items: flex-start; flex-wrap: wrap; }
            .username { width: 100%; order: 3; }
            .post-container { margin-top: 35px; }
            .post-card { padding: 23px; }
            .post-actions { justify-content: stretch; }
            .action-button { flex: 1; text-align: center; }
            .nav { width: calc(100% - 20px); justify-content: space-between; }
            .nav a { min-width: 0; flex: 1; padding: 8px 3px; font-size: 10px; }
        }
    </style>
</head>
<body>
<div class="page">
    <header>
        <div class="logo">Blog</div>
        <div class="status">POST VIEW</div>
        <% if ( session.getAttribute("username") != null ) { %>
        <div class="username">${sessionScope.get("username")}</div>
        <%}%>
    </header>
        <article class="post-card">

            <div class="view-count">👁 ${viewCount}</div>

            <h1 class="post-title">
                ${post.title}
            </h1>

            <div class="post-meta">
                <span>By <strong><%=session.getAttribute("username")%></strong></span>
                <span>•</span>
                <span>${post.getFormattedCreatedAt()}</span>
            </div>

            <div class="post-content">
                ${post.content}
            </div>

            <form method="post">
            <a href="/like/${post.id}">
                <button
                        type="button"
                        class="like-button ${likeResults[post.id].liked ? 'liked' : ''}">

                <span id="heart">${likeResults[post.id].liked ? '♥' : '♡'}</span>
                <span id="likeCount">${likeResults[post.id].likeCount}</span>
                </button>
            </a>
            </form>

            <style>
                .like-button {
                    border: 1px solid #d5e2ed;
                    border-radius: 10px;
                    padding: 9px 14px;
                    background: white;
                    color: #8295a5;
                    cursor: pointer;
                    font-size: 16px;
                }

                .like-button.liked {
                    color: #e45770;
                    border-color: #f3b5c0;
                    background: #fff1f4;
                }
            </style>
            <c:if test = "${post.user_id == sessionScope.id}">

                <div class="post-actions">
                    <a href="/updt/${post.id}">
                        <button class="btn btn-update" type="button">
                            <svg class="btn-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10" />
                            </svg>
                        </button>
                    </a>

                    <a href="/remove/${post.id}">
                        <button class="btn btn-remove" type="button">
                            <svg class="btn-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
                            </svg>
                        </button>
                    </a>
                </div>

            </c:if>
        </article>
    </main>
</div>

<nav class="nav">
    <a href="${pageContext.request.contextPath}/"><span class="icon">⌂</span>Home</a>
    <a href="${pageContext.request.contextPath}/create"><span class="icon">＋</span>Create</a>
    <a class="active" href="${pageContext.request.contextPath}/my_uploads"><span class="icon">↥</span>Uploads</a>
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
</body>
</html>