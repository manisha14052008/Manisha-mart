<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ManishaMart | Smart Shopping</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

<!-- Navigation -->
<header class="navbar">
    <div class="container nav-inner">

        <a class="brand"
           href="${pageContext.request.contextPath}/home.jsp">
            Manisha<span>Mart.</span>
        </a>

        <nav class="nav-links">
            <a class="active"
               href="${pageContext.request.contextPath}/home.jsp">
                Home
            </a>

            <a href="${pageContext.request.contextPath}/products">
                Products
            </a>

            <a href="${pageContext.request.contextPath}/orders">
                My Orders
            </a>

            <a href="${pageContext.request.contextPath}/cart">
                🛒 Cart
            </a>

            <a class="btn btn-primary"
               href="${pageContext.request.contextPath}/login">
                Login
            </a>
        </nav>

    </div>
</header>


<main class="container">

    <!-- Hero Section -->
    <section class="hero">

        <div class="hero-content">

            <span class="hero-label">
                ✨ YOUR EVERYDAY MARKETPLACE
            </span>

            <h1>
                Shop Smart.<br>
                Live Better.
            </h1>

            <p>
                Discover products you love, explore new finds,
                and enjoy a simpler shopping experience with
                ManishaMart.
            </p>

            <a class="btn"
               href="${pageContext.request.contextPath}/products">
                Explore Products &nbsp; →
            </a>

        </div>

    </section>


    <!-- Categories -->
    <section class="section">

        <h2 class="section-title">
            Explore Categories
        </h2>

        <p class="section-subtitle">
            Find something special for your everyday needs.
        </p>

        <div class="category-grid">

            <a class="category-card"
               href="${pageContext.request.contextPath}/products?category=Electronics">

                <div class="category-icon">🎧</div>

                <h3>Electronics</h3>

                <p>Everyday technology</p>

            </a>


            <a class="category-card"
               href="${pageContext.request.contextPath}/products?category=Fashion">

                <div class="category-icon">👗</div>

                <h3>Fashion</h3>

                <p>Discover your style</p>

            </a>


            <a class="category-card"
               href="${pageContext.request.contextPath}/products?category=Home">

                <div class="category-icon">🏡</div>

                <h3>Home & Living</h3>

                <p>Make life comfortable</p>

            </a>


            <a class="category-card"
               href="${pageContext.request.contextPath}/products?category=Accessories">

                <div class="category-icon">⌚</div>

                <h3>Accessories</h3>

                <p>Little things you love</p>

            </a>

        </div>

    </section>


    <!-- Featured Products -->
    <section class="section">

        <h2 class="section-title">
            Find Your Next Favourite
        </h2>

        <p class="section-subtitle">
            Browse our marketplace to discover available products.
        </p>

        <div class="content-card">

            <div class="empty-state">

                <div class="empty-icon">🛍️</div>

                <h3>Your next favourite is waiting!</h3>

                <p>
                    Visit our products page to browse listings
                    from ManishaMart sellers.
                </p>

                <a class="btn btn-primary"
                   href="${pageContext.request.contextPath}/products">
                    Browse All Products →
                </a>

            </div>

        </div>

    </section>


    <!-- Benefits -->
    <section class="section">

        <h2 class="section-title">
            Shopping Made Simpler
        </h2>

        <p class="section-subtitle">
            Everything you need for a smooth shopping journey.
        </p>

        <div class="category-grid">

            <div class="category-card">
                <div class="category-icon">🔎</div>
                <h3>Easy Discovery</h3>
                <p>Search and explore products.</p>
            </div>

            <div class="category-card">
                <div class="category-icon">🛒</div>
                <h3>Simple Cart</h3>
                <p>Manage your shopping in one place.</p>
            </div>

            <div class="category-card">
                <div class="category-icon">📦</div>
                <h3>Track Orders</h3>
                <p>Check your order history.</p>
            </div>

            <div class="category-card">
                <div class="category-icon">🤖</div>
                <h3>Smart Assistant</h3>
                <p>Get help through our chatbot.</p>
            </div>

        </div>

    </section>

</main>


<!-- Footer -->
<footer class="footer">

    <div class="container footer-inner">

        <div>
            <a class="brand" href="${pageContext.request.contextPath}/home.jsp">
                Manisha<span>Mart.</span>
            </a>

            <p>Smart Shopping. Simple Experience.</p>
        </div>

        <p>
            © 2026 ManishaMart. All rights reserved.
        </p>

    </div>

</footer>

</body>
</html>
