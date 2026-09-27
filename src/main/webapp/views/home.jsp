<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>



    <style>

        /* =============================
   1. Global reset and page base
   ============================= */

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            padding-bottom: 105px;
            background: #eef5fb;
            color: #1f2d3d;
            font-family: Arial, sans-serif;
        }

        .page {
            width: 100%;
            max-width: 1000px;
            margin: 0 auto;
            padding: 26px 20px;
        }

        /* =============================
           2. Header and branding
           ============================= */

        header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 18px;
            border-bottom: 1px solid #d5e2ed;
            padding-bottom: 18px;
        }

        .logo {
            color: #229ed9;
            font-size: 20px;
            font-weight: 700;
            letter-spacing: 3px;
        }

        .logo span {
            color: #168ac1;
        }

        .status {
            color: #7b91a4;
            font-size: 12px;
            letter-spacing: 0.8px;
        }

        .username {
            margin-left: auto;
            color: #172331;
            font-size: 20px;
            font-weight: 700;
        }

        /* =============================
           3. Main layout and hero
           ============================= */

        main {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            align-items: start;
            gap: 24px;
            width: 100%;
        }

        .hero {
            grid-column: 1 / -1;
            padding: 42px 0 28px;
        }

        .eyebrow {
            color: #229ed9;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1.5px;
        }

        .hero h1 {
            max-width: 680px;
            margin: 14px 0;
            color: #172331;
            font-size: clamp(40px, 7vw, 72px);
            line-height: 0.98;
        }

        .hero h1 em {
            color: #229ed9;
            font-style: normal;
        }

        .hero p {
            max-width: 460px;
            color: #6f8292;
            line-height: 1.6;
        }

        /* =============================
           4. Feed layout
           ============================= */

        /* Each feed wrapper is repeated by your JSP loop.
           display: contents lets all post cards join one shared grid. */

        .feed {
            display: contents;
        }

        .post {
            position: relative;
            width: 100%;
            min-width: 0;
            min-height: 240px;
            padding: 24px 24px 70px;
            overflow: hidden;
            background: #ffffff;
            border: 1px solid #dce8f1;
            border-radius: 18px;
            box-shadow: 0 8px 22px rgba(90, 121, 149, 0.1);
            animation: post-entry 0.45s ease both;
        }

        .post h2 {
            max-width: 85%;
            margin: 18px 0 12px;
            color: #223447;
            font-size: 23px;
            line-height: 1.15;
        }

        .post p {
            color: #6f8292;
            line-height: 1.6;
        }

        .post:nth-of-type(2),
        .post:nth-of-type(3),
        .post:nth-of-type(4) {
            margin-top: 0;
        }

        /* =============================
           5. Post metadata and view count
           ============================= */

        .meta {
            margin-bottom: 18px;
            color: #8ba0b0;
            font-size: 12px;
        }

        .view-count {
            position: absolute;
            top: 22px;
            right: 24px;
            color: #8ba0b0;
            font-size: 13px;
            font-weight: 600;
            white-space: nowrap;
        }

        .tag {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 999px;
            background: #e3f4fc;
            color: #168ac1;
            font-size: 10px;
            font-weight: 700;
        }

        /* =============================
           6. Read link
           ============================= */

        .read-link {
            position: absolute;
            bottom: 20px;
            left: 24px;
            display: inline-flex;
            align-items: center;
            gap: 4px;
            padding-bottom: 2px;
            color: #2563eb;
            font-weight: 600;
            text-decoration: none;
            transition: color 0.2s ease;
        }

        .read-link::after {
            content: "→";
            transition: transform 0.2s ease;
        }

        .read-link:hover {
            color: #1d4ed8;
        }

        .read-link:hover::after {
            transform: translateX(4px);
        }

        /* =============================
           7. Like button
           ============================= */

        .like-button {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            border: 1px solid #d5e2ed;
            border-radius: 10px;
            padding: 9px 14px;
            background: #ffffff;
            color: #8295a5;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.2s ease,
            border-color 0.2s ease,
            color 0.2s ease,
            transform 0.2s ease;
        }

        .like-button:hover {
            border-color: #9ed5ef;
            background: #f1faff;
            color: #168ac1;
            transform: translateY(-1px);
        }

        .like-button.liked {
            border-color: #f3b5c0;
            background: #fff1f4;
            color: #e45770;
        }

        /* =============================
           8. Bottom navigation
           ============================= */

        .nav {
            position: fixed;
            z-index: 20;
            right: auto;
            bottom: 18px;
            left: 50%;
            display: flex;
            gap: 4px;
            padding: 8px;
            transform: translateX(-50%);
            border: 1px solid #dce8f1;
            border-radius: 18px;
            background: #ffffff;
            box-shadow: 0 10px 28px rgba(90, 121, 149, 0.22);
            white-space: nowrap;
        }

        .nav a {
            min-width: 72px;
            padding: 9px 8px;
            border-radius: 12px;
            color: #8ba0b0;
            font-size: 11px;
            text-align: center;
            text-decoration: none;
            transition: background 0.2s ease,
            color 0.2s ease,
            transform 0.2s ease;
        }

        .nav a:hover,
        .nav a.active {
            background: #e3f4fc;
            color: #168ac1;
        }

        .nav a:hover {
            transform: translateY(-2px);
        }

        .icon {
            display: block;
            margin-bottom: 4px;
            font-size: 22px;
            line-height: 1;
        }

        /* =============================
           9. Animation
           ============================= */

        @keyframes post-entry {
            from {
                opacity: 0;
                transform: translateY(12px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* =============================
           10. Responsive layout
           ============================= */

        @media (max-width: 700px) {
            main {
                grid-template-columns: 1fr;
            }

            .hero {
                grid-column: auto;
            }

            .status {
                display: none;
            }

            .post {
                min-height: 220px;
            }
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
<div class="page"><header><div class="logo">Blog<span></span></div><div class="status">HOME</div>
    <% if ( session.getAttribute("username") != null ) { %>
    <div class="username">${sessionScope.get("username")}</div>
    <%}%>
</header>
<div class="page">
    <main>
        <section class="hero"><div class="eyebrow">YOUR BOARD / TODAY</div><h1>Make the next move <em>visible.</em></h1><p>A focused place for ideas, decisions, and updates that move the work forward.</p></section>
        <c:forEach var="post" items="${global}">

        <section class="feed">
            <article class="post"><div class="meta">${post.getFormattedCreatedAt()}</div>

                <div class="view-count">👁 ${viewCount[post.id]}</div>

                <h2>${post.title}</h2>
                <a href="/view/${post.id}" class="read-link">Read</a>
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
            </article>


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

        </section>
        </c:forEach>
    </main>
</div>
    <nav class="nav">
        <a class="active" href="${pageContext.request.contextPath}/">
            <span class="icon">⌂</span>
            <span>Home</span>
        </a>

        <a href="${pageContext.request.contextPath}/create">
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

</body>
</html>
